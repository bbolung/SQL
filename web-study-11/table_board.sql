CREATE TABLE board(
    num number(5) PRIMARY KEY,
    pass varchar2(30),
    name varchar2(30),
    email varchar2(30),
    title varchar2(50),
    content varchar2(1000),
    readcount number(4) default 0,  -- 조회수
    writedate DATE default sysdate  -- 작성일
);

-- 시퀀스 생성
create SEQUENCE board_seq start with 1 INCREMENT by 1;

insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '성윤정', 'pink@name.com', '1234', '첫방문', '반갑습니다');
insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '전수빈', 'spring@name.com', '1234', '맛있어요', '반갑습니다');
insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '전원지', 'react@name.com', '1234', '일식', '반갑습니다');
insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '조조', 'java@name.com', '1234', '삼국지', '반갑습니다');
insert into board(num, name, email, pass,title, content) values(board_seq.nextval, '관우', 'javascript@name.com', '1234', '적토마', '반갑습니다');

commit;

select *
from board
order by num desc;