-- USER6 화면입니다.

CREATE TABLE tbl_iolist (
    io_seq	    NUMBER	        PRIMARY KEY,	
    io_date 	VARCHAR2(10)		NOT NULL,
    io_product	NVARCHAR2(50)		NOT NULL,
    io_comp	    NVARCHAR2(50)		NOT NULL,
    io_comp_ceo	NVARCHAR2(50),
    io_inout	NVARCHAR2(10)		NOT NULL,
    io_qty	    NUMBER,
    io_price	NUMBER,	
    io_total	NUMBER		
);

CREATE SEQUENCE seq_iolist
START WITH 1
INCREMENT BY 1;