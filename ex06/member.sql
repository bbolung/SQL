-- ȸ�� ����
create table tbl_member(
    userid varchar2(50) not null PRIMARY key,
    userpw varchar2(100) not null,
    username varchar2(100) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    enabled char(1) default '1'     -- Ż�� ����
);

-- ȸ�� ���� ����
create table tbl_member_auth(
    userid varchar2(50) not null,
    auth varchar2(50) not null,
    CONSTRAINT fk_member_auth FOREIGN key(userid) REFERENCES tbl_member(userid)
);

-- JUnitTest �� ��ȸ
select * from tbl_member;
select * from tbl_member_auth;