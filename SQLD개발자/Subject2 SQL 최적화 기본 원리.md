## 제1절 옵티마이저와 실행계획      
* 비용기반 옵티마이저(CBO:Cost Based Optimizer) : 전체 테이블 스캔 유리
* 규칙기반 옵티아미저 : 항상 인덱스 사용
* 인덱스 범위 스캔 : 결과 건수만큼 반환하지만, 결과가 없으면 한건도 반환하지 않는다 

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
관계형 DB는 SQL문을 통해서만 데이터를 처리한다. SQL문은 사용자의 요구사항만 기술할 뿐 처리과정의 기술 신경쓰지 않는다    

## 제2절 인덱스 기본    
조회할 때, 인덱스를 구성하는 컬럼들의 순서는 SQL성능적인 관점에서 매우 중요한 역할을 한다.  
인덱스를 구성하는 컬럼들의 이외의 데이터가 Update될 때 인덱스에 부하가 일어나지 않고, Insert, Delete시 부하가 일어난다
> 인덱스 생성 : Create index idx_emp_01 On Emp(Regist_date, Deptno)

## 제3절 조인 수행 원리
### 실행계획 정보의 구성요소 



