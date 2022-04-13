# -*- coding: utf-8 -*-
"""
Created on Wed Apr 13 20:15:40 2022

@author: user
"""

#거북이로 별을 그리기
import turtle
import random
t = turtle.Turtle()
t.shape("turtle")

i = 0
while i < 100:
    t.forward(200)
    t.right(144)
    i = i + 1
