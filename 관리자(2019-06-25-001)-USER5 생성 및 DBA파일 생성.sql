-- 이곳은 관리자 화면입니다.
-- C:/bizwork/mydb 폴더에 USER5TS 이름으로 tablespace를 생성하고
-- 초기크기는 500MB, 자동증가 100kb

-- user5 사용자를 생성
-- DBA 권한 부여

-- user5 접속정보를 설정하고
-- user5 질의 작성기 창을 열어서


CREATE TABLESPACE user5TS
DATAFILE 'C:/bizwork/mydb/user5TS.dbf'
SIZE 500M AUTOEXTEND ON NEXT 100k;

CREATE USER user5
IDENTIFIED BY 1234
DEFAULT TABLESPACE user5TS;

GRANT DBA to user5;
