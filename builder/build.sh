#!/bin/bash
set -euo pipefail

TMP_DIR=$PWD/../tmp
DST_DIR=${PWD}/../astyle_py

docker build -t emsdk .
mkdir -p ${TMP_DIR}
cp build_inner.sh ${TMP_DIR}
docker run --rm -v ${TMP_DIR}:/work -w /work emsdk ./build_inner.sh
cp ${TMP_DIR}/astyle/build/gcc/bin/libastyle.wasm ${DST_DIR}/
