SELECT sum(salary) 
FROM employees;


SELECT department_id,last_name, avg(salary) 
from employees 
group by department_id;
--
select department_id, count(*),  count(commission_pct)
from employees
group by department_id
order by department_id;
SELECT SYSDATE-1,SYSDATE,SYSDATE+1
FROM dual;

SELECT 'DataBase', LOWER('DataBase') FROM dual;

SELECT SUBSTR('abcdfg',2,4) FROM dual;
SELECT *
FROM employees;

SELECT first_name, ROUND((SYSDATE - hire_date)/365, 1) || '년'  
FROM employees;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD'), TO_CHAR(50000000,'$999,999,999')
FROM dual;

SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2007';

SELECT TO_DATE('2023-02-10', 'YYYY/MM/DD') FROM dual;

SELECT TO_DATE('2023-02-10', 'YYYY-MM-DD') FROM dual;

SELECT employee_id, salary, NVL(commission_pct,0) FROM employees;
SELECT employee_id, salary, NVL2(commission_pct,'O','X') FROM employees;

SELECT job_id, DECODE(job_id,'SA_MAN','Sales Dept','SH_CLERK','Sales Dept','Another')
FROM employees;

SELECT job_id,
    CASE job_id
        WHEN 'SA_MAN' THEN 'Sales Dept'
        WHEN 'SA_CLECK' THEN 'Sales Dept'
        ELSE 'Another2'
    END "Case"
FROM employees;

CREATE TABLE emp01 
    AS SELECT * FROM employees; --as속성을 이용해서 복사
    
DELETE FROM emp01;
rollback;

DROP TABLE emp02;

CREATE TABLE dept01
    AS SELECT * FROM departments;


INSERT INTO dept01 VALUES(300, 'Developer', 100,10);

INSERT INTO dept01(department_id, department_name) VALUES (100,'Sales');

UPDATE dept01 SET department_name='IT Service'
    WHERE department_id=300;

