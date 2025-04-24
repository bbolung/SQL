-- 2.
-- ȸ��(member) ���̺�
create table member(
    id varchar2(12) primary key,
    password varchar2(12) not null,
    name varchar2(20) not null,
    address varchar(100),
    tel varchar2(20) not null,
    reg_date date default sysdate
);

-- ����(book) ���̺�
create table book(
    bookid number(10) primary key,
    bookkind varchar2(2) not null,
    booktitle varchar2(50) not null,
    bookprice number(10) not null,
    bookcount number(5) not null,
    author varchar2(40),
    pubcom varchar2(40),
    pubdate date
);

-- 3.
-- (1) ���� ���̺� �����͸� �Է��� ��� �����ڵ忡 �ش��ϴ� ������(bseq)�� ������ ����� �ڵ� ������ ����ǰ� �� ��. 
    create SEQUENCE bseq start with 1 INCREMENT by 1;
    
    insert into book values(bseq.nextval, 'IT', '�̰��� �ڹٴ�', 30000, 10, '�ſ��', '�Ѻ��̵��', '2021-08-20');
    insert into book values(bseq.nextval, 'IT', '�ڹ������߿�ũ��', 31500, 19, '���۰����ڵ���', '�������Ͻ�', '2022-08-04');
    insert into book values(bseq.nextval, 'NV', '�Ͼ��', 14400, 15, '����', '���е���', '2022-08-03');
    insert into book values(bseq.nextval, 'NV', '������������', 12600, 10, '��ȣ��', '����������', '2022-08-10');
    insert into book values(bseq.nextval, 'DV', '������', 15750, 8, '��û', '��������', '2022-05-30');
    insert into book values(bseq.nextval, 'DV', '�ڼҼ����̺�', 18000, 15, '����', '���˵�', '2022-08-25');
    insert into book values(bseq.nextval, 'HC', '���Ź����ѱ���', 17500, 10, 'tvn', '����Ʈ������', '2022-08-22');
    insert into book values(bseq.nextval, 'HC', '�����ϱ�', 14000, 30, '�̼���', '��Ÿ�Ͻ�', '2022-07-27');
    insert into book values(bseq.nextval, 'TC', '��¥���½ǹ�����', 20000, 10, '������', '������', '2022-02-15');
    insert into book values(bseq.nextval, 'TC', '�������ΰ�����', 25000, 15, '���ؼ�', '�Ѻ��̵��', '2020-12-21');
    
    commit;
    
    select * from book;
    
-- (2) ȸ�� ���̺��� �⺻���� 0�� ���� �����͸� ������ ����Ʈ(pt) �÷��� �߰��� �� ���ڵ带 �߰��� ��.
    alter table member add pt number default 0;
    
    insert into member(id, password, name, address, tel, reg_date)
        values('ykh', 'a1234', '������', '������ 13', '010-1111-2222', '2022-09-13');
    insert into member(id, password, name, address, tel, reg_date)
        values('lhy', 'a3421', '���Ͽ�', '������ 888', '031-2222-3333', '2022-09-13');
    insert into member(id, password, name, address, tel, reg_date)
        values('lhn', 'b1111', '���س�', '�鼮�� 777', '010-3333-4444', '2022-09-14');
    insert into member(id, password, name, address, tel, reg_date)
        values('jbj', 'c456', '������', '���絿 178', '010-4444-5555', '2022-09-15');
    insert into member(id, password, name, address, tel, reg_date)
        values('jjs', 'z675', '������', '���ﵿ 75', '031-4444-2222', '2022-09-11');
    insert into member(id, password, name, address, tel, reg_date)
        values('cmj', 'q789', '������', 'â���� 1004', '010-5555-6666', '2022-09-15');
    insert into member(id, password, name, address, tel, reg_date)
        values('hsy', 'g478', '�ѽÿ�', 'â�ŵ� 128', '010-6666-7777', '2022-09-13');
    insert into member(id, password, name, address, tel, reg_date)
        values('hth', 'd666', '������', '��ŵ� 67', '010-7777-8888', '2022-09-14');
    insert into member(id, password, name, address, tel, reg_date)
        values('kyi', 'e964', '������', 'ȭ���� 912', '031-5555-2222', '2022-09-05');
    insert into member(id, password, name, address, tel, reg_date)
        values('nsy', 'h369', '������', '�ﵵ�� 37', '010-8888-9999', '2022-09-16');
    
    commit;
    
    select * from member; 
    
-- (3) ȸ�� ���̺� �Ʒ� ���ڵ带 ��� �߰��� �� ����Ʈ�� ���� ����Ʈ���� 100�� �� ������ �� �ֵ��� �����͸� ������ ��.
    update member set pt = pt+100;
    commit;
    
    select * from member;
    
-- (4) ȸ������ ���ѽÿ����� ȸ���� �����͸� ������ ��.
    delete from member where name = '�ѽÿ�';

    commit;
    
    select * from member;
    
