-- (1) sqltest/a1234 ����ڸ� �߰��Ͻÿ�.
create user sqltest identified by a1234;

-- (2) �߰��� sqltest ������� ��й�ȣ�� 1234�� �����Ͻÿ�.
alter user sqltest identified by 1234;

-- (3) �߰��� sqltest ������ ��� ���̺��� ��� ������ �ο��Ͻÿ�.
grant connect, resource to sqltest;

select *
from all_users;

-- (4) �߰��� sqltest2/23456 ����� ������ �߰��ϰ�, ��� ������ �ο��Ͻÿ�.
create user sqltest2 identified by 23456;
grant connect, resource to sqltest2;

select *
from all_users;

-- (5) sqltest2�� ��� ���̺��� ��� ������ ȸ���ϰ�, sqltest2 ������ �����Ͻÿ�.
revoke connect, resource from sqltest2;
drop user sqltest2 cascade;