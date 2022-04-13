# -*- coding: utf-8 -*-
"""
Created on Wed Apr 13 19:36:23 2022

@author: user
"""

import numpy as np
import matplotlib.pyplot as plt

#데이터 준비
x = np.arange(0, 6, 0.9) #0에서 6까지 0.1 간격으로 생성
y = np.sin(x)

#그래프 그리기
plt.plot(x,y)
plt.show()

