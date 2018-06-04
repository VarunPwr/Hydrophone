#include<iostream>
#include<complex>
using namespace std;

int m,n;

int min(int x, int y, int z)
{
   if (x < y)
      return (x < z)? x : z;
   else
      return (y < z)? y : z;
}
/*
int path_finder(int x, int y, std::complex<double> *cost){
	
	if(x == 0 && y == 0){
	
	return real(*((cost+x*n) + y)) ;
	} 
	if(x == 0){
	return real(*((cost+x*n) + y)) + path_finder(x,y-1,(std::complex<double> *)cost);
	
	}
	if(y == 0){
	return real(*((cost+x*n) + y))  + path_finder(x-1,y,(std::complex<double> *)cost);	
	
	}
	if(x != 0 && y != 0){
	
	return real(*((cost+x*n) + y))  + min(path_finder(x,y-1,(std::complex<double> *)cost) , 1.412*path_finder(x-1,y-1,(std::complex<double> *)cost) , path_finder(x-1,y,(std::complex<double> *)cost));
	}
	
*/
 
// driver function
int main()
{    
    m=10;
	n=10;
	int *path;
	for(int i = 0; i < m; i++)
		for(int j=0; j< n; j++){
			/*std::complex<double> mycomplex(1.0,0.0);
			real(*(path+4*(i*n+j))) =  real(mycomplex);
			imag(*(path+4*(i*n+j))) =  imag(mycomplex);*/
			*(path+2*(i*n+j)) = 1;
			*(path+2*(i*n+j)+1) = 0;
			//cost[i][j] = 1;
		}
	std::cout<<sizeof(int);
	std::cout<<sizeof(std::complex<double>);
  // defines the complex number: (10 + 2i)
  std::complex<double> mycomplex(10.0, 2.0);
 
  // prints the real part using the real function
  std::cout << "Real part: " << real(mycomplex) << endl;
  std::cout << "Imaginary part: " << imag(mycomplex) << endl;
  /*std::cout<<path_finder(m,n,(std::complex<double> *)path);*/
  return 0;
}