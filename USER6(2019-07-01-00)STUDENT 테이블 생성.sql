CREATE TABLE tbl_score(
    sc_seq NUMBER PRIMARY KEY,
    sc_st_num VARCHAR2(5) NOT NULL,
    sc_subject nVARCHAR2(20) NOT NULL,
    sc_score NUMBER
    );
CREATE SEQUENCE seq_score
START WITH 12
INCREMENT BY 1;

INSERT INTO tbl_score(sc_seq, sc_st_num, sc_subject, sc_score)
VALUES(seq_score.NEXTVAL, '00001', '국어', 90);
commit;

select * from tbl_student;

SELECT * FROM tbl_score;