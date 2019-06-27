-- 여기는 USER4 화면입니다.

CREATE TABLE tbl_iolist (
    io_seq	    NUMBER	Primary KEY,	
    io_date	    VARCHAR2(10)	NOT NULL,
    io_product	NVARCHAR2(50)	NOT NULL,
    io_dept	    NVARCHAR2(50)	NOT NULL,
    io_dept_ceo	NVARCHAR2(30),
    io_inout	NVARCHAR2(10)	NOT NULL,
    io_amt	    NUMBER,
    io_price	NUMBER,	
    io_total	NUMBER	
    );

select * from tbl_iolist;
select COUNT(*) FROM tbl_iolist;

-- 매입과 매출을 구분해서 개수 세기

SELECT io_inout, COUNT(*) FROM tbl_iolist
GROUP BY io_inout;


-- tbl_iolist 테이블의 제2정규화 작업
-- 상품정보 tbl_iolist로부터 분리해서 상품테이블로 생성하기

SELECT io_product
FROM tbl_iolist
GROUP BY io_product
ORDER BY io_product;


--상품테이블 생성
CREATE TABLE tbl_product(
    p_code	    VARCHAR2(7)	Primary key,	
    p_name	    nVARCHAR2(50)	NOT NULL,
    p_iprice	NUMBER,
    p_oprice	NUMBER		
);

SELECT COUNT(*) FROM tbl_product;

-- 거래처 정보 분리 위해서
-- tbl_iolist에서 거래처 정보를 분리

SELECT io_dept, io_dept_ceo
FROM tbl_iolist
GROUP BY io_dept, io_dept_ceo
ORDER BY io_dept;

DROP TABLE tbl_comp;

CREATE TABLE tbl_comp(
        c_code	VARCHAR(5)	PRIMARY KEY,	
        c_name	nVARCHAR2(50)		NOT NULL,
      	c_ceo	nVARCHAR2(50)	NOT NULL,
      	c_tel	VARCHAR(15),		
        c_addr	NVARCHAR2(125)		
);

SELECT COUNT(*) FROM tbl_comp;

ALTER TABLE tbl_iolist ADD io_pcode VARCHAR2(7);
ALTER TABLE tbl_iolist ADD io_ccode VARCHAR2(5);

-- 상품정보에서 상품코드를 가져와서 iolist 테이블에 update
UPDATE tbl_iolist IO
SET io_pcode = 
(SELECT P.p_code FROM tbl_product P
 WHERE P.p_name =  Io.io_product
 );

-- r
 UPDATE tbl_iolist IO
 SET io_ccode =
 (SELECT C.c_code FROM tbl_comp C
    WHERE C.c_name = IO.io_dept AND
        C.c_code = IO.io_dept_ceo
    );
    
ALTER TABLE tbl_iolist DROP COLUMN io_product;
ALTER TABLE tbl_iolist DROP COLUMN io_dept;
ALTER TABLE tbl_iolist DROP COLUMN io_dept_ceo;