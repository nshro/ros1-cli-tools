FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Add ROS repository
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg2 \
        lsb-release \
        && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/ros.gpg && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ros-noetic-rosbag \
        python3-rospkg \
        python3-yaml \
        && \
    rm -rf /var/lib/apt/lists/*

# ROS environment variables
ENV ROS_DISTRO=noetic
ENV ROS_ETC_DIR=/opt/ros/noetic/etc/ros
ENV ROS_PACKAGE_PATH=/opt/ros/noetic/share
ENV ROS_PYTHON_VERSION=3
ENV PYTHONPATH=/opt/ros/noetic/lib/python3/dist-packages:${PYTHONPATH}
ENV PATH="/opt/ros/noetic/bin:${PATH}"

