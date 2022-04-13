# -*- coding: utf-8 -*-
"""
Created on Fri Apr  8 19:16:20 2022

@author: user
"""

import matplotlib.pyplot as plt
from skimage import io,color
from skimage.transform import rotate

img = io.imread('image2.jpg')
grey = color.rgb2gray(img)

img_rotate = rotate(grey, angle=45)

fig,axes = plt.subplots(1, 2, figsize = (8,4))
ax = axes.ravel()

ax[0].imshow(img)
ax[0].set_title("Color")

ax[1].imshow(img_rotate, cmap=plt.cm.gray)
ax[1].set_title("Rotate Image")

plt.show()


