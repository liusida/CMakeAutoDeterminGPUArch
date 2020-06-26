cmake_minimum_required(VERSION 3.12.0)
project(c6070 LANGUAGES CXX CUDA)

add_executable(c6070 main.cu)

find_package(CUDA) # for CUDA_SELECT_NVCC_ARCH_FLAGS function
CUDA_SELECT_NVCC_ARCH_FLAGS(ARCH_FLAGS)

message("CUDA_SELECT_NVCC_ARCH_FLAGS returns: " ${ARCH_FLAGS})
list(LENGTH ARCH_FLAGS FLAG_LENGTH)
message("Flag length: " ${FLAG_LENGTH})

if(NOT DEFINED CUDA_DEBUG)
  set(CUDA_DEBUG "-G or not" ON)
  message("Set CUDA_DEBUG to ON.")
endif(NOT DEFINED CUDA_DEBUG)

if (CUDA_DEBUG)
    set(CUDA_OPTIONS $<$<COMPILE_LANGUAGE:CUDA>:-G ${ARCH_FLAGS}>)
else (CUDA_DEBUG)
    set(CUDA_OPTIONS $<$<COMPILE_LANGUAGE:CUDA>: ${ARCH_FLAGS}>)
endif(CUDA_DEBUG)

target_compile_options(c6070 PUBLIC ${CUDA_OPTIONS})

set(CMAKE_VERBOSE_MAKEFILE OFF) #turn on if we want to debug in compilation.
