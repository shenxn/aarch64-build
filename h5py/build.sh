#!/bin/bash

set -ex

# Install dependencies
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential gfortran pkg-config \
    curl ca-certificates \
    libhdf5-dev \
    python3-dev python3-setuptools python3-wheel python3-pip python3-numpy
pip3 install Cython
export LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/hdf5/serial:$LD_LIBRARY_PATH

# Download source code
VERSION=`cat VERSION`
curl -OL https://github.com/h5py/h5py/releases/download/${VERSION}/h5py-${VERSION}.tar.gz
tar -zxvf h5py-${VERSION}.tar.gz
cd h5py-${VERSION}

# Multi core build
export NPY_NUM_BUILD_JOBS=`nproc --all`

python3 setup.py bdist_wheel

# Move out wheel
mv dist/*.whl ../