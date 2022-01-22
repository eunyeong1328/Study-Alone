Q.보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다.  
09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요.   
이때 결과는 시간대 순으로 정렬해야 합니다.

A. -- 코드를 입력하세요
SELECT HOUR(DATETIME) AS TIMEZONE, COUNT(DATETIME) AS COUNT
FROM ANIMAL_OUTS
GROUP BY TIMEZONE
HAVING TIMEZONE BETWEEN 9 AND 20
ORDER BY TIMEZONE ASC

날짜 데이터에서 일부만 뽑기 - HOUR(~), MINUTE(~), SECONT(~)
특정 날짜 Select 하는 방법, 날짜 검색 - BETWEEN ~ AND ~ 
