# -*- coding: utf-8 -*-
"""
Created on Wed May  4 20:21:35 2022

@author: user
"""

import sys,os
sys.path.append(os.pardir) 
sys.path.append("D:\youngAI\deep-learning-from-scratch\ch03")
import numpy as np
import pickle
from dataset.mnist import load_mnist #""MNIST 데이터셋 읽기
from common.functions import sigmoid, softmax

def get_data(): #x는 이미지 t는 각 이미지의 정답값
    (x_train, t_train),(x_test, t_test) = load_mnist(normalize = True,flatten = True,one_hot_label=False)
    return x_test, t_test #각가의 대한 정답을 t에 넣었음

def init_network():
    with open("sample_weight.pkl",'rb') as f: #rb는 읽기 전용으로 읽고
        network = pickle.load(f) #pickle에서 f를 가져와줘라
    return network

def predict(network,x):
    W1,W2,W3 = network['W1'],network['W2'],network['W3'] #저장되어 있는 것을 가져온다.
    b1,b2,b3 = network['b1'],network['b2'],network['b3']
    
    a1 = np.dot(x,W1) + b1 #x와 W1를 곱해주고 74*50하면 50차원으로 바뀐다.
    z1 = sigmoid(a1) #손코딩을 고딩으로 표현한 것
    a2 = np.dot(z1,W2) + b2 #2층
    z2 = sigmoid(a2)
    a3 = np.dot(z2,W3) + b3 #3층
    y = softmax(a3)
    
    return y

x,t = get_data() #x의 길이는 만번으로 만번을 돈다.
network = init_network() #pickle라이브러리로 그 각에 맞게 그게 맞게 load해주는 라이브러리
accuracy_cnt = 0
for i in range(len(x)):
    y = predict(network, x[i]) #y의 값은 최종 나온 결과값 가장 높게 나온 인자값(인덱스)을 알려줘 9999개의 이미지가 들어간다.
    p = np.argmax(y) # 확률이 가장 높은 원소의 인덱스를 얻는다.
        accuracy_cnt += 1
        
print("Accuracy:" + str(float(accuracy_cnt)/len(x)))