# -*- coding: utf-8 -*-
"""
Created on Fri Apr  8 19:16:20 2022

@author: user
"""

import numpy as np
import scipy.signal
import matplotlib.pyplot as plt
from skimage import io,color
from skimage import exposure
from skimage import feature, filters

img = io.imread('image2.jpg')
grey = color.rgb2gray(img)
kernel = np.array([[-1,-1,-1],[-1,8,-1],[-1,-1,-1]])

edges = scipy.signal.convolve2d(grey, kernel, 'valid')

edges_equalized = exposure.equalize_adapthist(edges/np.max(np.abs(edges)), clip_limit=0.03)

fig,axes = plt.subplots(1, 2, figsize = (8,4))
ax = axes.ravel()

ax[0].imshow(img)
ax[0].set_title("Color")
ax[1].imshow(edges_equalized, cmap=plt.cm.gray)
ax[1].set_title("Edge Image")

plt.show()


