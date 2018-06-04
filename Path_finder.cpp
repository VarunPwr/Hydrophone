#include<stdio.h>
#include<limits.h>

const int m = 5;
const int n = 5;

int path[m][n];
int cost[m][n];
/*
int path[3][3];
void matrix_generator(int m, int n){
	for(int i = 0; i < m; i++)
		for(int j=0; i < n; j++)
			path[i][j] = 0;
}
*/	/*
int cost[3][3] = { {1, 2, 3}, // recursive function is checked
                      {1, 8, 2},
                      {1, 1, 3} };
int path_printer(int *path,int m, int n){
	for(int i = 0; i < m; i++){
		for(int j=0; j < n; j++){
			printf("%d \t", *((cost+i*n) + j));
		}
		printf("\n");
	}
	return 0;
}*/
int min_2(int x, int y){
	if(x > y)
		return y;
	else 
		return x;
}
int path_finder(int x, int y, int *cost,int *path) {
	//mapping
/*	for(int i = 0; i < x; i++){
		for(int j=0; j< y; j++){
			printf("%d \t",*(cost + i*n  + j));
		}
		printf("\n");
	}*/
	if(*(cost + (x-1)*n + y) == 1 && *(cost + x*n + y-1) == 1){
		if(x == 0 && y == 0)
			return 0;
		else if(x != 0 && y != 0)
			return *(cost + x*n + y) + min_2(path_finder(x,y-1,(int *)cost,(int *)path),path_finder(x-1,y,(int *)cost,(int *)path));
		else if(y == 0)
			return *(cost + x*n + y) + path_finder(x-1,y,(int *)cost,(int *)path);
		else if(x == 0)
			return *(cost + x*n + y) + path_finder(x,y-1,(int *)cost,(int *)path); 
		}	
}

void print(int *arr, int m, int n)
{
    for(int i = 0; i < m; i++){
		for(int j=0; j < n; j++){
			printf("%d \t", *((arr+i*n) + j));
		}
		printf("\n");
	}

}
 
int main()
{
	
	for(int i = 0; i < m; i++)
		for(int j=0; j< n; j++){
			path[i][j] = 0;
			cost[i][j] = 1;
		}
	cost[m-1][n-1] = 1;
	cost[2][2] = 1;
	cost[3][3] = 10;
	cost[2][3] = 1;
	// We can also use "print(&arr[0][0], m, n);"
    print((int *)cost, m, n);
    printf(" %d \n", path_finder(m-1,n-1,(int *)cost,(int *)path));
   /* for(int i = 0; i < m; i++){
		for(int j=0; j< n; j++){
			printf("%d \t",*(cost[0] + i*n  + j));
		}
		printf("\n");
	}*/
    //print((int *)path, m, n);
    
    return 0;
}