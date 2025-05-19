#!/bin/bash

# Hapus file hasil kompilasi
find . -type f -name "*.o" -o -name "*.lo" -o -name "*.la" -o -name "*.a" -o -name "*.so" -exec rm -f {} +

# Hapus file konfigurasi sementara
rm -f config.status config.log Makefile

# Hapus folder cache autotools
rm -rf autom4te.cache

# Hapus folder build dan hasil binari umum (jika ada)
rm -rf build bin obj

# Hapus folder Git lama (jika ada)
rm -rf .git

# Hapus file log
find . -type f -name "*.log" -exec rm -f {} +

# Beri tahu pengguna
echo "File tidak penting telah dihapus. Proyek siap di-upload ke GitHub."
