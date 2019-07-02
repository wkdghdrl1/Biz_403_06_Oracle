-- USER6 화면입니다.
Drop TABLE tbl_iolist;
CREATE TABLE tbl_iolist (
    io_seq	    NUMBER	PRIMARY KEY	,
    io_date	    VARCHAR2(10)		NOT NULL,
    io_pcode	NVARCHAR2(5)		NOT NULL,
    io_ccode	NVARCHAR2(5)		NOT NULL,
    io_inout	VARCHAR2(1)		    NOT NULL,
    io_qty	    NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER		
	
);

CREATE SEQUENCE seq_iolist
START WITH 1
INCREMENT BY 1;

SELECT * FROM tbl_iolist;