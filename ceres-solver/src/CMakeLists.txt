cmake_minimum_required(VERSION 3.10)
project(ceres_solver_example)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED OFF)

find_package(Ceres REQUIRED)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} Ceres::ceres)