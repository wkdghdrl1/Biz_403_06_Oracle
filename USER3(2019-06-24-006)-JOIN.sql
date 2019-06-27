-- USER3
-- JOIN

SELECT SC.sc_num 학번, ST.st_name 이름, SC.sc_subject 과목, SC.sc_score 점수
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num;

SELECT SC.sc_num 학번, ST.st_name 이름, SUM(SC.sc_score) 합계
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num
GROUP BY Sc.sc_num, ST.st_name
ORDER BY SC.sc_num;

SELECT SC.sc_num 학번, ST.st_name 이름, ROUND(AVG(SC.sc_score), 2)
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num
GROUP BY Sc.sc_num, ST.st_name
ORDER BY SC.sc_num;

-- ROUND : 반올림, TRUNC  : 버림
SELECT SC.sc_num 학번, ST.st_name 이름, 
        TRUNC(AVG(SC.sc_score), 2) 평균1, 
        ROUND(AVG(SC.sc_score)) 평균2
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num
GROUP BY Sc.sc_num, ST.st_name
ORDER BY SC.sc_num;

SELECT SC.sc_num 학번, ST.st_name 이름, 
        SUM(SC.sc_score) 합계, 
        TRUNC(AVG(SC.sc_score), 2) 평균1, 
        ROUND(AVG(SC.sc_score)) 평균2
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num
GROUP BY Sc.sc_num, ST.st_name
HAVING ROUND(AVG(SC.sc_score)) >= 80
ORDER BY SC.sc_num;


