-- Ȥ�� �⺻�� tbl_board�� seq_board ������ �� �����ϱ� ���� �� ���� ����
drop table tbl_board;
drop SEQUENCE seq_board;

create SEQUENCE seq_board;

create table tbl_board(
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,       -- �ۼ���
    updatedate date default sysdate    -- ������
);

-- ���̺� ���� �ٲٱ�(�⺻Ű ����) : �⺻Ű �̸� pk_board�� ����
alter table tbl_board add CONSTRAINT pk_board
primary key(bno);

-- table�� �⺻Ű ��ȸ
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'TBL_BOARD'
AND constraint_type = 'P';

-- �����ϰ� ������ �⺻Ű �̸� : SYS_C007020
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'BOARD'
AND constraint_type = 'P';

-- tbl_board �����Ͽ� ������ ������
desc tbl_board;

-- ���� ������ �߰�
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '�׽�Ʈ ����1', '�׽�Ʈ ����', 'user00');
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '�׽�Ʈ ����2', '�׽�Ʈ ����', 'user00');
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '�׽�Ʈ ����3', '�׽�Ʈ ����', 'user00');
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '�׽�Ʈ ����4', '�׽�Ʈ ����', 'user00');
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '�׽�Ʈ ����5', '�׽�Ʈ ����', 'user00');

commit;

select *
from tbl_board;
