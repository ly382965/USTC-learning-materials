cmake_minimum_required(VERSION 3.28)
project(2048)

set(CMAKE_CXX_STANDARD 17)

add_executable(2048 src/main.cpp
        src/Game.cpp
        include/Game.h
        src/GameBoard.cpp
        include/GameBoard.h
        src/InputHandler.cpp
        include/InputHandler.h
        src/GameRender.cpp
        include/GameRender.h
)
