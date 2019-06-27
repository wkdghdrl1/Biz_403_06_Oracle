--관리자 질의 작성기 화면입니다.
-- DBA(DataBase Admin) CREAT TABLE    (DDL : Data Definition Lang)
-- 이 Lang은 주로 DBA가 사용한다.
-- 데이터 물리적인 어떤 상태를 변경(생성, 삭제)할 수 있기 때문에
-- 매우 주의를 해서 사용해야 한다.
-- 데이터를 물리적으로 변경한다는 것은
-- 어떤 조건에 관계없이 다량의 데이터에 대하여 영향을 미치는 것을 의미


-- 일반사용자      (INSERT INTO   DML : Data Manufulation Lang)
-- 응용프로그래머  SELECT FROM
--                 UPDATE SET
--                 DELETE FROM)
-- 주로 데이터를 추가, 조회(읽기), 변경, 삭제 등을 수행하며
-- 기본적으로 제한된 개수의 데이터에 변경이 일어난다.
-- 특별히 악의적으로 데이터를 변경하지 않는다면
--  큰 영향없는 데이터 변경이 이루어진다.
--  데이터 추가 : INSERT INT VALUES
--  데이터 조회(읽기) : SELECT FROM
--  데이터 변경 : UPDATA SET WHERE
--  데이터 삭제 : DELETE FROM WHERE

--DBA     등급             DCL  DCL : DATA Controll Lang
-- 데이터에 직접적인 어떤 영향을 미치지는 않지만
-- 데이터의 상태를 변경하거나
-- 사용자의 권환 등을 제어하여
-- 데이터를 보호하는 역할들을 수행한다.
-- CUD(INSERT, UPDATE, DELETE)된 데이터를 취소(되돌리는)기능
-- CUD된 데이터를 확정하는 기능
--   CUD를 수행하는 동안에는 변경된 데이터에 대한 정보가
--   메모리(기억장소)에 있게된다.
--   메모리는 특성상 작동되는 동안에 전원등에 이상이 발생하면
--   데이터를 모두 잃게 된다.
--   그래서 메모리에 남아있는 데이터 변경사항을 실제 물리적 저장소에
--   강제로 반영할 필요가 있을 때가 있다.
--   이때 사용하는 명령어를 데이터 확정 기능 명령
