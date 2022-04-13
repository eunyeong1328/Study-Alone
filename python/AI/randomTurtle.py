# -*- coding: utf-8 -*-
"""
Created on Wed Apr 13 20:13:15 2022

@author: user
"""

#거북이를 랜덤하기 움직이게 하기
import turtle
import random
t = turtle.Turtle()
t.shape("turtle")

for i in range(30):
    length = random.randint(1, 100)
    t.forward(length)
    angle = random.randint(-180, 180)
    t.right(angle)