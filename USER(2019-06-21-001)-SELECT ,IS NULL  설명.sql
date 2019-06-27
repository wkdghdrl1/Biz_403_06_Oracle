SELECT * FROM TBL_USER;

-- tbl_user 테이블에 저장된 값들 중에서 u_name 칼럼이 null값인 리스트만 보여줘라.
SELECT * FROM tbl_user
WHERE u_name is NULL;

-- tbl_user 테이브레 저장된 값들 중에서 u_name 칼럼이 null값이 아닌 리스트만 보여줘라.
SELECT * FROM tbl_user
WHERE u_name is NOT NULL; 