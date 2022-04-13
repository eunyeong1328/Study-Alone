# -*- coding: utf-8 -*-
"""
Created on Wed Apr 13 20:02:27 2022

@author: user
"""

# 입력한 값까지 for문으로 합계 구하기
i,hap = 0,0
num1,num2,num3=0,0,0

num1 = int(input("시작값 입력: "))
num2 = int(input("끝값 입력: "))
num3 = int(input("중간값 입력: "))

for i in range(num1, num2+1, num3) :
    hap = hap + i
    
print("%d에서 %d까지 %d씩 증가함 값의 합: %d" % (num1,num2,num3,hap))