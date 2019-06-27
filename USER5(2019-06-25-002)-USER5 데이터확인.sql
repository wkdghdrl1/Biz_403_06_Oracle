
select * from tbl_score;

SELECT sc_date, sc_st_no,
    SUM(DECODE(sc_subject, '국어' , sc_score, 0)) AS 국어,
    SUM(DECODE(sc_subject, '영어' , sc_score, 0)) AS 영어,
    SUM(DECODE(sc_subject, '수학' , sc_score, 0)) AS 수학
FROM tbl_score
GROUP BY sc_date, sc_st_no;


