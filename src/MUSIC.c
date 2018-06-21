    //insertion_sort.c file
    #include "hydrophone/MUSIC.h"
    #include <stdio.h>
    #include <stdlib.h>
	//#include <iostream>
	//#include <Eigen/Dense>
	//using Eigen::MatrixXd;

    int zero_array(float*);

    float* give_heading(float* Arr, int nosig){
        static float** U ;
        static int count = 0;
        // a big change should come here as I don't know how many samples I am going to get in a duty cycle
        if (zero_array(Arr) == 1){
            printf("I am in MUSIC \n ");

            U[count]  = (float*) malloc(nosig * sizeof(float));
    	    for(int i =0; i < nosig; i++){
                U[count][i] = Arr[i];
            }
            for(int i =0; i < nosig; i++){
                printf("%f \t", U[count][i]);
            }
            count = count + 1;
        }
        printf("\n I am out of MUSIC \n ");
        return Arr;
    }

    int zero_array(float* Arr){
        return 0;//subject to change depending on whether the signal, duty cycle
    }
    //both indexes start from 1
    float** EofArray(float** Arr, int x, int y){
        //float EoArray[4][4];
        float **EoArray = (float **)malloc(4 * sizeof(float *));
    // for each row allocate Cols ints
    for (int i = 0; i < 4; i++) {
        EoArray[i] = (int *)malloc(4 * sizeof(int));
    }
        printf("I am inside EofA\n");
        for (int j = 0; j < y; j++){
            EoArray[0][0] = Arr[j][0] * Arr[j][0];
            EoArray[1][0] = Arr[j][1] * Arr[j][0];
            EoArray[2][0] = Arr[j][2] * Arr[j][0];
            EoArray[3][0] = Arr[j][3] * Arr[j][0];
            EoArray[0][1] = EoArray[2][1];
            EoArray[1][1] = Arr[j][1] * Arr[j][1];
            EoArray[2][1] = Arr[j][2] * Arr[j][1];
            EoArray[3][1] = Arr[j][3] * Arr[j][1];
            EoArray[0][2] = EoArray[2][0];
            EoArray[1][2] = EoArray[2][1];
            EoArray[2][2] = Arr[j][2] * Arr[j][2];
            EoArray[3][2] = Arr[j][2] * Arr[j][3];
            EoArray[0][3] = EoArray[3][0];
            EoArray[1][3] = EoArray[3][1];
            EoArray[2][3] = EoArray[3][2];
            EoArray[3][3] = Arr[j][3] * Arr[j][3];
        }
        printf("\n");
        for (int i = 0; i < 4; i++){
            for (int j = 0; j < 4; j++){
                printf("%f \t",EoArray[i][j]);
            }
            printf("\n");
        }
        printf("\n");
        return EoArray;
    }
