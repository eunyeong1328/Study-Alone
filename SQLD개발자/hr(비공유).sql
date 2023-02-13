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

TRUNCATE TABLE emp01; --DDL(트랜잭션 대상X)