cmake_minimum_required(VERSION 3.14)
set(CMAKE_CXX_STANDARD 17)
project(structures)
file(GLOB source
  "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp"
  "${INCLUDE_DIR}/*.h"
)
add_library(${PROJECT_NAME} ${source})
target_include_directories(${PROJECT_NAME} 
  PUBLIC ${INCLUDE_DIR}
)
