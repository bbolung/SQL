CREATE TABLE board(
    num number(5) PRIMARY KEY,
    pass varchar2(30),
    name varchar2(30),
    email varchar2(30),
    title varchar2(50),
    content varchar2(1000),
    readcount number(4) default 0,  -- ��ȸ��
    writedate DATE default sysdate  -- �ۼ���
);

-- ������ ����
create SEQUENCE board_seq start with 1 INCREMENT by 1;

insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '������', 'pink@name.com', '1234', 'ù�湮', '�ݰ����ϴ�');
insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '������', 'spring@name.com', '1234', '���־��', '�ݰ����ϴ�');
insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '������', 'react@name.com', '1234', '�Ͻ�', '�ݰ����ϴ�');
insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '����', 'java@name.com', '1234', '�ﱹ��', '�ݰ����ϴ�');
insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '����', 'javascript@name.com', '1234', '���丶', '�ݰ����ϴ�');

commit;

select *
from board
order by num desc;

-- Test
select * from board where num = 6;
commit;

