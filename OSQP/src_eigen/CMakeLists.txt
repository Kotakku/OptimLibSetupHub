cmake_minimum_required(VERSION 3.10)
project(OSQP_Eigen_MPC_example)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(OsqpEigen)
find_package(Eigen3)


add_executable(${PROJECT_NAME} main.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE ${EIGEN3_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} OsqpEigen::OsqpEigen)