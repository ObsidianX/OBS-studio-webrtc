# CEF Stuff
# wget --quiet --retry-connrefused --waitretry=1 https://obs-nightly.s3-us-west-2.amazonaws.com/cef_binary_3.3282.1726.gc8368c8_macosx64.tar.bz2
# tar -xf ./cef_binary_3.3282.1726.gc8368c8_macosx64.tar.bz2
mv ./cef_binary_3.3282.1726.gc8368c8_macosx64 ./cef_binary_macosx64
cd ./cef_binary_macosx64
# remove a broken test
sed -i '.orig' '/add_subdirectory(tests\/ceftests)/d' ./CMakeLists.txt
# target 10.11
sed -i '.orig' s/\"10.9\"/\"10.11\"/ ./cmake/cef_variables.cmake
mkdir build
cd ./build
cmake -DCMAKE_CXX_FLAGS="-std=c++11 -stdlib=libc++" -DCMAKE_EXE_LINKER_FLAGS="-std=c++11 -stdlib=libc++" -DCMAKE_OSX_DEPLOYMENT_TARGET=10.11 ..
make -j4
mkdir libcef_dll
cd ../../


