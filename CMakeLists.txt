cmake_minimum_required(VERSION 2.8.3)
project(hydrophone)

# Following is to add array c++ library
SET(CMAKE_CXX_FLAGS "-std=c++11 -O3")

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  cmake_modules
)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
   INCLUDE_DIRS include
#  LIBRARIES landing_markers
   CATKIN_DEPENDS roscpp rospy std_msgs cmake_modules
#  DEPENDS system_lib
)

###########
## Build ##
###########

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

# adding C++ executable
add_executable(hydropub
  src/hydropub.cpp
)
target_link_libraries(hydropub ${catkin_LIBRARIES})

# adding C++ executable
add_executable(main
  src/main.cpp
  src/MUSIC.c
)
target_link_libraries(main ${catkin_LIBRARIES})
