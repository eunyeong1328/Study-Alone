# coding: utf-8
import sys, os
sys.path.append(os.pardir)  # 부모 디렉터리의 파일을 가져올 수 있도록 설정
from common.functions import *
from common.gradient import numerical_gradient


class TwoLayerNet:
                        #784           #50층       #출력10층
    def __init__(self, input_size, hidden_size, output_size, weight_init_std=0.01): 
        # 가중치 초기화
        self.params = {} #임의로 w1,w2 b1,b2를 만들어준다. 
        self.params['W1'] = weight_init_std * np.random.randn(input_size, hidden_size)
        self.params['b1'] = np.zeros(hidden_size)
        self.params['W2'] = weight_init_std * np.random.randn(hidden_size, output_size)
        self.params['b2'] = np.zeros(output_size)

    def predict(self, x):#뭐가 정답에 가까운지 알려주는 함수
        W1, W2 = self.params['W1'], self.params['W2']
        b1, b2 = self.params['b1'], self.params['b2']
    
        a1 = np.dot(x, W1) + b1
        z1 = sigmoid(a1)
        a2 = np.dot(z1, W2) + b2
        y = softmax(a2)
        
        return y
        
    # x : 입력 데이터, t : 정답 레이블
    def loss(self, x, t): #정답인지 아닌지 체크해서 정답을 만들어주는 
        y = self.predict(x)
        
        return cross_entropy_error(y, t)
    
    def accuracy(self, x, t):
        y = self.predict(x)
        y = np.argmax(y, axis=1)
        t = np.argmax(t, axis=1)
        
        accuracy = np.sum(y == t) / float(x.shape[0])
        return accuracy
        
    # x : 입력 데이터, t : 정답 레이블
    def numerical_gradient(self, x, t): #정답이 같은지 체크해주는 함수
        loss_W = lambda W: self.loss(x, t)
        
        grads = {}
        grads['W1'] = numerical_gradient(loss_W, self.params['W1'])
        grads['b1'] = numerical_gradient(loss_W, self.params['b1'])
        grads['W2'] = numerical_gradient(loss_W, self.params['W2'])
        grads['b2'] = numerical_gradient(loss_W, self.params['b2'])
        
        return grads
        
    def gradient(self, x, t):
        W1, W2 = self.params['W1'], self.params['W2'] #오차난 것에 대해서 목적함수가 낮아지는 함수에 대ㅐ서 
        b1, b2 = self.params['b1'], self.params['b2']
        grads = {}
        
        batch_num = x.shape[0]
        
        # forward
        a1 = np.dot(x, W1) + b1
        z1 = sigmoid(a1)
        a2 = np.dot(z1, W2) + b2
        y = softmax(a2)
        
        # backward #y는 위에서 계산함 겂
        dy = (y - t) / batch_num  #한층 한층w,b를 
        grads['W2'] = np.dot(z1.T, dy) #얼마만큼 계산한지 #y값을 
        grads['b2'] = np.sum(dy, axis=0)
        
        da1 = np.dot(dy, W2.T) #이전에 있었던 값을 곱해주고
        dz1 = sigmoid_grad(a1) * da1 #sigmoid_grad 평미분을 한지
        grads['W1'] = np.dot(x.T, dz1) #얼마만큼 
        grads['b1'] = np.sum(dz1, axis=0) #그 값을 다 더해서 

        return grads
