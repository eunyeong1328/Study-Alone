## 제1절 옵티마이저와 실행계획      
* 비용기반 옵티마이저(CBO:Cost Based Optimizer) : 전체 테이블 스캔 유리
* 규칙기반 옵티아미저 : 항상 인덱스 사용
* 인덱스 범위 스캔 : 결과 건수만큼 반환하지만, 결과가 없으면 한건도 반환하지 않는다 

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
관계형 DB는 SQL문을 통해서만 데이터를 처리한다. SQL문은 사용자의 요구사항만 기술할 뿐 처리과정의 기술 신경쓰지 않는다    

## 제2절 인덱스 기본    
조회할 때, 인덱스를 구성하는 컬럼들의 순서는 SQL성능적인 관점에서 매우 중요한 역할을 한다.  
인덱스를 구성하는 컬럼들의 이외의 데이터가 Update될 때 인덱스에 부하가 일어나지 않고, Insert, Delete시 부하가 일어난다
> 인덱스 생성 : Create index idx_emp_01 On Emp(Regist_date, Deptno)

* B.tree Index : 브랜치 블록과 리프 블록으로 구성 
    * 10%이하의 데이터를 검색할 때 유리하고 대량의 데이터는 조회시 유리하지 않다.
    > 대량의 데이터 조회 : 데이블 전체 스캔 방식으로 조회 
    > 랜덤 액세스: 인덱스를 스캔하여 데이블로 데이터을 찾아가는 방식 = NL Join 사용  
    * OLTP(Online Transaction Processing) 온라인 트랜잭션 처리 사용
    * 주로 신용카드 업무, 주로 금융권 사용
* Clustered Index (클러스터 인덱스) : 인덱스의 리프레이지가 곧 데이터 페이지며, 리프 페이지의 모든 데이터는 인덱스의 키 컬럼 순으로 물리적으로 정렬되어 저장된다.
* BitMap Index : 하나의 인덱스 키 엔트리가 많은 행에 대한 포인터를 저장하고 있는 구조이다.

## 제3절 조인 수행 원리
* NL Join (Nested Loop Join) : 수행방식을 단계별로 나타낸다.
* Sort Merge Join : 조인 칼럼 기준으로 데이터를 정렬한다.
* Hash Join : 해쉬 함수를 사용하고 "=" 동등 조인에서만 사용된다.




