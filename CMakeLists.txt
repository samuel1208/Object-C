cmake_minimum_required (VERSION 2.8)
set(CMAKE_INSTALL_PREFIX ${PROJECT_BINARY_DIR}/../bin/)
project (test-objc)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin/)
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin/)

include(GNUstepModule.cmake REQUIRED)
include_directories(${PROJECT_SOURCE_DIR}/c++/inc ${PROJECT_SOURCE_DIR}/c/inc ${PROJECT_SOURCE_DIR}/object-c/inc)

aux_source_directory(${PROJECT_SOURCE_DIR}/c/src  file_src)
aux_source_directory(${PROJECT_SOURCE_DIR}/c++/src file_src)
aux_source_directory(${PROJECT_SOURCE_DIR}/object-c/src file_src)


add_executable(test-objc ${file_src})
set_gnustep_compile_options (${PROJECT_SOURCE_DIR}/object-c/src)
set_gnustep_link_options (test-objc)

