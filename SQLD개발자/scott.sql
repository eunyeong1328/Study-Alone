select * from emp;

SELECT * FROM emp WHERE ename = 'ALLEN';

select ename , hiredate , empno from emp where empno = '7369';

select * from emp where not job = 'MANAGER';


SELECT empno,replace(empno, substr(empno,3,2), '**'),ename,
replace(ename, substr(ename,2,length(ename)-1), '*****')
FROM emp;  --수만큼 교체

select empno, ename,sal ,round(sal/21.5,1) as DAY_PAY
, round(sal/21.5/8,1) as TIME_PAY
from emp; 

select empno, ename
,TO_CHAR(hiredate,'YYYY/MM/DD') as HIREDATE
,TO_CHAR(add_months(hiredate,3),'YYYY-MM-DD') as R_JOB
, NVL(TO_CHAR(comm),'N/A') as comm
from emp;

select *
from emp;

select empno, ename, mgr, chg_mgr
from emp;

CREATE TABLE emp02
    AS SELECT * FROM employees WHERE 1=0; 
    
ALTER TABLE emp02
    ADD(job VARCHAR2 (50)) ;
        
ALTER TABLE emp02
    MODIFY(job VARCHAR2(100)) ;
    
ALTER TABLE emp02
   DROP COLUMN job;
   
DELETE FROM emp01; --DML(트랜잭션 대상O)
ROLLBACK;
TRUNCATE TABLE emp01;
TRUNCATE TABLE emp01; --DDL(트랜잭션 대상X)
DROP TABLE emp02;

CREATE TABLE dept01
 AS SELECT * FROM departments;
 
 select * from emp;

SELECT * FROM emp WHERE ename = 'ALLEN';

select ename , hiredate , empno from emp where empno = '7369';

select * from emp where not job = 'MANAGER';


SELECT empno,replace(empno, substr(empno,3,2), '**'),ename,
replace(ename, substr(ename,2,length(ename)-1), '*****')
FROM emp;  --수만큼 교체

select empno, ename,sal ,round(sal/21.5,1) as DAY_PAY
, round(sal/21.5/8,1) as TIME_PAY
from emp; 

select empno, ename
,TO_CHAR(hiredate,'YYYY/MM/DD') as HIREDATE
,TO_CHAR(add_months(hiredate,3),'YYYY-MM-DD') as R_JOB
, NVL(TO_CHAR(comm),'N/A') as comm
from emp;

select *
from emp;

select empno, ename, mgr, chg_mgr
from emp;

CREATE TABLE emp02
    AS SELECT * FROM employees WHERE 1=0; 
    
ALTER TABLE emp02
    ADD(job VARCHAR2 (50)) ;
        
ALTER TABLE emp02
    MODIFY(job VARCHAR2(100)) ;
    
ALTER TABLE emp02
   DROP COLUMN job;
   
DELETE FROM emp01; --DML(트랜잭션 대상O)
ROLLBACK;
TRUNCATE TABLE emp01;
TRUNCATE TABLE emp01; --DDL(트랜잭션 대상X)
DROP TABLE emp02;

CREATE TABLE dept01
 AS SELECT * FROM departments;

 ------ JOIN -------
 
 ----------------- 조인과제2 -----------------
-- 1 --
select * from emp;
select * from dept;

SELECT e.deptno, e.ename, e.empno, e.ename, e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno 
AND e.sal > 2000
ORDER BY e.deptno ;

-----------------보류-----------------
--SELECT e.deptno, e.ename, AVG(sal) AS AVG_SAL
--, MAX(sal)AS MAX_SAL, MIN(sal) AS MIN_SAL, COUNT(*) AS CNT
--FROM emp e, dept d
--WHERE e.deptno = d.deptno 
--GROUP BY deptno
--ORDER BY e.deptno;
--SELECT 
--   FROM (SELECT da.deptno
--        FROM (SELECT e.empno, e.ename, d.deptno, e.sal
--                        FROM emp e, dept d
--                        WHERE e.deptno = d.deptno) da
--        GROUP BY da.deptno
--        ORDER BY da.deptno) datwo;\
-- 3 --
SELECT e.deptno, d.dname,e.empno,e.ename,e.job,e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno 
ORDER BY e.deptno, e.ename;

-- 4 --
SELECT e.deptno, d.dname, e.ename, e.mgr, e.sal, d.deptno,losal, hisal, 
grade, em.empno as MGR_EMPNO, em.ename as MGR_ENAME --급여 등급 정보, 각 사원의 직속 상관의 정보를 부서번, 사원번
FROM emp e, emp em, dept d, salgrade s
WHERE e.deptno = d.deptno 
AND e.mgr = em.empno --SELF JOIN
AND e.sal BETWEEN s.losal AND s.hisal 
ORDER BY e.deptno, e.ename, e.sal,e.deptno, e.empno;

SELECT b.empno, b.ename  --SELF JOIN
FROM emp e, emp b
WHERE e.mgr = b.empno
order by e.deptno, e.empno;

