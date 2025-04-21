create table member(
    name varchar2(30) NOT null,
    userid varchar2(30) ,
    pwd varchar2(20) NOT null,
    email varchar2(30),
    phone char(13),  -- 010-3380-6423
    admin number(1) default 0, -- 사용자: 0, 관리자:1
    primary key(userid)
);

insert into member values('이소미', 'somi', '1234', 'gmd@naver.com','010-2362-5157', 0);
insert into member values('하상오', 'sang12', '1234', 'ha12@naver.com','010-5926-8888', 1);
insert into member values('김윤승', 'light', '1234', 'youn1004@naver.com','010-9999-8282', 0);

commit;

SELECT *
FROM MEMBER;

-- web-study-9_1 연습문제
create table employees(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(24),
    lev char(1) default 'A',        -- A: 운영자, B: 일반 회원
    enter date default sysdate,     -- 등록일
    gender char(1) default '1',     -- 1: 남자, 2: 여자
    phone varchar2(30)
    
);

insert into employees(id, pass, name, lev, gender, phone) values('pinksung', '3333', '성윤정', 'A', '2', '010-2222-2222');
insert into employees(id, pass, name, lev, gender, phone) values('subin', '1234', '전원지', 'B', '1', '010-9999-9999');
insert into employees(id, pass, name, lev, gender, phone) values('admin', '1111', '성윤정', 'A', '1', '010-1111-1111');

commit;

select *
from employees;

-- sysdate에 시간까지 표시
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

insert into product values(product_seq.nextval, '개념을 콕콕 잡아주는 데이터베이스', 27000, 'db.jpg', '데이터베이스에 관한 모든 것을 쉽고 재미있게 정리한 교재...');
insert into product values(product_seq.nextval, '웹표준을 위한 HTML5', 25000, 'html5.jpg', 'HTML5 가이드북. 홈페이지 제작을 위한 필수 선택 HTML 기본 문법...');
insert into product values(product_seq.nextval, 'Dynamic Programming book 시리즈-01 오라클 11g + PL/SQL', 25000, 'oracle.jpg','Dynamic 실무 코칭 프로그래밍 Book의 첫번째 책으로, 오라클 11g의 새로운 ...');
insert into product values(product_seq.nextval, 'Visual C++ MFC 윈도우 프로그래밍', 26000, 'mfc.jpg', 'Visual C++를 처음 시작하는 독자의 눈높이에 맞춘 Visual C++...');
insert into product values(product_seq.nextval, 'jQuery and jQuery Mobile : 이해하기 쉽게 풀어쓴', 25000, 'jquery.jpg', '소스 하나로 데스크탑과 모바일까지 HTML5와 함께 사용한다. 초보자들도 ...');

commit;

select *
from product;

-- 코드 사용 전 DB 조회되는지 확인용
select * from product order by code desc;