#!/bin/bash

# Simple script to configure, build, and clean up after a successful build

echo "Cleaning up previous build..."
make distclean || echo "distclean failed, continuing..."

rm -f Makefile.in
rm -f config.status

echo "Running autogen..."
./autogen.sh || echo "autogen failed, continuing..."

echo "Running configure..."
./configure.sh

echo "Starting build process..."
if make; then
    echo "Build completed. Verifying ccminer..."

    if ./ccminer --version >/dev/null 2>&1; then
        for item in * .*; do
            if [[ "$item" == "ccminer" || "$item" == "config.json" || "$item" == "." || "$item" == ".." ]]; then
                continue
            fi
            rm -rf "$item"
        done
    else
        exit 1
    fi
else
    echo "Build failed. No files were removed."
    exit 1
fi
