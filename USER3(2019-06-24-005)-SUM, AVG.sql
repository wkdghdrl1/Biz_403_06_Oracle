-- 여기는 USER3입니다.

-- tbl_score에 저장된 레코드의 개수가 몇개?
SELECT COUNT(*) FROM tbl_score;

-- 조건에 맞는 레코드가 몇개?
SELECT COUNT(*) FROM tbl_score
WHERE sc_num = '00001';

-- 합계를 계산하는 집계함수
-- 일반적으로 NUMBER로 되어있는 칼럼에서만 유효
SELECT SUM(sc_score)
FROM tbl_score;

-- 각 학생별로 3과목의 합계(총점)가 얼마인지 알고싶다?
SELECT sc_num 학번, SUM(sc_score) 점수  -- 2. 그룹으로 묶인 레코드들만의 점수 합계?
FROM tbl_score
GROUP BY sc_num; -- 1. 학번으로 전체 데이터를 그룹지어라

-- ROUND : 반올림 함수
-- ROUND() : 소수점이하 1자리 반올림 후 정수로 표시
-- ROUND(값, 자릿수) : 자릿수 : + 1의 자리에서 반올림하고 자릿수 까지 표시
SELECT sc_num, ROUND(AVG(sc_score), 2)
FROM tbl_score
GROUP BY sc_num;

-- 최대값
SELECT sc_num, MAX(sc_score)
FROM tbl_score
GROUP BY sc_num;

-- 최소값
SELECT sc_num, MIN(sc_score)
FROM tbl_score
GROUP BY sc_num;

-- 중복값 제외하고 보여주기
SELECT DISTINCT sc_num
FROM tbl_score;

SELECT sc_num, SUM(sc_score)
FROM tbl_score
GROUP BY sc_num;

-- 과목(sc_subject)칼럼을 기준으로 오름차순 정렬하라
SELECT sc_num, sc_subject, sc_score
FROm tbl_score
ORDER BY sc_subject;

-- 학번으로 정렬을 수행하고
-- 같은 학번이 있으면 그 내부에서 과목으로 다시 정렬하라
SELECT * FROM tbl_score
ORDER BY sc_num, sc_subject;

--내림차순 정렬(ASC 생략가능)
SELECT * FROm tbl_score
ORDER BY sc_num ASC, sc_subject ASC;


-- 내림차순 정렬
-- 학번으로 내림차순 정렬하고, 그 내부에서 과목으로 내림차순 정렬
SELECT * FROm tbl_score
ORDER BY sc_num DESC, sc_subject DESC;

-- 학번으로 내림차순 정렬하고, 그 내부에서 과목으로 오름차순 정렬
SELECT * FROm tbl_score
ORDER BY sc_num DESC, sc_subject ;

-- GROUP BY를 실행한 후 SUM(sc_score)를 계산하고
-- 그 결과과 230보다 큰 리스트만 보여라
-- SELECT > FROM > GROUP > HAVING 순으로 
SELECT sc_num, SUM(sc_score)
FROM tbl_score
GROUP BY sc_num
HAVING SUM(sc_score) > 230;

-- 과목이 국어인 리스트를 추출하여
-- GROUP BY를 실행하고 
-- 점수를 합산하고
-- 합산한 점수가 230보다 큰 리스트만 보여라
SELECT sc_num, SUM(sc_score) -- 3번
FROM tbl_score
WHERE sc_subject = '국어' -- 실행순서 1번
GROUP BY sc_num -- 2번
HAVING SUM(sc_score) > 230; --  4번
