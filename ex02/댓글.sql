-- ���
create table tbl_reply(
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create SEQUENCE seq_reply;

-- rno �⺻Ű ����(�̸� : pk_reply)
alter table tbl_reply
add CONSTRAINT pk_reply primary key(rno);

-- bno : �ܷ�Ű ����(�̸� : fk_reply_board)
alter table tbl_reply
add CONSTRAINT fk_reply_board FOREIGN key(bno) REFERENCES tbl_board(bno) on delete cascade;

-- ������������ 10�� ������ ��ȸ
select *
from tbl_board
where rownum < 10
order by bno desc;

-- �߰��� ���Test Ȯ��
select *
from tbl_reply;

-- ��ü ������ ��ȸ sql��
select * 
from tbl_reply 
order by rno desc;

select * 
from tbl_reply 
where bno = 786442
order by rno desc;

-- Test�� ���� ��� �߰�
insert into tbl_reply(rno, bno, reply, replyer)
values(seq_reply.nextval, 786442, '��� test �Է�', 'ȫ�浿');

commit;