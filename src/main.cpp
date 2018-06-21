//ROS dependencies
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float32.h"
#include "std_msgs/MultiArrayLayout.h" //for array
#include "std_msgs/MultiArrayDimension.h" //for array
#include "std_msgs/Float64MultiArray.h" //for array
//C++ library
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <array>
extern "C" {
  #include "MUSIC.h"
}
//#include "MUSIC.h"
float** Arr = (float**) malloc( 1000 * sizeof(float*));
int count = 0;
int cal_count = 0;
void arrayCallback(const std_msgs::Float64MultiArray::ConstPtr& array)
{

  int i = 0;
  float sample[10];
  for(/*std::vector<std::array<float, 90>>::const_iterator*/ auto it = array->data.begin();it != array->data.end(); ++it){
    sample[i] = *it;
    i++;
  }
  Arr[count] =  (float*) malloc(i * sizeof(float));
  i = 0;
  if(/*zero_array(sample) == 1*/ count <100){
    for(/*std::vector<std::array<float, 90>>::const_iterator*/ auto it = array->data.begin();it != array->data.end(); ++it){
      Arr[count][i] = *it;
      printf("%f \t", Arr[count][i]);
      i++;
    }
    printf("\n");
    count= count + 1;
    cal_count = 0;
  }
  else if(/*zero_array(sample) == 0 && cal_count == 0*/ count >= 100){
    printf("road to EofA\n");
    //some function to solve
    //float EoArray[4][4];
    //float** EoArr = EofArray(Arr,i, count);
    cal_count = 1;
    count = 0;
    printf("\n");
    /*for (int i = 0; i < 4; i++){
      for (int j = 0; j < 4; j++){
        printf("%f \t",EoArr[i][j]);
      }
      printf("\n");
    }
    printf("\n");*/
  }

  //float *add = give_heading(Arr,i);
  //printf("%f \t", *add);
  //printf("\n");

 //printf("%f \n",greetings(Arr[0]));
  //printf("\n");
  return;
  //ROS_INFO("%d", msg->another_field);
  //ROS_INFO("first point: x=%.2f, y=%.2f", msg->points[0].x, msg->points[0].y);
  //return;

}


/*void clbk(const my_pkg::my_msg::ConstPtr& msg) {
    ROS_INFO("%d", msg->another_field);
    ROS_INFO("first point: x=%.2f, y=%.2f", msg->points[0].x, msg->points[0].y);
}
*/
/*void chatterCallback(const std_msgs::Float32& msg)
{
  ROS_INFO("I heard: [%f]", msg->data);
}
*/
int main(int argc, char **argv)
{
  ros::init(argc, argv, "main");
  
  ros::NodeHandle n;
  printf("first time in subscriber\n");

  //ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);

  ros::Subscriber array_sub = n.subscribe("Input_data", 1000, arrayCallback);

  //ros::Subscriber array_sub = n.subscribe("input_data", 1000);
 // printf("%f, ", Arr[0]);

  //printf("%f", sub->data.begin());
  /**
    * ros::spin() will enter a loop, pumping callbacks.  With this version, all
    * callbacks will be called from within this thread (the main one).  ros::spin()
    * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
    */
  ros::spin();
    //printf("%f, ", Arr[0]);

  /*for(int j = 1; j < 90; j++)
  {
    printf("%f, ", Arr[j]);
  }

 
  printf("\n");*/
// printf("%f \n ", Arr[0]);
  return 0;
}
