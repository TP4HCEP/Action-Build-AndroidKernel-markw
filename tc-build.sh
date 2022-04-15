#!/bin/bash
workdir="$GITHUB_WORKSPACE"
echo "Env..."
sudo apt update && sudo apt -y dist-upgrade
sudo apt install bc \
            binutils-dev \
            bison \
            build-essential \
            ca-certificates \
            ccache \
            clang \
            cmake \
            curl \
            file \
            flex \
            git \
            libelf-dev \
            libssl-dev \
            lld \
            make \
            ninja-build \
            python3-dev \
            texinfo \
            u-boot-tools \
            xz-utils \
            zlib1g-dev

echo "Env down..."
echo " "
echo "--------------------------"
cd $workdir
ls -la ./*
echo "--------------------------"
echo " "
git clone --depth=1 https://github.com/ClangBuiltLinux/tc-build.git
cd tc-build
./build-llvm.py
./build-binutils -t aarch64-linux-gnu
echo " "
echi "Build done"
