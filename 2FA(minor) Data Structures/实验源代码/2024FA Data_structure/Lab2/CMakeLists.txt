cmake_minimum_required(VERSION 3.14)

project(
  "DATA_STRUCTURE_LAB"
  VERSION 1.0
  LANGUAGES C CXX
)

set(CMAKE_CXX_STANDARD 17)

set(INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include")
add_subdirectory(src)