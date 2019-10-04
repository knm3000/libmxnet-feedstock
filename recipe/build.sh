set -ex

make -j $(nproc) USE_OPENCV=1 USE_BLAS=openblas USE_CUDA=1 USE_CUDNN=1 USE_PROFILER=1 CUDA_LIBRARY_PATH="${PREFIX}/lib/stubs" "lib/libmxnet.so"

rm -rf ${PREFIX}/include
cp -rf lib/libmxnet.so ${PREFIX}/lib
mkdir ${PREFIX}/include
cp -rf include/mxnet ${PREFIX}/include
cp -rf $(readlink -f include/dlpack) ${PREFIX}/include
cp -rf $(readlink -f include/dmlc) ${PREFIX}/include
cp -rf $(readlink -f include/mshadow) ${PREFIX}/include
cp -rf $(readlink -f include/nnvm) ${PREFIX}/include

