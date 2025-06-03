-- 댓글
create table tbl_reply(
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create SEQUENCE seq_reply;

-- rno 기본키 설정(이름 : pk_reply)
alter table tbl_reply
add CONSTRAINT pk_reply primary key(rno);

-- bno : 외래키 설정(이름 : fk_reply_board)
alter table tbl_reply
add CONSTRAINT fk_reply_board FOREIGN key(bno) REFERENCES tbl_board(bno) on delete cascade;

-- 내림차순으로 10개 데이터 조회
select *
from tbl_board
where rownum < 10
order by bno desc;

-- 추가한 댓글Test 확인
select *
from tbl_reply;

-- 전체 데이터 조회 sql문
select * 
from tbl_reply 
order by rno desc;

select * 
from tbl_reply 
where bno = 786442
order by rno desc;

-- Test를 위한 댓글 추가
insert into tbl_reply(rno, bno, reply, replyer)
values(seq_reply.nextval, 786442, '댓글 test 입력', '홍길동');

commit;