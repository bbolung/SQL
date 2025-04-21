create table member(
    name varchar2(30) NOT null,
    userid varchar2(30) ,
    pwd varchar2(20) NOT null,
    email varchar2(30),
    phone char(13),  -- 010-3380-6423
    admin number(1) default 0, -- �����: 0, ������:1
    primary key(userid)
);

insert into member values('�̼ҹ�', 'somi', '1234', 'gmd@naver.com','010-2362-5157', 0);
insert into member values('�ϻ��', 'sang12', '1234', 'ha12@naver.com','010-5926-8888', 1);
insert into member values('������', 'light', '1234', 'youn1004@naver.com','010-9999-8282', 0);

commit;

SELECT *
FROM MEMBER;

-- web-study-9_1 ��������
create table employees(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(24),
    lev char(1) default 'A',        -- A: ���, B: �Ϲ� ȸ��
    enter date default sysdate,     -- �����
    gender char(1) default '1',     -- 1: ����, 2: ����
    phone varchar2(30)
    
);

insert into employees(id, pass, name, lev, gender, phone) values('pinksung', '3333', '������', 'A', '2', '010-2222-2222');
insert into employees(id, pass, name, lev, gender, phone) values('subin', '1234', '������', 'B', '1', '010-9999-9999');
insert into employees(id, pass, name, lev, gender, phone) values('admin', '1111', '������', 'A', '1', '010-1111-1111');

commit;

select *
from employees;

-- sysdate�� �ð����� ǥ��
select id, pass, name, to_char(ENTER, 'YYYY-MM-DD HH:MM:SS') lev, gender, phone
from employees;


-- web-study-10
create table product(
	code number(5) primary key,
	name varchar2(100),
	price number(8),
	pictureurl varchar2(50),
	description varchar2(1000)
);

create sequence product_seq start with 1 increment by 1;

insert into product values(product_seq.nextval, '������ ���� ����ִ� �����ͺ��̽�', 27000, 'db.jpg', '�����ͺ��̽��� ���� ��� ���� ���� ����ְ� ������ ����...');
insert into product values(product_seq.nextval, '��ǥ���� ���� HTML5', 25000, 'html5.jpg', 'HTML5 ���̵��. Ȩ������ ������ ���� �ʼ� ���� HTML �⺻ ����...');
insert into product values(product_seq.nextval, 'Dynamic Programming book �ø���-01 ����Ŭ 11g + PL/SQL', 25000, 'oracle.jpg','Dynamic �ǹ� ��Ī ���α׷��� Book�� ù��° å����, ����Ŭ 11g�� ���ο� ...');
insert into product values(product_seq.nextval, 'Visual C++ MFC ������ ���α׷���', 26000, 'mfc.jpg', 'Visual C++�� ó�� �����ϴ� ������ �����̿� ���� Visual C++...');
insert into product values(product_seq.nextval, 'jQuery and jQuery Mobile : �����ϱ� ���� Ǯ�', 25000, 'jquery.jpg', '�ҽ� �ϳ��� ����ũž�� ����ϱ��� HTML5�� �Բ� ����Ѵ�. �ʺ��ڵ鵵 ...');

commit;

select *
from product;

-- �ڵ� ��� �� DB ��ȸ�Ǵ��� Ȯ�ο�
select * from product order by code desc;