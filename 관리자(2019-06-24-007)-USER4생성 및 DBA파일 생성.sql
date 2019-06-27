--관리자 화면입니다.
-- C:/bizwork/mydb 폴더에 user4TS 이름으로 TableSpace를 생성하고
-- 이름 : user4TS, 데이터파일 user4TS.dbf
-- 크기 : 500MB, 자동증가 100kb 

CREATE TABLESPACE  user4TS
DATAFILE 'C:/bizwork/mydb/user4TS.dbf'
SIZE 500M AUTOEXTEND ON NEXT 100k;

--USER4를 생성
--비밀번호  : 1234, 기본 TABLESPACE: user4TS로 설정

CREATE USER user4
IDENTIFIED by 1234
DEFAULT TABLESPACE user4TS;

GRANT DBA to user4;