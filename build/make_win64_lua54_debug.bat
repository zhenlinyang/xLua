
mkdir build64_54_debug & pushd build64_54_debug
cmake -DLUA_VERSION=5.4.1 -G "Visual Studio 17 2022" -A x64  ..
popd
cmake --build build64_54_debug --config Debug
md plugin_lua54_debug\Plugins\x86_64
copy /Y build64_54_debug\Debug\xlua.lib plugin_lua54_debug\Plugins\x86_64\xlua.lib

pause