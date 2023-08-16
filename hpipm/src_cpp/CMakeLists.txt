cmake_minimum_required(VERSION 3.10)
project(hpipm_cpp_example)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(hpipm-cpp REQUIRED)
find_package(blasfeo REQUIRED)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} hpipm-cpp::hpipm-cpp)