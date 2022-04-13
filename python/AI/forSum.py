# -*- coding: utf-8 -*-
"""
Created on Wed Apr 13 19:59:43 2022

@author: user
"""
# 입력한 값까지 for문으로 합계 구하기
i,hap = 0,0
num=0

num = int(input("값 입력: "))

for i in range(1, num+1, 1) :
    hap = hap + i
    
print("1에서 %d까지의 합 : %d" % (num,hap))