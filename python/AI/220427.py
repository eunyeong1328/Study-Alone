# -*- coding: utf-8 -*-
"""
Created on Wed Apr 27 19:41:20 2022

@author: user
"""

from numpy import *
import matplotlib.pyplot as plt

# y = wx + b
# w is slope, b is y-intercept
def compute_error_for_line_given_points(b,w,points): #목적함수
    totalError = 0
    for i in range(0,len(points)): #0부터 시작해서 50까지 반복
        x = points[i,0] #앞에 i가 인자=접근하는 것 x,y
        y = points[i,0]
        totalError += (y - (w*x+b)) ** 2 #2는 제곱을 나타냄  (y -f(x))제곱, = n/1(y - (wx+b))제곱
    return totalError / float(len(points))

def step_gradient(b_current, w_current, points, learningRate):
    w_gradient = 0
    b_gradient = 0 #평미분값
    N = float(len(points))
    for i in range(0, len(points)):
        x = points[i,0]
        y = points[i,1]
        b_gradient += - (2/N) * (y-((w_current*x) + b_current)) #b의 평미분  0.00145
        w_gradient += - (2/N) * x * (y-((w_current*x) + b_current))
    new_b = b_current - (learningRate * b_gradient) # -145
    new_w = w_current - (learningRate * w_gradient) #w는 0이고 new_w 0.0737....
    return [new_b, new_w]
#이 함수를 반복시 빨간색 선이 에러값이 최소화 되는 것을 볼 수 있다.
def gradient_descent_runner(points, starting_b, starting_w, learning_rate, num_iterations):
    b = starting_b #초기값 0
    w = starting_w
    
    min_x = min(points[:,0])#포인트100개 최소값
    max_x = max(points[:,0])#최대값
    for i in range(num_iterations): #이 함수의 !!!핵심은!!! 100개의 포인트를 사용해 점점 
        b, w = step_gradient(b, w, array(points), learning_rate) #평미분을 이용해 실제 
        
        min_y = w * min_x + b
        max_y = w * max_x + b
        plt.scatter(points[:,0], points[:,1], color='blue') #갖고 있는 데이터를 점으로 표시 :는 모든 점들을 나타냄
        plt.plot([min_x, max_x], [min_y, max_y], color = 'red') #x의 시작값 y의 시작값
        plt.show()
    return [b,w]

if __name__ == '__main__': #이 소스파일이 main이면 이 위치부터 실행
    points = genfromtxt("data.csv",delimiter=",") #쉼표를 기준으로 잘라주세요 delimiter:구분자
    learning_rate = 0.0003 
    initial_b = 0.0
    initial_w = 0.0 #바닥에 붙어있는 직선
    num_iterations = 500 #포인트는 50개의 점들
    print("Starting gradient descent at b = {0}, w = {1}, error={2}". #시작되는 기울기는 어떻게 되는냐
          format(initial_b, initial_w, compute_error_for_line_given_points(initial_b, initial_w, points)))
    print("Running...")
    [b,w] = gradient_descent_runner(points, initial_b, initial_w, learning_rate, num_iterations) #0.0 0.0 50
    print("After {0} iterations  b = {1}, w = {2}, error={3}".
           format(num_iterations, b, w, compute_error_for_line_given_points(initial_b, initial_w, points)))   
     
#learning_rate랑 num_iterations를 반복하면서 돌리면 이해하는데 훨씬 쉬울 것이다.