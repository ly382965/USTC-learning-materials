cmake_minimum_required(VERSION 3.14)

project(BinaryTree)

set(CMAKE_CXX_STANDARD 17)

add_executable(test src/main.cpp
            src/HuffmanTree.cpp
            include/HuffmanTree.h
            src/ExpressionBinaryTree.cpp
            include/ExpressionBinaryTree.h
            src/BinaryTree.cpp
            include/BinaryTree.h    
)