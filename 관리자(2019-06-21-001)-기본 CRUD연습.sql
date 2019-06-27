--관리자 질의 작성기
SELECT * 
FROM access$;

SELECT *
FROM access$
WHERE d_obj# = 1299;

-- SQL 명령문은 대표키워드로 시작해서 보조 키워드들이 나열되는 형태이다.
-- 일반적으로 명령문이나 변수명들은 대소문자 구별이 없다.
-- 다만 작성할 때 학습차원에서
-- 키워드는 대문자로 사용하고, 기타 변수명 등은 소문자로 작성한다.

-- SQL 명령문은 여러줄에 걸쳐 사용할 수 있고,
-- 명령문의 끝에는 세미콜론(;)을 붙여준다.

-- 명령문 중간에서 CTRL + Enter를 누르면
-- 해당하는 명령문을 오라클 DBMS에게 전송하고 결과를 보여준다.

-- 연습
-- CREATE TABEL은 데이터 저장소의 최소 단위
-- 실제로 데이터들을 보관할 장소
-- 테이블 객체
-- DBA가 아닌 경우는 일반적으로 테이블 객체를 생성할 수 없다.
CREATE TABLE tbl_student(
    st_name nVARCHAR2(30), -- 데이터의 필드, 멤버변수 역할이며 DB에서는 칼럼이라고 부른다.
    st_age NUMBER
);

-- CRUD keyword는
-- 기본 keyword와 보조 keyword가 있는데,
-- 기본 Keyword에 따라 보조 keyword가 필수적으로 따라다녀야 하는 경우가 있다.

--INSTER INTO VALUES
--SELECT FROM WHERE
--UPDATE SET WHERE
--DELETE FROM WHERE
-- WHERE는 필수 키워드는 아니나,  UPDATE와 DELETE 키워드에서는 WHERE가 필수적인 것처럼 쓰인다.

INSERT INTO tbl_student(st_name,st_age) --필수
VALUES('홍길동',33); --필수

INSERT INTO tbl_student(st_name,st_age) --필수
VALUES('성춘향',16); --필수

INSERT INTO tbl_student(st_name,st_age) --필수
VALUES('이몽룡',22); --필수


SELECT * FROM tbl_student
WHERE st_age = 16;



SELECT * FROM tbl_student ;

SELECT * FROM tbl_student 
WHERE st_name = '성춘향';

SELECT * 
FROM tbl_student   --필수
WHERE st_age = 16; -- 선택


-- 매우 조심해서 연습할 키워드
-- UPDATE, DELETE를 연습
-- UPDETE, DELETE 키워드에서 WHERE절은 선택사항이지만,
-- 우리는 필수 키워드라고 생각하자.
UPDATE tbl_student
SET st_age = 100
WHERE st_name = '이몽룡';

SELECT * FROM tbl_student;

DELETE FROM tbl_student
WHERE st_name = '김길동';

-- 정리
------------
--CRUD명령
------------

--CREATE
INSERT INTO 테이블명(칼럼리스트)
VALUES(데이터리스트);

--READ
SELECT * FROM 테이블병
WHERE 칼럼 = 조건;

--UPDATE
UPDATE 테이블명
SET 칼럼1 = 값, 칼럼2 =  값;

--DELETE
DELETE FROM 테이블명
WHERE 칼럼 = 조건;