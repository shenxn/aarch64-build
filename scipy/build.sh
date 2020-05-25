#!/bin/bash

set -ex

# Test
VERSION=`cat VERSION`
cat "test" > scipy-${RELEASE}-cp36-cp36m-linux_aarch64.whl

# # Install dependencies
# apt-get update
# DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
#     build-essential gfortran \
#     curl ca-certificate \
#     libopenblas-dev python3-dev python3-numpy python3-setuptools python3-wheel

# # Download source code
# cd /build
# VERSION=`cat VERSION`
# URL=https://github.com/scipy/scipy/releases/download/v${VERSUIB}/scipy-${VERSION}.tar.gz
# curl -L $URL -o scipy.tar.gz
# tar -zxvf scipy.tar.gz
# mv scipy-* scipy
# cd scipy

# # Setup library
# LIB_PATH=/usr/lib/aarch64-linux-gnu
# export BLAS=${LIB_PATH}/libblas.so
# export LAPACK=${LIB_PATH}/liblapack.so
# export ATLAS=${LIB_PATH}/libatlas.so

# # Multi core build
# export NPY_NUM_BUILD_JOBS=`nproc --all`

# python3 setup.py bdist_wheel

# # Move out wheel and cleanup
# mv dist/*.whl ../
# cd ../
# rm -rf scipy
