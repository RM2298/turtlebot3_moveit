#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image, PointCloud2
from sensor_msgs import point_cloud2
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np

class ImageToPointCloud:
    def __init__(self):
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)
        self.point_cloud_pub = rospy.Publisher("/camera/point_cloud", PointCloud2, queue_size=10)

    def image_callback(self, data):
        try:
            # Converte l'immagine da ROS a OpenCV
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            rospy.logerr(e)
            return

        # Converte l'immagine in una nuvola di punti
        point_cloud = self.image_to_pointcloud(cv_image, data.header)

        # Pubblica la nuvola di punti
        self.point_cloud_pub.publish(point_cloud)

    def image_to_pointcloud(self, cv_image, header):
        height, width, channels = cv_image.shape

        # Creazione della nuvola di punti
        points = []
        for v in range(height):
            for u in range(width):
                color = cv_image[v, u]
                z = 1.0  # Imposta una profondità fissa o calcolata
                x = (u - width / 2) * z / 500.0  # Parametri di conversione arbitrari
                y = (v - height / 2) * z / 500.0
                r = color[2]
                g = color[1]
                b = color[0]
                a = 255
                points.append([x, y, z, r, g, b, a])

        # Conversione in PointCloud2
        cloud_data = point_cloud2.create_cloud(header, [
            point_cloud2.PointField('x', 0, point_cloud2.PointField.FLOAT32, 1),
            point_cloud2.PointField('y', 4, point_cloud2.PointField.FLOAT32, 1),
            point_cloud2.PointField('z', 8, point_cloud2.PointField.FLOAT32, 1),
            point_cloud2.PointField('r', 12, point_cloud2.PointField.UINT8, 1),
            point_cloud2.PointField('g', 13, point_cloud2.PointField.UINT8, 1),
            point_cloud2.PointField('b', 14, point_cloud2.PointField.UINT8, 1),
            point_cloud2.PointField('a', 15, point_cloud2.PointField.UINT8, 1)
        ], points)
        return cloud_data

if __name__ == '__main__':
    rospy.init_node('image_to_pointcloud')
    ImageToPointCloud()
    rospy.spin()
