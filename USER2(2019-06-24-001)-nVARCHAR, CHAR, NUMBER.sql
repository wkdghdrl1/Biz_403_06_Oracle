--USER2로 접속한 화면입니다.

-- 데이터를 저장하기 위해서 저장공간을 설정
-- Java에서 설정한 VO개념과 같다.

-- CHAR : 고정길이 문자열
--  저장하는 문자열이 지정된 크기보다 작으면 나머지 부분을 
--  빈 공간으로 남겨둔다.
-- VARCHAR2 : 가변길이 문자열
--  저장하는 문자열이 지정된 크기보다 작으면
--  나머지 부분을 압축하여 공간을 저장한다.
-- nCHAR, nVARCHAR2 : 다국어(한글, 한자 등)를 저장할 때 사용하며,
--      지정된 크기는 문자열의 개수를 나타낸다.
-- NUMBER : 모든 숫자를 통틀어서 사용하는 자료형
-- 크기를 지정하지 않으면 NUMBER(38, 22)와 같은 개녕이고
-- 정수부 38자리, 유효숫자(소수점이하) 22자리까지 저장하는 형태
-- 특별한 값을 지정하지 않으면 가변형으로 저장되어 실제 저장되는 값 만큼만
-- 공간을 차지한다.
CREATE TABLE tbl_student (
    st_num CHAR(5),
    st_name nVARCHAR2(50),
    st_age NUMBER,
    st_grade NUMBER,
    st_tel VARCHAR2(15)
    );

-- 데이터 추가(CREATE : 명령어 CREATE와는 다른 개념)
SELECT *
from tbl_student;

-- TABLE의 칼럼순서와 데이터의 순서가 같고
-- 모든 칼럼에 데이터를 추가할 경우는 TABLE이름 뒤에 칼럼 리스트를 생략할 수 있다. 
INSERT INTO tbl_student
VALUES('00002','성춘향',16,2,'002-002');

-- DB에서는 가끔 TABLE에 초기에는 없던 칼럼을 추가하는 경우가 있다.
-- 이 때 추가되는 칼럼은 보통 끝에 위치하기는 하지만
-- 정해진 바가 없다.
-- 그래서 INSERT를 수행할 때
-- 가급적 원하는 순서대로 칼럼리스트를 명시해주는 것이 좋다.
INSERT INTO tbl_student(st_num, st_name, st_age, st_tel, st_grade)
VALUES('00003','이몽룡', 22,'003-003', 1);

INSERT INTO tbl_student(st_num, st_name, st_age, st_tel, st_grade)
VALUES('00001','홍길동', 24,'003-003', 3);

INSERT INTO tbl_student(st_num, st_name, st_age, st_tel, st_grade)
VALUES('00001','임꺽정', 24,'003-003', 3);
-- 데이터 확인(READ)
SELECT st_num, st_name, st_age, st_grade, st_tel
from tbl_student;

-- 칼럼 전체를 모두 포함한 리스트를 보고자 할 때는
SELECT * FROM tbl_student;

-- 만약 학생의 학번, 이름, 전화번호만 리스트를 보고자 할 때
SELECT st_num, st_name, st_tel FROM tbl_student;

-- 칼럼 순서를 바꾸어서 리스트를 보고자 할 때 
SELECT st_name, st_tel, st_num FROM tbl_student;

-- 리스트의 머릿글을 칼럼이름이 아닌
-- 원하는 이름으로 바꾸어 보고자 할 때
-- 오라클에서는 AS 키워드를 생략해도 된다.
SELECT st_num AS 학번, st_name AS 이름, st_tel AS 전화번호 
FROM tbl_student;

