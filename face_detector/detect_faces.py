import cv2
import numpy as np
import urllib.request
import sys
import os

url = sys.argv[1]
path = os.path.dirname(os.path.abspath(__file__))

response = urllib.request.urlopen(url)
image = np.asarray(bytearray(response.read()), dtype='uint8')
image = cv2.imdecode(image, cv2.IMREAD_COLOR)

gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
face_cascade = cv2.CascadeClassifier(path + '/haarcascade_frontalface_alt.xml')
faces = face_cascade.detectMultiScale(gray)
faces = [[x, y, x + shift_x, y + shift_y] for x, y, shift_x, shift_y in faces]

print(faces)
