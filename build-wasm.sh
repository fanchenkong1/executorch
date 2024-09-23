export EMROOT=/home/fckong/emsdk/upstream/emscripten/

rm -rf cmake-out
mkdir cmake-out

emcmake cmake \
    -DCMAKE_INSTALL_PREFIX=cmake-out \
    -DEXECUTORCH_BUILD_EXTENSION_MODULE=ON \
    -DEXECUTORCH_BUILD_XNNPACK=ON \
    -DEXECUTORCH_BUILD_EXTENSION_DATA_LOADER=ON \
    -DEXECUTORCH_ENABLE_LOGGING=ON \
    -DPYTHON_EXECUTABLE=python \
    -DEXECUTORCH_BUILD_FLATC=OFF \
    -DFLATC_EXECUTABLE="$(which flatc)" \
    -DEXECUTORCH_LOG_LEVEL=Debug \
    -DEXECUTORCH_BUILD_CPUINFO=OFF \
    -DEXECUTORCH_XNNPACK_SHARED_WORKSPACE=OFF \
    -Bcmake-out . 
#     -DEXECUTORCH_LOG_LEVEL=Debug \
#     -DEXECUTORCH_BUILD_CPUINFO=OFF \
#     -DEXECUTORCH_BUILD_PTHREADPOOL=OFF \
#     -DPYTHON_EXECUTABLE=python \
#     -DEXECUTORCH_BUILD_FLATC=OFF \
#     -DFLATC_EXECUTABLE="$(which flatc)" \
#     -Bcmake-out . --trace

cmake --build cmake-out -j9 --target install --verbose

