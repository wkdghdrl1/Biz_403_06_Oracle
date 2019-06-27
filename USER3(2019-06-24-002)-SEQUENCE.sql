-- 여기는 USER3 화면입니다.

CREATE TABLE tbl_score(
    sc_seq NUMBER PRIMARY KEY, 
    -- AUTO INCREMENT : 다른 DBMS에서는 INSERT를 수항핼 때 칼럼의 값을 자동으로 넘버링 해주는 옵션,
    -- 오라클 11 이하에서는 사용불가
    -- 오라클 12 이상에서는 사용가능
    sc_num CHAR(5) NOT NULL,
    sc_subject nVARCHAR2(10),
    sc_score NUMBER
    );

-- 오라클 11 이하에서는 자동증가 옵션이 없는 관계로
-- 별도로 넘버링용 요소(객체)를 사용해서 자동 증가 효과를 만든다.
INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
VALUES (1,'00001','국어',90);

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
VALUES (2,'00001','영어',80);

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
VALUES (3,'00001','수학',70);

CREATE SEQUENCE seq_score
START WITH 4
INCREMENT BY 1;

SELECT seq_score.NEXTVAL FROM DUAL;

delete from tbl_score
where sc_seq = 17;

SELECT * FROM tbl_score;

delete from tbl_score
where sc_seq = 20;

UPDATE tbl_score
SET sc_score = 88
WHERE sc_seq = 10;

-- 만약 sc_seq 칼럼이 없다면
UPDATE tbl_score
SET sc_score = 90
WHERE sc_num = '00002' AND sc_subject = '수학';
-- 여러 칼럼에 조건을 설정하여
-- UPDATE나 DELETE는 가급적 사용하지 않는 것이 좋다.

UPDATE sc_score
SET sc_subject = '미술'
WHERE sc_subject = '수학';

-- UPDATE나 INSERT, DELETE를 수행하여도
-- 실제로 물리적 Table에 데이터가 저장되지 않는다.
-- 그래서 데이터를 강제로 물리적 Table에 저장해 줄 필요가 있다.
COMMIT;
-- ROLLBACK과 반대되는 개념

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
VALUES(SEQ_SCORE.NEXTVAL, '00003', '국어', 10);

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
VALUES(SEQ_SCORE.NEXTVAL, '00003', '영어', 11);

INSERT INTO tbl_score(sc_seq, sc_num, sc_subject, sc_score)
VALUES(SEQ_SCORE.NEXTVAL, '00003', '수학', 22);

SELECT * FROM tbl_score;

-- INSERT, UPDATE, DELETE된 데이터를 되돌리는 기능
-- 취소와 비슷한 개념이며
-- 가장 최근에 COMMIT된 이후의 명령 수행을 취소하는 역할
-- 또는 가장 최근에 CREATE 명령을 수행한 이후의 명령수행(CUD)을 취소하는 역할
ROLLBACK;

SELECT * FROM tbl_score;