# -*- coding: utf-8 -*-
"""
Created on Wed Apr  6 19:31:03 2022

@author: user
"""

from skimage import io, viewer
from skimage.color import rgb2gray
import matplotlib.pyplot as plt
from skimage.filters.thresholding import threshold_otsu

img = io.imread('image2.jpg')
gray = rgb2gray(img)

thresh = threshold_otsu(gray)
binary = gray > thresh

fig,axes = plt.subplots(1, 2, figsize = (8,4))
ax = axes.ravel()

ax[0].imshow(img)
ax[0].set_title("Color")
ax[1].imshow(binary, cmap=plt.cm.gray)
ax[1].set_title("binary image")

plt.show()