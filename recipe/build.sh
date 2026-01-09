#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

cmake -B build/ -S "${SRC_DIR}" ${CMAKE_ARGS} \
    -D XEUS_CPP_BUILD_TESTS=OFF \
    -D XEUS_CPP_LD_LIBRARY_PATH='${LD_LIBRARY_PATH}':"${PREFIX}/lib" \
    -D XEUS_CPP_PATH='${PATH}'

cmake --build build/ --parallel "${CPU_COUNT}"

cmake --install build/
