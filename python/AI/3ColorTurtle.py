# -*- coding: utf-8 -*-
"""
Created on Wed Apr 13 20:05:40 2022

@author: user
"""
#리스트에 저장된 색상으로 원그리기
import turtle
t=turtle.Turtle()
t.shape("turtle")

color_list= ["yellow","red","blue","green"]

for i in range(4):
    t.fillcolor(color_list[i])
    t.begin_fill()
    t.circle(100)
    t.end_fill()
    
    t.forward(50)
