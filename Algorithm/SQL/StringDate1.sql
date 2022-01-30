Q. 이름에 el이 들어가는 동물 찾기
A. -- 코드를 입력하세요
SELECT ANIMAL_ID,NAME
FROM ANIMAL_INS
WHERE upper(NAME) like upper('%EL%')
ORDER BY NAME

WHERE NAME LIKE "%EL%"
수정중..
