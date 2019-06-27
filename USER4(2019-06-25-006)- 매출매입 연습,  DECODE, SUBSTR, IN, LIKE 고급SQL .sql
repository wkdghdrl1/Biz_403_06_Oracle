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
SELECT *
FROM tbl_iolist
WHERE io_date >= '2018-10-01' AND io_date <= '2018-10-31'
ORDER BY io_date;
-- 문자열 길이가 일정할 때만 위 연산 작동 가능

