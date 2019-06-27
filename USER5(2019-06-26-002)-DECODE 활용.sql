--USER5 화면입니다.

SELECT * FROm tbl_score;


-- score테이블의 데이터를 PIVOT VIEW로 생성하여
-- 학생별 성적 알림표를 작성

SELECT SC.sc_st_no AS 학번, 
       ST.st_name  AS 학번이름,
      
    SUM(DECODE(sc_subject, '국어', sc_score, 0)) AS 국어,
    SUM(DECODE(sc_subject, '영어', sc_score, 0)) AS 영어,
    SUM(DECODE(sc_subject, '수학', sc_score, 0)) AS 수학,
    
       SUM(DECODE(sc_subject, '국어', sc_score, 0) +
           DECODE(sc_subject, '영어', sc_score, 0) +
           DECODE(sc_subject, '수학', sc_score, 0)) AS 총점,
    
 ROUND(AVG(DECODE(sc_subject, '국어', sc_score, 0) +
           DECODE(sc_subject, '영어', sc_score, 0) +
           DECODE(sc_subject, '수학', sc_score, 0)),1) AS 평균
     
FROM tbl_score SC
    LEFT JOIN  tbl_student ST
        ON SC.sc_st_no = ST.st_no
GROUP BY SC.sc_st_no, ST.st_name
ORDER BY SC.sc_st_no;