-- 여기는 USER6 화면입니다.
SELECT * FROM tbl_student;
SELECT * FROM tbl_score;

DROP TABLE tbl_score;
CREATE TABLE tbl_score(
    SC_SEQ   NUMBER ,
    SC_ST_NUM VARCHAR2(5) NOT NULL,
    SC_SUBJECT NVARCHAR2(3) NOT NULL,
    SC_SCORE NUMBER,
    PRIMARY KEY(SC_SEQ)
);

-- tbl_student와 tbl_score의 참조관계 설정
ALTER TABLE tbl_score
ADD CONSTRAINT f_st_num FOREIGN KEY (sc_st_num)
REFERENCES tbl_student(st_num)
ON DELETE CASCADE;