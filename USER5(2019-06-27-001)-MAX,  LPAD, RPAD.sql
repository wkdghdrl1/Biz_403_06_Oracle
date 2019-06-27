SELECT * FROM tbl_student;

COMMIT;


SELECT MAX(st_no) FROM tbl_student;

-- 칼람의 Type char 이고
-- 칼럼의 데이터들이 숫자형일 때만 사용가능한 문법
SELECT MAX(st_no) + 1 FROM tbl_student;

-- 현재 tbl_student에서 st_no의 가장 마지막 학번 + 1의 값으로
-- 새로운 학번을 생성
SELECT LPAD(MAX(st_no) + 1,3,'0') FROM tbl_student;


-- PAD 키워드는 특정한 길의 문자열의 패턴을 만드는 방법

-- RPAD(값, 크기, 문자열)
-- 전체 문자열의 '크기'를 지정하고, 
--값을 왼쪽에 위치시키고,
-- 남는 부분에 '문자열'로 채운다.

SELECT RPAD(3,5, '0') FROM DUAL;

-- LPAD(값, 크기, 문자열)
-- 전체 문자열의 '크기'를 지정하고, 
-- 값을 오른쪽에 위치시키고,
-- 남는 부분에 '문자열'로 채운다.
SELECT LPAD(3,5, '0') FROM DUAL;