# turtlebot3_moveit

Docker run code: 

xhost +local:docker

    docker run --rm -it --privileged \
    --net host \
   -e DISPLAY=$DISPLAY \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v ./:/root/ws/ -w /root/ws \
   ros:studenti bash
