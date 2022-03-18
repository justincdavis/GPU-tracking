cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(kcfgpu LANGUAGES CXX CUDA)
enable_language(CUDA)

# find_package(OpenCV REQUIRED)
find_package(OpenCV 4.5.1 PATHS /home/jcdavis/lib/)
include_directories(${OpenCV_INCLUDE_DIRS})

# Add OpenCV headers location to your include paths
include_directories( ${/home/jcdavis/include/opencv4/opencv2/} )
include_directories(AFTER ${/home/jcdavis/include/opencv4/opencv2/})

find_package(CUDA REQUIRED)
set(CUDA_SEPARABLE_COMPILATION ON)
set(CUDA_PROPAGATE_HOST_FLAGS OFF)
set(CUDA_HOST_COMPILER /usr/bin/g++)
list( APPEND CUDA_NVCC_FLAGS "-O3 --gpu-architecture compute_72 -std=c++11")
cuda_add_executable( main src/main.cpp src/trackerKCFparallel.cu)

add_executable(kcfgpu src/main.cpp)
add_executable(test src/test.cu)
target_link_libraries(kcfgpu)