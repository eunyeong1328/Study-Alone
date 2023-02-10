CREATE TABLE emp01 
    AS SELECT * FROM employees;
    
--emp01 테이블에서 salary 3000 이상 대상자에게 salary 10% 인상을 하자
UPDATE emp01 SET salary = salary * 1.1
    WHERE salary >= 3000;
    
DELETE FROM dept01
    WHERE department_id = 'IT Service';
    
select * From emp02;
select * from dept01;

CREATE TABLE emp02(
    empno NUMBER NOT NULL,
    ename VARCHAR2(20) NOT NULL,
    job VARCHAR2(20),
    deptno NUMBER
);

INSERT INTO emp01 VALUES(null,null,'IT',30); --이런 문장을 막기 위해서 사용
SELECT * FROM emp02;
INSERT INTO emp02 VALUES(null,null,'IT',30); 
INSERT INTO emp02 VALUES(100,'KIM','IT',30); 
INSERT INTO emp02 VALUES(100,'PARK','IT',30);

CREATE TABLE emp03(
    empno NUMBER UNIQUE,
    ename VARCHAR2(20) NOT NULL,
    job VARCHAR2(20),
    deptno NUMBER
);
SELECT * FROM emp03;
INSERT INTO emp03 VALUES(100,'KIM','IT',30); 
INSERT INTO emp03 VALUES(100,'PARK','IT',30);

CREATE TABLE emp04(
    empno NUMBER PRIMARY KEY,
    ename VARCHAR2(20) NOT NULL,
    job VARCHAR2(20),
    deptno NUMBER
);

INSERT INTO emp04 VALUES(100,'KIM','IT',3000); 

CREATE TABLE emp05(
    empno NUMBER PRIMARY KEY,
    ename VARCHAR2(20) NOT NULL,
    job VARCHAR2(20),
    deptno NUMBER REFERENCES departments(department_id)
);

INSERT INTO emp05 VALUES(100,'KIM','IT',3000); 

CREATE TABLE emp06(
    empno NUMBER ,
    ename VARCHAR2(20) NOT NULL,
    job VARCHAR2(20),
    deptno NUMBER,
    
    CONSTRAINT emp06_empno_pk PRIMARY KEY(empno),
    CONSTRAINT emp06_deptno_fk 
        FOREIGN KEY(deptno)
        REFERENCES departments(department_id)
); 
drop table emp0;
CREATE TABLE emp07(
    empno NUMBER,
    ename VARCHAR2(20),
    job VARCHAR2(20),
    deptno NUMBER
);
ALTER TABLE emp07
    ADD CONSTRAINT emp07_empno_pk PRIMARY KEY(empno);
ALTER TABLE emp07
    ADD CONSTRAINT emp07_deptno_fk FOREIGN KEY(deptno)
    REFERENCES departments(department_id);
ALTER TABLE emp07
    MODIFY ename CONSTRAINT emp07_ename_nn NOT NULL;
    
 CREATE TABLE emp08(
    empno NUMBER,
    ename VARCHAR2(20),
    job VARCHAR2(20),
    deptno NUMBER
);

--ALTER TABLE emp08
--    ADD CONSTRAINT emp08_empno_pk PRIMARY KEY(empno)
--    ADD CONSTRAINT emp08_deptno_fk FOREIGN KEY(deptno)
--         REFERENCES departments(department_id)
--     MODIFY ename CONSTRAINT emp08_ename_nn NOT NULL;
     
CREATE TABLE emp09(
    empno NUMBER,
    ename VARCHAR2(20),
    job VARCHAR2(20),
    deptno NUMBER,
    gender CHAR(1) CHECK(gender IN('M','F'))
);

INSERT INTO emp09 VALUES(100, 'park', 'IT', 20,'F');

CREATE TABLE emp10(
    empno NUMBER,
    ename VARCHAR2(20),
    job VARCHAR2(20),
    deptno NUMBER,
    loc VARCHAR2(20) DEFAULT 'Seoul'
);

INSERT INTO emp10(empno, ename,job,deptno) VALUES(100,'kim','IT',30,'BUSAN');
INSERT INTO emp10(empno, ename,job,deptno) VALUES(200,'kim','IT',30);

CREATE TABLE emp12(
    empno NUMBER,
    ename VARCHAR2(20),
    job VARCHAR2(20),
    deptno NUMBER,
    loc VARCHAR2(20) DEFAULT 'Seoul'
);

ALTER TABLE emp12
    ADD CONSTRAINT emp12_empno_empno_pk PRIMARY KEY(empno,ename);
    
INSERT INTO emp12 VALUES(300,'park','IT',20,'seou');
INSERT INTO emp12 VALUES(100,'kim','IT',20,'asda'); --두개의 값이 중복되어야만 판단 가능
select * from emp10;

ALTER TABLE dept01
    ADD CONSTRAINT dept01_pk PRIMARY KEY(department_id);

CREATE TABLE emp13(
    empno NUMBER,
    ename VARCHAR2(20),
    job VARCHAR2(20),
    deptno NUMBER
);

ALTER TABLE emp13
    ADD CONSTRAINT emp13_fk FOREIGN KEY (deptno)
    REFERENCES dept01(department_id);
    
ALTER TABLE emp13
    ADD CONSTRAINT emp13_pk PRIMARY KEY (empno);
    
INSERT INTO emp13 VALUES(100,'park','IT',30); --30직원이 이 부서에 일을 잘 하고 있음 

