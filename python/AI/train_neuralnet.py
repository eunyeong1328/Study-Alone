# coding: utf-8
import sys, os
sys.path.append(os.pardir)  # 부모 디렉터리의 파일을 가져올 수 있도록 설정
import numpy as np
import matplotlib.pyplot as plt
from dataset.mnist import load_mnist
from two_layer_net import TwoLayerNet


# 데이터 읽기
(x_train, t_train), (x_test, t_test) = load_mnist(normalize=True, one_hot_label=True)
#hidden_size=100 값이 크면 클수록 학습해야 할 것이 늘어나서 즉,무조건 늘어나서 무조건 좋지 않다.
network = TwoLayerNet(input_size=784, hidden_size=50, output_size=10)

# 하이퍼파라미터
iters_num = 10000  # 반복 횟수를 적절히 설정한다.
train_size = x_train.shape[0]
batch_size = 100   # 미니배치 크기
learning_rate = 0.1 
#내가 여러번
#얼마만큼 에러값이 나고 있는지 확인
train_loss_list = []
train_acc_list = [] #오류값이 얼마만큼 정확한지
test_acc_list = [] #검증값이 얼마만큼 정확한지

# 1에폭당 반복 수 / 1에폭당 600번 돌기
iter_per_epoch = max(train_size / batch_size, 1)

for i in range(iters_num):
    # 미니배치 획득          #5만개에 대해서 몇번째 아이를 가져올지 아무거나 뽑는다.
    batch_mask = np.random.choice(train_size, batch_size) #만번을 돌변서
    x_batch = x_train[batch_mask] #임의의 있는 갯수를 가지고 와서t를 만든다.
    t_batch = t_train[batch_mask] #6만개에서 100개를 
    
    # 기울기 계산
    #grad = network.numerical_gradient(x_batch, t_batch)
    grad = network.gradient(x_batch, t_batch) #오류 역전파를 만든다.
    
    # 매개변수 갱신
    for key in ('W1', 'b1', 'W2', 'b2'): #각각그이 값을 학습률만큼 계산
        network.params[key] -= learning_rate * grad[key]
    
    # 학습 경과 기록
    loss = network.loss(x_batch, t_batch)
    train_loss_list.append(loss) #얼마만큼 에러가 안나는지 loss를 계산
    
    # 1에폭당 정확도 계산
    if i % iter_per_epoch == 0: #iter_per_epoch 500번에 한번씩 
        train_acc = network.accuracy(x_train, t_train)#현재의 학습정확도
        test_acc = network.accuracy(x_test, t_test)#테스트 정확도
        train_acc_list.append(train_acc)#그 값들을 list에 갔다 놓는다.
        test_acc_list.append(test_acc)
        print("train acc, test acc | " + str(train_acc) + ", " + str(test_acc))

# 그래프 그리기 #그 결과값을 그림을 그린다.
markers = {'train': 'o', 'test': 's'}
x = np.arange(len(train_acc_list))
plt.plot(x, train_acc_list, label='train acc') 
plt.plot(x, test_acc_list, label='test acc', linestyle='--')
plt.xlabel("epochs") #5만개에 대해서 
plt.ylabel("accuracy")
plt.ylim(0, 1.0)
plt.legend(loc='lower right')
plt.show()

#5만개에 대해서 학습이 되고 결과값이 생성
#6만개의 데이터를 100개를 갔다가 왔다가
#09494...를 맞췄어요