#include <iostream>
#include <opencv2/opencv.hpp>


__global__ void myKernel(void) {
}

int main(void) {
	myKernel <<<1, 1>>>();
	printf("Hello CUDA!\n");
	return 0;
}