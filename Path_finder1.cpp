#include<iostream>
#include<complex>
using namespace std;
float *D;
void grid_generator(float *D){
	D = (float *)malloc(1000*sizeof(double));
	for(int i=0;i < 25; i++)
		for(int j=0;j < 25; j++)
			*(D+i*25+j) =.1 + i*25+j;//contains coordinates and its feasiblility 1 0 
}
int main(){
	int ini_point[] = {1.2};
	int fin_point[] = {10,10};
	grid_generator(D);
	return 0;
}