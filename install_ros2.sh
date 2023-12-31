apt update
apt install software-properties-common curl -y
add-apt-repository universe -y
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" |  tee /etc/apt/sources.list.d/ros2.list > /dev/null
apt update
apt upgrade -y
apt install ros-humble-ros-base ros-dev-tools -y
git clone https://github.com/mrjoe3012/epsrc-2023 /epsrc-2023 --recursive
rosdep init
rosdep update
rosdep install --from-paths /epsrc-2023 --ignore-src -r -y --rosdistro=humble
