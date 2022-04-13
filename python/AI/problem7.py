# -*- coding: utf-8 -*-
"""
Created on Wed Mar 30 20:46:16 2022

@author: user
한 파일에 대해서 클래스 두개
"""

class VolumCal:
    def volum(a, b):
        global value
        value = a*b
        return 
    
    value = 0 
    a = float(input("반지름 입력: "))
    b = float(input("높이 입력: "))    
    volum(a,b)
    print(value)
            
    
    