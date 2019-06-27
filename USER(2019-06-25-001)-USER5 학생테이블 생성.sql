
DROP TABLE tbl_student;
CREATE TABLE tbl_student (
    st_no   	CHAR(3)	            PRIMARY KEY,
    st_name	    nVARCHAR2(30)		NOT NULL,
    st_addr	    nVARCHAR2(50),		
    st_grade	NUMBER(1)		    NOT NULL,
    st_height	NUMBER(3),		
    st_weight	NUMBER(3),		
    st_nick	    nVARCHAR2(20),		
    st_nick_rem	nVARCHAR2(50),		
    st_dept	    nVARCHAR2(50)	    
);

SELECT * from tbl_student;

CREATE TABLE tbl_score (
    sc_seq	    NUMBER	PRIMARY KEY	NOT NULL,
    sc_date	    VARCHAR2(10)		NOT NULL,
    sc_st_no	CHAR(3)		        NOT NULL,
    sc_subject	nVARCHAR2(50)		NOT NULL,
    sc_score	NUMBER		
);
