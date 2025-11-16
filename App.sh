#!/bin/bash

# ANSI ESCAPE CODE (WARNA)
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"

# ARRAY (Struktur Data)
data_ids=()
data_names=()

# ID OTOMATIS DIMULAI DARI 1
current_id=1

# TAMPILKAN MENU
show_menu() {
    echo -e "${CYAN}"
    echo "=============================="
    echo "   APLIKASI PENGELOLA DATA"
    echo "=============================="
    echo -e "${RESET}"
    echo "1. Tambah Data"
    echo "2. Lihat Data"
    echo "3. Edit Data"
    echo "4. Hapus Data"
    echo "0. Keluar"
    echo ""
}

# PESAN SEDERHANA
success_msg() { echo -e "${GREEN}$1${RESET}"; }
error_msg()   { echo -e "${RED}$1${RESET}"; }

# TAMBAH DATA (ID OTOMATIS)
add_data() {
    read -p "Masukkan Nama: " name

    # Validasi nama
    if [[ -z "$name" ]]; then
        error_msg "Nama tidak boleh kosong!"
        return
    fi

    # Tambahkan data ke array
    data_ids+=("$current_id")
    data_names+=("$name")

    # Tampilkan pesan sukses
    success_msg "Data berhasil ditambahkan! (ID = $current_id)"

    # Naikkan ID otomatis
    current_id=$((current_id + 1))
}

# LIHAT DATA
view_data() {
    echo -e "${YELLOW}=== DAFTAR DATA ===${RESET}"

    if [[ ${#data_ids[@]} -eq 0 ]]; then
        error_msg "Belum ada data!"
        return
    fi

    for ((i=0; i<${#data_ids[@]}; i++)); do
        echo "ID: ${data_ids[$i]} | Nama: ${data_names[$i]}"
    done
}

# EDIT DATA
edit_data() {
    read -p "Masukkan ID yang ingin diedit: " id

    # Validasi ID harus angka
    if ! [[ "$id" =~ ^[0-9]+$ ]]; then
        error_msg "ID harus berupa angka!"
        return
    fi

    found=0

    for ((i=0; i<${#data_ids[@]}; i++)); do
        if [[ "${data_ids[$i]}" == "$id" ]]; then
            found=1
            read -p "Masukkan Nama baru: " new_name

            if [[ -z "$new_name" ]]; then
                error_msg "Nama tidak boleh kosong!"
                return
            fi

            data_names[$i]="$new_name"
            success_msg "Data berhasil diperbarui!"
            break
        fi
    done

    if [[ $found -eq 0 ]]; then
        error_msg "ID tidak ditemukan!"
    fi
}

# HAPUS DATA
delete_data() {
    read -p "Masukkan ID yang ingin dihapus: " id

    # Validasi ID harus angka
    if ! [[ "$id" =~ ^[0-9]+$ ]]; then
        error_msg "ID harus berupa angka!"
        return
    fi

    found=0

    for ((i=0; i<${#data_ids[@]}; i++)); do
        if [[ "${data_ids[$i]}" == "$id" ]]; then
            found=1

            unset 'data_ids[i]'
            unset 'data_names[i]'

            # Reindex array
            data_ids=("${data_ids[@]}")
            data_names=("${data_names[@]}")

            success_msg "Data berhasil dihapus!"
            break
        fi
    done

    if [[ $found -eq 0 ]]; then
        error_msg "ID tidak ditemukan!"
    fi
}

# LOOP UTAMA
while true; do
    show_menu
    read -p "Pilih menu: " choice

    case $choice in
        1) add_data ;;
        2) view_data ;;
        3) edit_data ;;
        4) delete_data ;;
        0) echo -e "${CYAN}Program selesai!${RESET}"; exit ;;
        *) error_msg "Pilihan tidak valid!" ;;
    esac

    echo ""
done
