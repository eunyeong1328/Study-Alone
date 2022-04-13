# -*- coding: utf-8 -*-
"""
Created on Thu Mar 24 17:40:37 2022

@author: Yi
"""
import numpy as np

class Dist:
    def __init__(self, x1, y1, x2, y2):
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
    
    def calc(self):
        tmp = np.sqrt((self.x1 - self.x2)**2 + (self.y1 - self.y2)**2)
        return tmp
    
strX1, strY1, strX2, strY2 = input("값을 입력하세요. 빈칸으로 구분됩니다.:").split()

x1, y1, x2, y2 = float(strX1), float(strY1), float(strX2), float(strY2)

myDist = Dist(x1, y1, x2, y2)
fDistance = myDist.calc()

print("두점간의 거리:", fDistance)


class Cylinder:
    def __init__(self, r, h):
        self.r = r
        self.h = h
        
    def calc(self):
        tmp = 3.141592 * (self.r**2) * self.h
        return tmp
    
strR, strH = input("값을 입력하세요. 빈칸으로 구분됩니다.:").split()

r, h = float(strR), float(strH)

myCylinder = Cylinder(r, h)
fVolume = myCylinder.calc()

print("원통의 부피:", fVolume)