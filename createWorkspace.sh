#!/bin/sh

echo "Creating the catkin_workspace..."

source /opt/ros/melodic/setup.bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/ &&  catkin_make
echo $ROS_PACKAGE_PATH
cd -

echo "Done. Creating the catkin_workspace"
