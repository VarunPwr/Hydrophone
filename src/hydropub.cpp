#include "ros/ros.h"
#include <stdio.h>
#include <stdlib.h>
#include "std_msgs/String.h"

#include "std_msgs/Float32.h"
#include <sstream>

#include "std_msgs/MultiArrayLayout.h"
#include "std_msgs/MultiArrayDimension.h"

#include "std_msgs/Float64MultiArray.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, "hydropub");

  ros::NodeHandle n;

  ros::Publisher chatter_pub = n.advertise<std_msgs::Float32>("chatter", 1000);
// two topics are published here
  ros::Publisher input_data = n.advertise<std_msgs::Float64MultiArray>("Input_data", 1000);

  ros::Rate loop_rate(10);

  int count = 0;
  while (ros::ok())
  {
    /**
      * This is a message object. You stuff it with data, and then publish it.
      */
    // check the web for more on msg
    std_msgs::Float32 msg;

    std_msgs::Float64MultiArray array;

    array.data.clear();
    //for loop, pushing data in the size of the array
    for (int i = 0; i < 4; i++)
    {
      //assign array a random number between 0 and 255.
      array.data.push_back(rand() % 255);
    }
    //Publish array
    input_data.publish(array);
    //Let the world know
    ROS_INFO("I published something!");
    //std::stringstream ss;
    //ss << "Hello Erle! " << count;
    msg.data = 17;
    for(auto it = (&array)->data.begin(); it != (&array)->data.end(); ++it)
  {
    /*Arr[i] = *it;
    i++;*/
    ROS_INFO("%f ", *it);
  }


    ROS_INFO("%f", msg.data);

    /**
      * The publish() function is how you send messages. The parameter
      * is the message object. The type of this object must agree with the type
      * given as a template parameter to the advertise<>() call, as was done
      * in the constructor above.
      */
    chatter_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }

  return 0;
}
