cmake_minimum_required(VERSION 2.8.3)
# Following is to add array c++ library
SET(CMAKE_CXX_FLAGS "-std=c++11 -O3")

project(hydrophone)
# Eigen is matrix tool
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  genmsg
  cmake_modules
)

find_package(Eigen REQUIRED)
generate_messages( DEPENDENCIES std_msgs)

catkin_package()

add_definitions(-std=c99)

include_directories(include ${catkin_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} ${GSTREAMER_INCLUDE_DIRS} ) 


#rosbuild_add_library(TF src/hydropub.cpp src/main.cpp src/MUSIC.c)

add_executable(hydropub src/hydropub.cpp )




target_link_libraries(hydropub ${catkin_LIBRARIES})
add_dependencies(hydropub hydropub_generate_messages_cpp)

add_executable(main src/main.cpp src/MUSIC.c)




target_link_libraries(main ${catkin_LIBRARIES})
add_dependencies(main main_generate_messages_cpp)

