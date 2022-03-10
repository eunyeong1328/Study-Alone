### 실행계획 정보의 구성요소 
Exception plan  
실행계획을 읽는 순서는 위에서 아래로, 안에서 밖으로 읽는다.
> SELECT STATEMENT Optimizer = ALL_ROWs (Cost=3, Card=2, Bytes=114)     
> NESTED LOOPS (Cost=3 Card=2, Bytes=114)   
> TABLE ACCESS (BY INDEX ROWID)  OF 'EMP' (TABLE) (Cost=2 Card=2 Bytes=74)  
> INDEX (RANGE SCAN) OF 'EMP' (Cost=1 Card=2)  
> TABLE ACCESS (BY INDEX ROWID) OF 'EMP' (TABLE) (Cost=1 Card=1 Butes=20)   
> INDEX (UNIQUE SCAN) OF 'PK_DEPT' (INDEX (UNIQE)) (Cost=0 Card=1)  
    
다음 중 실행계획을 통해서 알 수 있는 정보로 가장 부적절한 것은? (밑에 다 올바른 답)  
NESTED LOOPS : 조인 기법  
(Cost=3, Card=2, Bytes=114) : 최적화 정보, 질의 처리 예상 비용(Cost)  
NESTED, TABLE ACCESS, INDEX : 연산  
TABLE ACCESS, INDEX : 액세스 기법  
실제 처리 예상 비용(Cost)   

옵티마이저 : 사용자가 질의한 SQL문에 대해 최적의 실행 방법을 결정하는 역할을 수행,   
관계형 DB는 SQL문을 통해서만 데이터를 처리한다. SQL문은 사용자의 요구사항만 기술할 뿐 처리과정의 기술 신경쓰지 않는다.  


Natural Join
오라클이 다중 테이블을 뒤져봐서 컬럼명이 같고 데이터타입이 같은 컬럼을 기준으로 join을 보여준다.

Using
여러 컬럼의 이름은 동일하지만 데이터 유형이 다른 경우 using절을 사용한다.

On
가장 기본이 되는 join 유형이고 가장 많이 사용한다.컬럼명과 데이터타입이 달라도 상관없이 사용 가능하다.
  
반정규화 정규 대상
* 범위처리빈도수 조사
* 대량의 범위 처리 조사
* 통계성 프로세스 조사
* 테이블 조인 갯수 조사
