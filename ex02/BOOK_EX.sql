-- 혹시 기본에 tbl_board와 seq_board 존재할 수 있으니까 삭제 후 새로 생성
drop table tbl_board;
drop SEQUENCE seq_board;

create SEQUENCE seq_board;

create table tbl_board(
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,       -- 작성일
    updatedate date default sysdate    -- 수정일
);

-- 테이블 구조 바꾸기(기본키 설정) : 기본키 이름 pk_board로 지정
alter table tbl_board add CONSTRAINT pk_board
primary key(bno);

-- table의 기본키 조회
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'TBL_BOARD'
AND constraint_type = 'P';

-- 랜덤하게 지정한 기본키 이름 : SYS_C007020
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'BOARD'
AND constraint_type = 'P';

-- tbl_board 정렬하여 변수들 보여줌
desc tbl_board;

-- 더미 데이터 추가
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '테스트 제목1', '테스트 내용', 'user00');
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '테스트 제목2', '테스트 내용', 'user00');
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '테스트 제목3', '테스트 내용', 'user00');
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '테스트 제목4', '테스트 내용', 'user00');
insert into tbl_board(bno, title, content, writer)
values(SEQ_BOARD.nextval, '테스트 제목5', '테스트 내용', 'user00');

commit;

select *
from tbl_board;
