SELECT eno,ename,sal
FROM emp
WHERE dno = '10';

SELECT *
FROM student
WHERE NOT sname = '마초'; 
--화학과 학년별 평균 학점을 검색하라
SELECT *
FROM  student
WHERE major = '화학'
ORDER BY major, syear;
--각 학과별 학생수를 검색하라
SELECT major,  COUNT(*)
FROM student
GROUP BY major;
--화학과 생물학과 학생을 4.5환산 학점의 평균을 각각 검색하라
SELECT major, AVG(avr*4.5/4.0)
FROM student
WHERE major IN ('화학','생물') 
GROUP BY major;

SELECT department_id, AVG(salry)
FROM employees
WHERE AVG(salary) < 5000
GROUP BY department_id
HAVING AVG(salary) < 5000;

--화학과를 제외한 학생들의 과별 평점평균을 검색하라
SELECT major, AVG(avr)
FROM student
GROUP BY major
HAVING NOT major = '화학';


--화학과를 제외한 각 학과별 평점 중에 평점이 2.0이상 학과정보를 검색하라
SELECT major, round(AVG(avr),2)
FROM student
GROUP BY major
HAVING NOT major = '화학' 
AND AVG(avr) >= 2.0;

--근무중인 직원 3명 이상인 부서를 검색하라(emp)
SELECT dno, COUNT(*)
FROM emp
GROUP BY dno
HAVING COUNT(*) >= 3;

SELECT cname , SUBSTR(cname,1,LENGTH(cname)-1)  
FROM course;

SELECT SYSDATE-1,SYSDATE,SYSDATE+1
FROM dual;