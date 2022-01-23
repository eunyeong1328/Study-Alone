Q.보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다.   
0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요.   
이때 결과는 시간대 순으로 정렬해야 합니다.
A. -- 코드를 입력하세요
SET @T := -1;  
SELECT (@T := @T + 1) AS HOUR, (SELECT COUNT(*) FROM ANIMAL_OUTS WHERE HOUR(DATETIME) = @T) AS COUNT
FROM ANIMAL_OUTS
WHERE @T<23

변수 @T=-1로 초기회
변수 @T에 의해 0부터 23번까지 레코드가 선택되었고, 이 테이블명을 H로 지정했다

MYSQL에서 대입연산자(=) 사용기호 ➡️ :=
