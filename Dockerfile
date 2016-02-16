FROM osrf/ubuntu_armhf:trusty
MAINTAINER Salah Missri syrianspock@gmail.com

# setup environment
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# setup keys
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
ENV ROS_DISTRO indigo
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    python-catkin-tools \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

# install ros packages
RUN apt-get update && apt-get install -y \
    ros-indigo-robot=1.1.4-0* \
    ros-indigo-navigation \
    ros-indigo-xacro \
    ros-indigo-robot-state-publisher \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
COPY ros_entrypoint.sh /

ENTRYPOINT ["./ros_entrypoint.sh"]
CMD ["bash"]
