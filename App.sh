#!/bin/bash

# ANSI ESCAPE CODE (WARNA)
# Digunakan untuk mempercantik output CLI
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"

# ARRAY (Struktur Data)
# Menyimpan daftar ID dan nama sebagai data dinamis
data_ids=()
data_names=()

# FUNCTION: Menampilkan Menu (tanpa parameter)
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

# FUNCTION Dengan Parameter
# Menampilkan pesan sukses dengan warna
success_msg() {
    echo -e "${GREEN}$1${RESET}"
}

# FUNCTION Dengan Parameter
# Menampilkan pesan error
error_msg() {
    echo -e "${RED}$1${RESET}"
}

# VALIDASI ID (HARUS ANGKA)
# Operator perbandingan digunakan disini
valid_number() {
    if ! [[ "$1" =~ ^[0-9]+$ ]]; then
        error_msg "ID harus berupa angka!"
        return 1
    fi
    return 0
}

# CEK DUPLIKASI ID
is_duplicate_id() {
    for id in "${data_ids[@]}"; do
        if [[ "$id" == "$1" ]]; then
            error_msg "ID sudah digunakan!"
            return 1
        fi
    done
    return 0
}

# FUNGSI TAMBAH DATA
# - Input: ID & Nama
# - Validasi: Tidak kosong, ID harus angka, tidak duplikat
# - Menggunakan Array untuk menyimpan data
add_data() {
    read -p "Masukkan ID: " id

    # VALIDASI INPUT KOSONG
    if [[ -z "$id" ]]; then
        error_msg "ID tidak boleh kosong!"
        return
    fi

    # VALIDASI ID ANGKA
    valid_number "$id" || return

    # CEK DUPLIKASI
    is_duplicate_id "$id" || return

    read -p "Masukkan Nama: " name
    if [[ -z "$name" ]]; then
        error_msg "Nama tidak boleh kosong!"
        return
    fi

    # MENAMBAHKAN KE ARRAY
    data_ids+=("$id")
    data_names+=("$name")

    success_msg "Data berhasil ditambahkan!"
}

# FUNCTION MELIHAT DATA
# Loop digunakan untuk menampilkan semua data
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

# FUNCTION EDIT DATA
# Operator perbandingan digunakan untuk mencari ID
edit_data() {
    read -p "Masukkan ID yang ingin diedit: " id

    valid_number "$id" || return

    found=0

    for ((i=0; i<${#data_ids[@]}; i++)); do
        if [[ "${data_ids[$i]}" == "$id" ]]; then
            found=1
            read -p "Masukkan Nama baru: " new_name
            if [[ -z "$new_name" ]]; then
                error_msg "Nama baru tidak boleh kosong!"
                return
            fi
            data_names[$i]="$new_name"
            success_msg "Data berhasil diperbarui!"
            break
        fi
    done

    if [[ $found -eq 0 ]]; then
        error_msg "Data tidak ditemukan!"
    fi
}

# FUNCTION HAPUS DATA
# Menggunakan unset untuk menghapus elemen array
delete_data() {
    read -p "Masukkan ID yang ingin dihapus: " id

    valid_number "$id" || return

    found=0

    for ((i=0; i<${#data_ids[@]}; i++)); do
        if [[ "${data_ids[$i]}" == "$id" ]]; then
            found=1
            unset 'data_ids[i]'
            unset 'data_names[i]'

            # Reindex array agar tidak bolong
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

# LOOP UTAMA (Perulangan)
# Program berjalan terus hingga user memilih keluar
while true; do
    show_menu
    read -p "Pilih menu: " choice

    # KONDISI - CASE
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
