cmake_minimum_required(VERSION 3.10)
project(crocoddyl_example)

add_compile_options(-O3 -Wall -Wextra -Wpedantic)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Eigen3 REQUIRED)
find_package(PkgConfig REQUIRED)
pkg_check_modules(IPOPT REQUIRED ipopt)

set(CROCODDYL_INCLUDE_DIR "/opt/openrobots/include")
set(CROCODDYL_LIBRARY "/opt/openrobots/lib/libcrocoddyl.so")

add_executable(${PROJECT_NAME} main.cpp)

target_include_directories(${PROJECT_NAME} PRIVATE ${EIGEN3_INCLUDE_DIR} ${CROCODDYL_INCLUDE_DIR} ${IPOPT_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE ${CROCODDYL_LIBRARY} ${IPOPT_LIBRARIES})