# -*- coding: utf-8 -*-
"""
Created on Fri Apr  8 19:16:20 2022

@author: user
"""

import numpy as np
import scipy.signal
import matplotlib.pyplot as plt
from skimage import io,color
from skimage.transform import resize

img = io.imread('image2.jpg')
grey = color.rgb2gray(img)

height,width = grey.shape
scale = 2.0
draw_scale = max(1.0,scale)
img_resize = resize(grey,(scale*height, scale*width))

fig,axes = plt.subplots(1, 2, figsize = (8,4))
ax = axes.ravel()

ax[0].imshow(img)
ax[0].set_title("Color")
ax[0].set(xlim=[0,draw_scale*width], ylim=[draw_scale*height,0])

ax[1].imshow(img_resize, cmap=plt.cm.gray)
ax[1].set_title("Resize Image")
ax[1].set(xlim=[0,draw_scale*width], ylim=[draw_scale*height,0])

plt.show()


