A. 
Q. -- 코드를 입력하세요
SELECT ANIMAL_ID, ANIMAL_TYPE, NAME
FROM ANIMAL_INS
NATURAL JOIN ANIMAL_OUTS
WHERE SEX_UPON_INTAKE LIKE('%Spayed')
ORDER BY ANIMAL_ID
