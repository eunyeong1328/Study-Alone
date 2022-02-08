Q. 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요.  
이때 결과는 보호 기간이 긴 순으로 조회해야 합니다. 

A. -- 코드를 입력하세요
-- 코드를 입력하세요
SELECT ANIMAL_ID,NAME
FROM ANIMAL_INS
ORDER BY DATETIME 
LIMIT 0,2

LIMIT : 데이터 조회 시 한계를 지정할 수 있으며 위의 쿼리 LIMIT 은 0부터 2까지의 행의 데이터를 가져온다.
ROWNUM : 조회된 결과의 순서대로 순서를 붙여준다.
