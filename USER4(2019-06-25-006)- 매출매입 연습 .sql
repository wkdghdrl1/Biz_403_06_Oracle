-- 여기는 USER4 화면입니다.

SELECT * FROM tbl_iolist;

-- 전체리스트의 개수를 확인

SELECT COUNT(*) FROM tbl_iolist;

--매출과 매입을 구분해서 개수를 확인
SELECT io_inout, COUNT(*) FROM tbl_iolist
GROUP BY io_inout;

--매출합계와 매입합계
 
 SELECT io_inout, SUM(io_total) FROM tbl_iolist
 GROUP BY io_inout;

--매입매출 리스트중에서
-- 2018-10-01 ~2018-10-31
-- io_date 칼럼은 VARCHAR2로 설정되어 문자열 데이터를 저장하고 있다.
-- 일반적인 프로그래밍 언어에서는 부등호 관계산이 숫자형 데이터만 허용이 된다.
-- 하지만 SQL에서는 저장되는 문자열의 길이가 모두 같고
-- 저장되는 형식이 같으면 부등호 관계연상을 수행할 수 있다.
SELECT *
FROM tbl_iolist
WHERE io_date >= '2018-10-01' AND io_date <= '2018-10-31'
ORDER BY io_date;
-- 문자열 길이가 일정할 때만 위 연산 작동 가능

SELECT io_pcode, P.p_name
FROM tbl_iolist IO
    LEFT JOIN tbl_product P
        ON P.p_code = IO.io_pcode
WHERE io_pcode >=  'P00011' AND io_pcode <= 'P00020'
ORDER BY io_pcode;


SELECT io_date, io_pcode
FROM tbl_iolist
WHERE io_pcode  = 'P00011';

--고오급 SQL

-- 매입과 매출을 구분하여 리스트를 출력
SELECT io_date, io_inout, SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_;

SELECT io_inout, 
        DECODE(io_inout, '매입', io_total, 0) AS 매입금액,
        DECODE(io_inout, '매출', io_total, 0) AS 매출금액
FROM tbl_iolist
ORDER BY io_date;

-- 상품별로 매입, 매출의 총 합을 구해서 리스트를 보여달라.
-- 상품코드로 묶고, 구분으로 묶어서 집계를 낸 리스트
SELECT io_pcode, io_inout, 
       SUM(DECODE(io_inout, '매입', io_total, 0)) AS 매입금액,
       SUM(DECODE(io_inout, '매출', io_total, 0)) AS 매출금액
FROM tbl_iolist
GROUP BY io_pcode, io_inout
ORDER BY io_pcode, io_inout;

-- 일일 매입매출 합계 리스트
SELECT io_date, io_inout, 
       SUM(DECODE(io_inout, '매입', io_total, 0)) AS 매입금액,
       SUM(DECODE(io_inout, '매출', io_total, 0)) AS 매출금액
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date, io_inout;

-- 날짜별 매출 매입 및 마진
SELECT SUBSTR(io_date, 0, 10),  
       SUM(DECODE(io_inout, '매입', io_total, 0)) AS 매입금액,
       SUM(DECODE(io_inout, '매출', io_total, 0)) AS 매출금액,
       SUM(DECODE(io_inout, '매출', io_total, 0)) -
       SUM(DECODE(io_inout, '매입', io_total, 0)) AS 마진
FROM tbl_iolist
GROUP BY SUBSTR(io_date, 0, 10)
ORDER BY SUBSTR(io_date, 0, 10);


-- 전체기간에 매입, 매출, 마진을 계산하기
SELECT  
       SUM(DECODE(io_inout, '매입', io_total, 0)) AS 매입금액,
       SUM(DECODE(io_inout, '매출', io_total, 0)) AS 매출금액,
       
       SUM(DECODE(io_inout, '매출', io_total, 0)) -
       SUM(DECODE(io_inout, '매입', io_total, 0)) AS 마진
FROM tbl_iolist;



SELECT  
       SUM(DECODE(io_inout, '매입', io_total, 0)) AS 매입금액,
       SUM(DECODE(io_inout, '매출', io_total, 0)) AS 매출금액,
       
       SUM(DECODE(io_inout, '매출', io_total, 0)) -
       SUM(DECODE(io_inout, '매입', io_total, 0)) AS 마진
FROM tbl_iolist
WHERE io_date >= '2018-03-01' AND io_date < '2018-03-31';

-- BETWEEN
-- 범위를 지정하여 검색할 때
-- 두 범위값이 포함될 경우(= 이 있을 경우)에는
-- BETWEEN 키워드를 사용해서 범위 검색을 할 수 있다.
SELECT *
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31';

--  IN :
--  동일한 칼럼에 포함된 값들이 있는지 검사하는 방법
--  OR 연산을 사용하지 않고 IN키워드를 사용해서
-- WHERE 조건 검색을 실행할 수 있다.
SELECT io_pcode, P.p_name, io_price, io_total
FROM tbl_iolist IO
 LEFT JOIN tbl_product P
    ON IO.io_pcode = P.p_code
    
WHERE io_pcode IN ('P00037', 'P00031',  'P00021', 'P00011');
      
      
SELECT p_code, p_name
FROM tbl_product;

SELECT p_code, p_name
FROM tbl_product
WHERE p_name = '빙하시대(파인)';

-- LIKE :
-- 부분문자열 검색을 실행한다.
SELECT p_code, p_name
FROM tbl_product
WHERE p_name LIKE '(신)%';


-- '(신)%' : (신)으로 시작되는 모든 문자열
--  '%(신)' : (신)으로 끝나느 모든 문자열
-- '%(신)%' : (신)을 포함한 모든 문자열

-- 게시판 할 때 사용 제목으로 찾기, 내용으로 찾기
SELECT p_code, p_name
FROM tbl_product
WHERE p_name LIKE '%바%';
