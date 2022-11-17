setlocal EnableDelayedExpansion

mkdir build
cd build

cmake ^
      -G "NMake Makefiles" ^
      -T "ClangCl" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      -DBUILD_TESTING:BOOL=OFF ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      -DJPEGXL_ENABLE_TOOLS:BOOL=ON ^
      -DJPEGXL_ENABLE_DOXYGEN:BOOL=OFF ^
      -DJPEGXL_ENABLE_MANPAGES:BOOL=OFF ^
      -DJPEGXL_ENABLE_BENCHMARK:BOOL=OFF ^
      -DJPEGXL_ENABLE_EXAMPLES:BOOL=OFF ^
      -DJPEGXL_BUNDLE_LIBPNG:BOOL=OFF ^
      -DJPEGXL_ENABLE_SJPEG:BOOL=OFF ^
      -DJPEGXL_ENABLE_SKCMS:BOOL=ON ^
      -DJPEGXL_STATIC:BOOL=OFF ^
      -DJPEGXL_FORCE_SYSTEM_BROTLI:BOOL=ON ^
      -DJPEGXL_FORCE_SYSTEM_HWY:BOOL=ON ^
      ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
