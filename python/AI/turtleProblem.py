# -*- coding: utf-8 -*-
"""
Created on Wed Mar 30 20:42:23 2022

@author: user
"""

import turtle
t = turtle.Turtle()
t.shape("turtle")

s = turtle.textinput("", "몇각형을 원하시나요?:")
n = int(s)

for i in range(n):
    t.forward(100)
    t.left(360/n)