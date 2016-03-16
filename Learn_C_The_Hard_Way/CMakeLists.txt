cmake_minimum_required(VERSION 3.3)
project(Learn_C_The_Hard_Way)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES
    ex15.c
    ex16-1.c
    ex16.c
    ex17-1.c
    ex17-2.c
    ex17.c
    pointer.c)

add_executable(Learn_C_The_Hard_Way ${SOURCE_FILES})