#!/bin/bash

set -ex

# Install dependencies
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential gfortran \
    curl ca-certificates \
    python3-dev python3-setuptools python3-wheel

# Download source code
VERSION=`cat VERSION`
URL=https://github.com/numpy/numpy/releases/download/v${VERSION}/numpy-${VERSION}.tar.gz
curl -L $URL -o numpy.tar.gz
tar -zxvf numpy.tar.gz
mv numpy-* numpy
cd numpy

# Setup library
# LIB_PATH=/usr/lib/aarch64-linux-gnu
# export BLAS=${LIB_PATH}/libblas.so
# export LAPACK=${LIB_PATH}/liblapack.so
# export ATLAS=${LIB_PATH}/libatlas.so

# Multi core build
export NPY_NUM_BUILD_JOBS=`nproc --all`

python3 setup.py bdist_wheel

# Move out wheel
mv dist/*.whl ../