데이터 모델링의 3단계
1. 개념적 데이터모델링
2. 논리적 데이터모델링
3. 물리적 데이터모델링

<주관식>
1. 엔터티의 속성으로 알맞은 것 고르기: 이름, 생년월일, 학점, 학과 X
2. 주식별자로 가장 적절한 것 : 직원번호 X
3. 5,6,6,7,16 X
4. 6, 9, 5, 10875 X
5. count(*) having count(*) > 2:3 
6. ROW_NUMBER 
7. ROLLUP
8. 6,9400,5,10875
9. sum(case when ~ then 1 end), sum ~~ : 3,2
10. c1 IS NULL

+4
-6 X
  
<객관식>
1,2,4,8,7,11,12,13,17,18,19,20,22,32
7. 데이터 범위 지정 : 도메인  
9. 식별자 특징 중 틀린 것 : 독립성 X
11. 속성 알맞은 것 고르기 : 설계속성
12. smith, allen, scott like : 4개
13. joins, smith
14. grant  Grant select,update on user_A.tb to user_b
15. jones, smith
16. grant로 권한 줄 수 없는 것 : check X
17. truncate 후 rollback 문제 : 30 
18. numberic Varchar X
19. 누적 백분율 구하는 키워드 : cume_dist X
20. DML - rename
21. 2,2
22. 4,23
23. order by 선수명 asc, 팀명 asc, 3 desc
24. drop과 truncate에 대한 설명중 틀린 것 : truncate은 dml이다. X
25. (col1, col2) in ( (a,1005) ) : 행1개 
26. order slibings by 선지 X
27. 4000,3000, 5000, 12000, 4,3 X
28. order by 3 
29. insert 입력시 오류 - 날짜를 숫자형태로 20220321
30. order by : alias 와 컬럼 넘버 사용 불가능
31. grouping set 순서 영향 있다는 선지 X
32. 주식별자, 기본속성 없어도 된다는 선지 
33. 단일행 = 다중행 X

좋은 데이터 모델의 요소
1. 완전성 : 업무에 필요한 모든 데이터가 모델에 정의
2. 중복배제 : 하나의 DB내에 동일한 사실은 한번만
3. 업무규칙 : 많은 규칙을 사용자가 공유하도록 제공
4. 데이터 재사용 : 데이터가 독립적으로 설계되야 함
5. 의사소통 : 업무규칙은 엔터티, 서브타입, 속성, 관계 등의 형태로 최대한 자세히 표현
