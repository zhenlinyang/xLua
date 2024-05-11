if [ ! -d "$OHOS_SDK_NATIVE" ]; then
    echo "Please set OHOS_SDK_NATIVE environment."
    exit 1
fi

function build() {
    ABI=$1
    TOOLCHAIN_NAME=$2
    BUILD_PATH=build54.OpenHarmony.${ABI}
    cmake -H. -B${BUILD_PATH} -DLUA_VERSION=5.4.1 -DOHOS_ARCH=${ABI} -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=${OHOS_SDK_NATIVE}/build/cmake/ohos.toolchain.cmake -DOHOS_TOOLCHAIN=clang -DOHOS_TOOLCHAIN_NAME=${TOOLCHAIN_NAME}
    cmake --build ${BUILD_PATH} --config Release
    mkdir -p plugin_lua54/Plugins/OpenHarmony/libs/${ABI}/
    cp ${BUILD_PATH}/libxlua.so plugin_lua54/Plugins/OpenHarmony/libs/${ABI}/libxlua.so
}

build arm64-v8a aarch64-linux-ohos
