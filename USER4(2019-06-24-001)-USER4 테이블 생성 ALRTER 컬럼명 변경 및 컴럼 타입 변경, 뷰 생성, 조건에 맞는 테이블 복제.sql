--USER4 화면입니다.
CREATE TABLE tbl_student(
    st_no CHAR(3) PRIMARY KEY,
    st_name nVARCHAR2(30) NOT NULL,
    st_addr nVARCHAR2(50) ,
    st_grade NUMBER(1) NOT NULL,
    st_height NUMBER(3),
    st_weight NUMBER(3),
    st_nick nVARCHAR2(20),
    st_nick_rem nVARCHAR2(50),
    st_dep_no CHAR(3) NOT NULL);
    
select st_no AS 학번, st_name AS 이름, st_grade AS 학년, st_addr AS 주소, st_height AS 키, st_weight AS 몸무게, st_nick AS 별명,
        st_nick_rem AS 별명이유, st_dep_no AS 학과번호
from tbl_student;

CREATE TABLE tbl_dept (
dept_no	CHAR(3)	Primary key,
dept_name	nVARCHAR2(30)		NOT NULL,
dept_pro	nVARCHAR2(50),		
dept_te	nVARCHAR2(50)	
);

select *
from tbl_dept;

-- tbl_student 와 tbl_dept를 LEFT JOIN해서 리스트를 확인



-- DDL 생성 : CREATE
-- DDL 삭제 : DROP
-- DDL 변경 : ALTER

-- 컬럼명 변경
ALTER TABLE tbl_student RENAME COLUMN st_dep_no TO st_dept_no;

-- 컬럼의 타입
-- 원래 존재한 st_weight 칼럼의 데이터 타입 변경
-- 
ALTER TABLE tbl_student MODIFY (st_weight NUMBER(5));

SELECT * FROM tbl_student, tbl_dept
WHERE st_dept_no = dept_no;