-- (5) ȸ�� ���̺��� ����Ʈ(pt) �÷��� �̸��� ȸ������Ʈ(mempoint)�� ������ ��.
    alter table member rename column pt to mempoint;
    
    select * from member;

-- 4.
-- (1) ����(book) ���̺��� �ܰ�(bookprice)�� 19000�̻� 30000������ 
-- �������� ������(booktitle), ��������(bookprice), ����(author) �� ��ȸ�Ͻÿ�.
    select booktitle, bookprice, author
    from book;
    
    select booktitle, bookprice, author
    from book
    where bookprice between 19000 and 30000;

-- (2) ����(book) ���̺��� ���ǻ�(pubcom)�� �Ѻ��̵�� �̰ų� �������Ͻ��� Ʃ���� 
-- ������(booktitle), ����(author), ����(bookcount)�� ��ȸ�Ͻÿ�.
    select booktitle, author, bookcount
    from book;
    
    select booktitle, author, bookcount
    from book
    where pubcom in ('�Ѻ��̵��','�������Ͻ�');

-- (3) �Ʒ��� ���� �Ǹ�(sales) ���̺��� �����Ͻÿ�.
    create table sales(
        sno number primary key,
        bno number not null,
        id varchar2(12) not null,
        amount number(5) default 1 not null,
        money number,
        salesday date default sysdate,
        constraint bookid_fk foreign key(bno) references book(bookid)
    );
    
    create sequence sseq;
    
    commit;
    
    select * from sales;

-- 5.
-- (1) ����(book) ���̺��� ������ ����(bookcount)�� 10�� �̸��� Ʃ�ÿ� ���Ͽ� 
-- �����з�(bookkind), ������(booktitle), ���ǻ�(pubcom) �� �˻��ϵ� 
-- �� ����� ����(author)�� ������������ �����Ͽ� ǥ�õǵ��� �Ͻÿ�.
    select bookkind, booktitle, pubcom
    from book;
    
    select bookkind, booktitle, pubcom
    from book
    where bookcount < 10
    order by author;

-- (2) ȸ��(member) ���̺��� �����Ϻ� �ο����� ���Ͽ� ����ϵ�, ������ ������������ ��µǵ��� �Ͻÿ�.
    select reg_date, count(*)
    from member
    group by reg_date
    order by reg_date;

-- (3) �Ʒ��� ���� �Ǹ�(sales) ���̺� �����͸� �Է��� ��.
-- ���űݾ� : �������̺��� �ش� ������ ���� ���ݰ������� ���� �ݾ����� �Ѵ�.
-- �������� ���� ��¥�� �Ѵ�.
    insert into sales values(sseq.nextval, 1, 'lhy', 1, (select bookprice from book where bookid=1) * 1, sysdate);
    insert into sales values(sseq.nextval, 2, 'ykh', 1, (select bookprice from book where bookid=2) * 1, sysdate);
    insert into sales values(sseq.nextval, 1, 'jjs', 2, (select bookprice from book where bookid=1) * 2, sysdate);
    insert into sales values(sseq.nextval, 9, 'lhy', 1, (select bookprice from book where bookid=9) * 1, sysdate);
    insert into sales values(sseq.nextval, 2, 'cmj', 5, (select bookprice from book where bookid=2) * 5, sysdate);
    insert into sales values(sseq.nextval, 2, 'jjs', 3, (select bookprice from book where bookid=2) * 3, sysdate);
    insert into sales values(sseq.nextval, 3, 'yjh', 2, (select bookprice from book where bookid=3) * 2, sysdate);
    insert into sales values(sseq.nextval, 5, 'hsy', 4, (select bookprice from book where bookid=5) * 4, sysdate);
    insert into sales values(sseq.nextval, 4, 'nsy', 8, (select bookprice from book where bookid=4) * 8, sysdate);
    insert into sales values(sseq.nextval, 1, 'jbj', 3, (select bookprice from book where bookid=1) * 3, sysdate);
    insert into sales values(sseq.nextval, 2, 'kyj', 4, (select bookprice from book where bookid=2) * 4, sysdate);
    insert into sales values(sseq.nextval, 7, 'lhn', 1, (select bookprice from book where bookid=7) * 1, sysdate);
    insert into sales values(sseq.nextval, 8, 'hth', 2, (select bookprice from book where bookid=8) * 2, sysdate);
    insert into sales values(sseq.nextval, 10, 'cmj', 5, (select bookprice from book where bookid=10) * 5, sysdate);
    insert into sales values(sseq.nextval, 1, 'lhy', 3, (select bookprice from book where bookid=1) * 3, sysdate);
    insert into sales values(sseq.nextval, 2, 'cmj', 2, (select bookprice from book where bookid=2) * 2, sysdate);
    insert into sales values(sseq.nextval, 2, 'lhy', 1, (select bookprice from book where bookid=2) * 1, sysdate);
    insert into sales values(sseq.nextval, 1, 'ykh', 3, (select bookprice from book where bookid=1) * 3, sysdate);

    select sno �Ǹ��ڵ�, bno �����ڵ�, id ������, amount ���ż���, money ���űݾ�, salesday ������ from sales;