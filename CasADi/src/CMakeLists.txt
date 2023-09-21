cmake_minimum_required(VERSION 3.10)
project(casadi_example)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(casadi REQUIRED)
find_package(Eigen3 REQUIRED)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE casadi Eigen3::Eigen)