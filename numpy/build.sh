#!/bin/bash

set -ex

# Install dependencies
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential gfortran \
    curl ca-certificates \
    libopenblas-dev \
    python3-dev python3-setuptools python3-wheel

# Download source code
VERSION=`cat VERSION`
URL=https://github.com/numpy/numpy/releases/download/v${VERSION}/numpy-${VERSION}.tar.gz
curl -L $URL -o numpy.tar.gz
tar -zxvf numpy.tar.gz
mv numpy-* numpy
cd numpy

# Multi core build
export NPY_NUM_BUILD_JOBS=`nproc --all`

python3 setup.py bdist_wheel

# Move out wheel
mv dist/*.whl ../