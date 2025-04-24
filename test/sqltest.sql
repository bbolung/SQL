-- 2.
-- 회원(member) 테이블
create table member(
    id varchar2(12) primary key,
    password varchar2(12) not null,
    name varchar2(20) not null,
    address varchar(100),
    tel varchar2(20) not null,
    reg_date date default sysdate
);

-- 도서(book) 테이블
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
-- (1) 도서 테이블에 데이터를 입력할 경우 도서코드에 해당하는 시퀀스(bseq)를 별도로 만들어 자동 순번이 적용되게 할 것. 
    create SEQUENCE bseq start with 1 INCREMENT by 1;
    
    insert into book values(bseq.nextval, 'IT', '이것이 자바다', 30000, 10, '신용권', '한빛미디어', '2021-08-20');
    insert into book values(bseq.nextval, 'IT', '자바웹개발워크북', 31500, 19, '구멍가게코딩단', '남가람북스', '2022-08-04');
    insert into book values(bseq.nextval, 'NV', '하얼빈', 14400, 15, '김훈', '문학동네', '2022-08-03');
    insert into book values(bseq.nextval, 'NV', '불편한편의점', 12600, 10, '김호연', '나무옆의자', '2022-08-10');
    insert into book values(bseq.nextval, 'DV', '역행자', 15750, 8, '자청', '웅진출판', '2022-05-30');
    insert into book values(bseq.nextval, 'DV', '자소서바이블', 18000, 15, '이형', '엔알디', '2022-08-25');
    insert into book values(bseq.nextval, 'HC', '벌거벗은한국사', 17500, 10, 'tvn', '프런트페이지', '2022-08-22');
    insert into book values(bseq.nextval, 'HC', '난중일기', 14000, 30, '이순신', '스타북스', '2022-07-27');
    insert into book values(bseq.nextval, 'TC', '진짜쓰는실무엑셀', 20000, 10, '전진권', '제이펍', '2022-02-15');
    insert into book values(bseq.nextval, 'TC', '빅데이터인공지능', 25000, 15, '박해선', '한빛미디어', '2020-12-21');
    
    commit;
    
    select * from book;
    
-- (2) 회원 테이블에는 기본값이 0인 숫자 데이터를 저장할 포인트(pt) 컬럼을 추가한 후 레코드를 추가할 것.
    alter table member add pt number default 0;
    
    insert into member(id, password, name, address, tel, reg_date)
        values('ykh', 'a1234', '유광현', '도내동 13', '010-1111-2222', '2022-09-13');
    insert into member(id, password, name, address, tel, reg_date)
        values('lhy', 'a3421', '이하영', '마구동 888', '031-2222-3333', '2022-09-13');
    insert into member(id, password, name, address, tel, reg_date)
        values('lhn', 'b1111', '이해나', '백석동 777', '010-3333-4444', '2022-09-14');
    insert into member(id, password, name, address, tel, reg_date)
        values('jbj', 'c456', '정병진', '성사동 178', '010-4444-5555', '2022-09-15');
    insert into member(id, password, name, address, tel, reg_date)
        values('jjs', 'z675', '정진석', '원흥동 75', '031-4444-2222', '2022-09-11');
    insert into member(id, password, name, address, tel, reg_date)
        values('cmj', 'q789', '조민재', '창릉동 1004', '010-5555-6666', '2022-09-15');
    insert into member(id, password, name, address, tel, reg_date)
        values('hsy', 'g478', '한시연', '창신동 128', '010-6666-7777', '2022-09-13');
    insert into member(id, password, name, address, tel, reg_date)
        values('hth', 'd666', '한태헌', '행신동 67', '010-7777-8888', '2022-09-14');
    insert into member(id, password, name, address, tel, reg_date)
        values('kyi', 'e964', '고유진', '화정동 912', '031-5555-2222', '2022-09-05');
    insert into member(id, password, name, address, tel, reg_date)
        values('nsy', 'h369', '남송윤', '흥도동 37', '010-8888-9999', '2022-09-16');
    
    commit;
    
    select * from member; 
    
-- (3) 회원 테이블에 아래 레코드를 모두 추가한 후 포인트가 현재 포인트에서 100이 더 증가될 수 있도록 데이터를 갱신할 것.
    update member set pt = pt+100;
    commit;
    
    select * from member;
    
-- (4) 회원명이 ‘한시연’인 회원의 데이터를 삭제할 것.
    delete from member where name = '한시연';

    commit;
    
    select * from member;
    
-- (5) 회원 테이블의 포인트(pt) 컬럼의 이름을 회원포인트(mempoint)로 변경할 것.
    alter table member rename column pt to mempoint;
    
    select * from member;

-- 4.
-- (1) 도서(book) 테이블에서 단가(bookprice)가 19000이상 30000이하인 
-- 데이터의 도서명(booktitle), 도서가격(bookprice), 저자(author) 를 조회하시오.
    select booktitle, bookprice, author
    from book;
    
    select booktitle, bookprice, author
    from book
    where bookprice between 19000 and 30000;

-- (2) 도서(book) 테이블에서 출판사(pubcom)이 한빛미디어 이거나 남가람북스인 튜플의 
-- 도서명(booktitle), 저자(author), 수량(bookcount)를 조회하시오.
    select booktitle, author, bookcount
    from book;
    
    select booktitle, author, bookcount
    from book
    where pubcom in ('한빛미디어','남가람북스');

-- (3) 아래와 같은 판매(sales) 테이블을 생성하시오.
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
-- (1) 도서(book) 테이블에서 도서의 수량(bookcount)가 10권 미만인 튜플에 대하여 
-- 도서분류(bookkind), 도서명(booktitle), 출판사(pubcom) 을 검색하되 
-- 그 결과가 저자(author)의 오름차순으로 정렬하여 표시되도록 하시오.
    select bookkind, booktitle, pubcom
    from book;
    
    select bookkind, booktitle, pubcom
    from book
    where bookcount < 10
    order by author;

-- (2) 회원(member) 테이블에서 가입일별 인원수를 구하여 출력하되, 가입일 오름차순으로 출력되도록 하시오.
    select reg_date, count(*)
    from member
    group by reg_date
    order by reg_date;

-- (3) 아래와 같이 판매(sales) 테이블에 데이터를 입력할 것.
-- 구매금액 : 도서테이블에서 해당 도서에 대한 가격과수량을 곱한 금액으로 한다.
-- 구매일은 오늘 날짜로 한다.
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

    select sno 판매코드, bno 도서코드, id 구매자, amount 구매수량, money 구매금액, salesday 구매일 from sales;