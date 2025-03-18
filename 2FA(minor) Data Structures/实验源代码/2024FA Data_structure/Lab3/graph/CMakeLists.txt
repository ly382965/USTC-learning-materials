cmake_minimum_required(VERSION 3.14)

project(Graph)

set(CMAKE_CXX_STANDARD 17)

add_executable(main src/main.cpp
            src/graph.cpp
            include/graph.h
	    src/dijkstra.cpp
            include/dijkstra.h
)