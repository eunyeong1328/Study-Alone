# -*- coding: utf-8 -*-
"""
Created on Wed Apr  6 19:31:03 2022

@author: user
"""

import numpy as np
import scipy.signal
import matplotlib.pyplot as plt
from skimage import io,color
from skimage import exposure

img = io.imread('image2.jpg')
img = color.rgb2gray(img)
gray = color.rgb2gray(img)

blur_kernel = np.array([[1,1,1],[1,1,1],[1,1,1]])/9.0;
denoised = scipy.signal.convolve2d(img,blur_kernel,'valid')

fig,axes = plt.subplots(1, 2, figsize = (8,4))
ax = axes.ravel()

ax[0].imshow(gray, cmap=plt.cm.gray)
ax[0].set_title("Color")
ax[1].imshow(denoised, cmap=plt.cm.gray)
ax[1].axis("off")
ax[1].set_title("off")
#plt.imshow(denoised, cmap=plt.cm.gray)
#plt.axis('off')
plt.show()




