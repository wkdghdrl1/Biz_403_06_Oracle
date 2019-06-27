INSERT INTO tbl_student(st_num, st_name, st_age, st_tel, st_grade)
VALUES('00001','임꺽정', 24,'003-003', 3);


INSERT INTO tbl_Student(st_name, st_tel)
VALUES('성춘향', '00010001');

SELECT * FROM tbl_studet;


DROP TABLE tbl_student;

CREATE TABLE tbl_student(
    -- UNIQUE와 NOT NULL  옵션은 특정칼럼의 데이터를
    --   유일하고, 비어있지 않은 상태로 유지하여
    --   TABLE 전체의 무결성을 유지하기 위한 설정이다.
    -- UNIQUE : st_num 칼럼에는 절대 중복된 데이터가 입력될 수 없다.
    -- NOT null : st_num 칼럼은 절대 비우둘 수 없다.
    st_num CHAR(5) UNIQUE NOT NULL,
    st_name nVARCHAR2(50),
    st_tel VARCHAR2(15)
    );

INSERT INTO tbl_student(st_num, st_name)
VALUES('00001', '홍길동');

INSERT INTO tbl_student(st_name)
VALUES('홍길동');

SELECT *
from tbl_student;

CREATE TABLE tbl_student(
    -- PK는 데이터 테이블의 무결성을 보장하기 위한 매우 중요한 설정
    -- PK로 설정된 칼럼은 그 값이 유일하고, 결점이 없다는 보장을 한다.
    st_num CHAR(5) PRIMARY KEY,--UNIQUE NOT NULL
    st_name nVARCHAR2(50) NOT NULL,
    st_tel VARCHAR2(15) 
);

CREATE TABLE tbl_studet(
st_num CHAR(5) UNIQUE,
st_name nVARCHAR2(50),
st_tel VARCHAR2(15)
);

INSERT INTO tbl_student(st_num, st_name)
VALUES('00001','홍길동');

-- 칼러리스트 개수와 데이터 개수가 틀린경우
-- not enough values
INSERT INTO tbl_student(st_num, st_name)
VALUES('00002');

-- st_name 칼럼이 NOT NULL로 설정되었는데 데이터를 포함하지 않아서
-- 오류 발생
-- cannot insert NUll INTO
INSERT INTO tbl_student(st_num)
VALUES('00002');


INSERT INTO tbl_student(st_num, st_name)
VALUES('00002', '성춘향');

SELECT * FROM tbl_student;

-- UPDATE 명령을 수행하면서 
-- PK로 설정된 칼럼을 WHERE 절로 설정을 하면
-- 이 테이블에 저장된 데이터중에서
-- 단 한개의 레코드만 변경될 것이다.
UPDATE tbl_student
SET st_tel = '001-001'
WHERE st_num = '00002';

-- DELETE 명령을 수행하면서
-- PK로 설정된 칼럼을 WHERE 절로 설정을 하면
-- 이 테이블에 저장된 데이터중에서
-- 단 한개의 레코드만 삭제될 것이다.
DELETE FROM tbl_student
WHERE st_num = '00002';

-- 무결성이란
-- 테이블에 데이터를 추가할 때 PK로 설정된 칼럼은
-- 절대 중복될 수 없고, 빈 값을 남겨둘 수 없다.
-- PK칼럼을 조건으로 하여 UPDATE, DELETE를 수행했을 때
-- 반드시 1개의 레코드에만 영향이 미친다는 보장