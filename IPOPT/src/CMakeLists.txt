cmake_minimum_required(VERSION 3.10)
project(ipopt_example)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# pkg-configにipoptを見つけてもらう
find_package(PkgConfig REQUIRED)
pkg_check_modules(IPOPT REQUIRED ipopt)

add_executable(${PROJECT_NAME} main.cpp MyNLP.cpp)

# https://github.com/robotology/superquadric-lib/issues/2
target_compile_definitions(${PROJECT_NAME} PUBLIC -DHAVE_CSTDDEF)

target_link_libraries(${PROJECT_NAME} ${IPOPT_LIBRARIES})
target_include_directories(${PROJECT_NAME} PUBLIC ${IPOPT_INCLUDE_DIRS})



