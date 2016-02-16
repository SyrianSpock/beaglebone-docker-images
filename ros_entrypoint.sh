#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
export ROS_IP=localhost
export ROS_MASTER_URI=http://localhost:11311

exec "$@"
