#!/usr/bin/python3

import rospy
import numpy as np
from math import sin, cos, atan2, pi

# Import some key libraries
from geometry_msgs.msg import Twist
from tf.transformations import euler_from_quaternion
from gazebo_msgs.msg import ModelStates

#gains
k1 = 1
k2 = 1

current_pose = [0, 0, 0]
goal_pose = [2,2]
THRESHOLD = 0.1

def pose_callback(msg):
    global current_pose

    pose = np.array([
        msg.pose[1].position.x,
        msg.pose[1].position.y,
        msg.pose[1].position.z
    ])

    orientation = np.array(euler_from_quaternion([
        msg.pose[1].orientation.x,
        msg.pose[1].orientation.y,
        msg.pose[1].orientation.z,
        msg.pose[1].orientation.w,
    ]))
    current_pose = [pose[0], pose[1], orientation[2]]

# Define the cartesian_controller function that does the computation
def cartesian_controller(x,y,theta,k1,k2):
    v = -k1 * (x * cos(theta) + y * sin(theta))
    w = k2 * (atan2(y,x) + pi - theta)
    # We want back the desired linear and angular velocities
    return v, w

def main():

    rospy.init_node("cartesian_controller")

    # Build the topics name
    pose_topic = "/gazebo/model_states"
    cmd_topic = "/cmd_vel"

    # Declare publishers and subscribers
    rospy.Subscriber(pose_topic, ModelStates, pose_callback)
    cmd_vel_pub = rospy.Publisher(cmd_topic, Twist, queue_size=10)

    rate = rospy.Rate(50)
    
    ts = 0.02    

    # Use the try-except paradigm to catch exceptions and prevent possible dangerous behaviors
    try:
        # v ### Control Loop ### v #
        while not rospy.is_shutdown():

            x, y, theta = get_current_state()

            # Compute here the desired velocities
            v, w = cartesian_controller(x, y, theta, k1, k2)
        
            # Publish here the control inputs
            apply_control_inputs(v, w, cmd_vel_pub)

        # ^ ### Control Loop ### ^ #
     
    if abs(goal_pose[0] - x) < THRESHOLD and abs(goal_pose[1] - y) < THRESHOLD:
                print("Goal reached.")
                break

    rospy.sleep(ts)

    except Exception as e:
        print(" An Exception occurred during the control loop. Terminating gracefully.")
        print(" Exception: ", e)

    # Publish here the last control values to stop the robot
    apply_control_inputs(0, 0, cmd_vel_pub)

if __name__ == "__main__":
    main()
