-- (1) sqltest/a1234 사용자를 추가하시오.
create user sqltest identified by a1234;

-- (2) 추가된 sqltest 사용자의 비밀번호를 1234로 변경하시오.
alter user sqltest identified by 1234;

-- (3) 추가된 sqltest 계정에 모든 테이블의 모든 권한을 부여하시오.
grant connect, resource to sqltest;

select *
from all_users;

-- (4) 추가된 sqltest2/23456 사용자 계정을 추가하고, 모든 권한을 부여하시오.
create user sqltest2 identified by 23456;
grant connect, resource to sqltest2;

select *
from all_users;

-- (5) sqltest2에 모든 테이블의 모든 권한을 회수하고, sqltest2 계정을 삭제하시오.
revoke connect, resource from sqltest2;
drop user sqltest2 cascade;