DELETE FROM dept01 WHERE department_id = 30; --사용불가
--직원이 있는데 이 부서를 삭제하려고 함

DELETE FROM emp13 WHERE deptno = 30;
DELETE FROM dept01 WHERE department_id = 30;

CREATE TABLE emp14(
    empno NUMBER,
    ename VARCHAR2(20),
    job VARCHAR2(20),
    deptno NUMBER REFERENCES dept01(department_id) 
            ON DELETE CASCADE --참조되는 값이 삭제되면 너도 같이 죽어라ㅋㅋ
);
INSERT INTO emp14 VALUES(100,'park','IT',20);
DELETE FROM dept01 WHERE department_id = 20;


CREATE TABLE member(
    id varchar2(20),
    name varchar2(20),
    regno varchar2(13),
    hp varchar2(13), 
    address varchar2(100)
);
    
CREATE TABLE book(
    code NUMBER(4),
    title VARCHAR2(50),
    count NUMBER(6),
    price NUMBER(10),
    publish VARCHAR2(50)
);

CREATE TABLE order2(
    no VARCHAR2(10),
    id VARCHAR2(20),
    code NUMBER(4),
    count NUMBER(6),
    dr_date DATE
);
DROP TABLE member;

ALTER TABLE member 
    ADD CONSTRAINT member_id_pk PRIMARY KEY (id)
    MODIFY id CONSTRAINT member_id_nn NOT NULL
    MODIFY name CONSTRAINT member_name_nn NOT NULL
    MODIFY regno CONSTRAINT member_rengo_nn UNIQUE NOT NULL
    MODIFY hp CONSTRAINT member_hp_unique UNIQUE;

ALTER TABLE book 
    ADD CONSTRAINT book PRIMARY KEY (code)
    MODIFY code CONSTRAINT book_code_nn NOT NULL
    MODIFY title CONSTRAINT book_title_nn NOT NULL;
    
ALTER TABLE order2 
    ADD CONSTRAINT order2 PRIMARY KEY (no);
    
ALTER TABLE order2 
    ADD CONSTRAINT order2_fk FOREIGN KEY(id)
        REFERENCES member(id);
ALTER TABLE order2  
    ADD CONSTRAINT order2_fk FOREIGN KEY(code)
        REFERENCES book(code);
        
ALTER TABLE order2  --order2 noll null처리
     MODIFY id CONSTRAINT order2_id_nn NOT NULL
     MODIFY code CONSTRAINT order2_code_nn NOT NULL;        

insert into member values(1,'lee','123','010-12','seoul');
insert into member values(2,'kee','1232','010-123','busan');         
insert into member values(3,'hee','1234','010-1234','guasung');    
select * from member;

insert into book values(1,'a',1,10,'han');
insert into book values(2,'b',2,20,'gan');
insert into book values(3,'c',3,30,'kee');
select * from book;

insert into order2 values(1,1,1,10,SYSDATE);
insert into order2 values(2,null,1,20,SYSDATE); --null체크
insert into order2 values(3,1,null,30,SYSDATE); --null체크
select * from order2;
delete from order2;

CREATE TABLE dept_const(
    deptno NUMBER(2),
    dname VARCHAR2(14),
    loc VARCHAR2(13)
);

CREATE TABLE emp_const(
    empno NUMBER(4),
    ename VARCHAR(10),
    job VARCHAR(9),
    tel VARCHAR(20),
    hiredate DATE,
    sal number(7),
    comm number(7),
    deptno number(2) 
);

ALTER TABLE dept_const 
    ADD CONSTRAINT deptconst_deptno_pk PRIMARY KEY (deptno)
    MODIFY dname CONSTRAINT deptconst_dname_unq UNIQUE
    MODIFY loc CONSTRAINT deptconst_loc_nn NOT NULL;

ALTER TABLE emp_const 
    ADD CONSTRAINT empconst_empno_pk PRIMARY KEY (empno)
    MODIFY ename CONSTRAINT empconst_ename_NN NOT NULL
    MODIFY tel CONSTRAINT empconst_tel_unq UNIQUE
    ADD CONSTRAINT empconst_deptno_fk FOREIGN KEY (deptno)
    REFERENCES dept_const(deptno);

ALTER TABLE emp_const 
     ADD CONSTRAINT empconst_sal_chk CHECK(sal<9999 AND sal>1000);

INSERT INTO dept_const  VALUES(1,'lee','seoul');
INSERT INTO dept_const VALUES(2,'kim','busan');
INSERT INTO dept_const VALUES(3,'park','gannam');
INSERT INTO dept_const VALUES(4,'park','gannam'); --unique 체크
INSERT INTO dept_const VALUES(4,'park',null); --null 체크
select * from dept_const;

INSERT INTO emp_const  VALUES(1,'lee','it',111,SYSDATE,1111,1000,1);
INSERT INTO emp_const  VALUES(5,null,'it',111,SYSDATE,1111,1000,1);--null체크
INSERT INTO emp_const  VALUES(5,'lee','it',111,SYSDATE,1111,1000,1);--unique체크
INSERT INTO emp_const  VALUES(1,'lee','marketing',111,SYSDATE,2222,1000,5);--fk체크
INSERT INTO emp_const  VALUES(1,'lee','marketing',111,SYSDATE,999,1000,5);--check체크
select * from emp_const;
