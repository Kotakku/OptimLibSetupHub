cmake_minimum_required(VERSION 3.10)
project(hpipm_example)

find_package(hpipm REQUIRED)
find_package(blasfeo REQUIRED)

add_executable(${PROJECT_NAME} main.c)
target_link_libraries(${PROJECT_NAME} hpipm blasfeo m)