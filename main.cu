#include <iostream>
__global__ void kernel() {
    printf("test\n");
}
int main(int, char**) {
    kernel<<<1,2>>>();
    cudaDeviceSynchronize();
    std::cout << "Hello, world!\n";
}
