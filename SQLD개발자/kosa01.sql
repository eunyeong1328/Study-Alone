SELECT eno,ename,sal
FROM emp
WHERE dno = '10';

SELECT *
FROM student
WHERE NOT sname = '����'; 
--ȭ�а� �г⺰ ��� ������ �˻��϶�
SELECT *
FROM  student
WHERE major = 'ȭ��'
ORDER BY major, syear;
--�� �а��� �л����� �˻��϶�
SELECT major,  COUNT(*)
FROM student
GROUP BY major;
--ȭ�а� �����а� �л��� 4.5ȯ�� ������ ����� ���� �˻��϶�
SELECT major, AVG(avr*4.5/4.0)
FROM student
WHERE major IN ('ȭ��','����') 
GROUP BY major;

SELECT department_id, AVG(salry)
FROM employees
WHERE AVG(salary) < 5000
GROUP BY department_id
HAVING AVG(salary) < 5000;

--ȭ�а��� ������ �л����� ���� ��������� �˻��϶�
SELECT major, AVG(avr)
FROM student
GROUP BY major
HAVING NOT major = 'ȭ��';


--ȭ�а��� ������ �� �а��� ���� �߿� ������ 2.0�̻� �а������� �˻��϶�
SELECT major, round(AVG(avr),2)
FROM student
GROUP BY major
HAVING NOT major = 'ȭ��' 
AND AVG(avr) >= 2.0;

--�ٹ����� ���� 3�� �̻��� �μ��� �˻��϶�(emp)
SELECT dno, COUNT(*)
FROM emp
GROUP BY dno
HAVING COUNT(*) >= 3;

SELECT cname , SUBSTR(cname,1,LENGTH(cname)-1)  
FROM course;

SELECT SYSDATE-1,SYSDATE,SYSDATE+1
FROM dual;