-- 정렬
select * 
from tbl_board
order by title desc;

select * 
from tbl_board
order by bno desc;

-- 재귀복사를 통해서 데이터 개수를 늘림(서브 쿼리 이용)
select title
from tbl_board
where bno = 13;

select content
from tbl_board
where title = '수정 글 제목';

-- 서브쿼리로 코드 작성
select content
from tbl_board
where title = (
                select title
                from tbl_board
                where bno = 13
                );

-- 서브쿼리 : from에서 지정한 테이블 = 가상 테이블
select bno
from (
        select bno, title, content
        from tbl_board
        where bno > 10
      );

insert into tbl_board(bno, title, content, writer)
(
    select seq_board.nextval, title, content, writer from tbl_board
);

select seq_board.nextval, title, content, writer from tbl_board;

select * from tbl_board;
commit;

select *
from tbl_board
order by content desc;

select *
from tbl_board
order by bno desc;

-- 인덱스 생성(title)
select *
from tbl_board
order by title desc;

select *
/* + index_desc(tbl_board idx_tbl_board_title) */
from tbl_board;

create index idx_tbl_board_title
on tbl_board(title);

-- 전체 데이터 정렬하여 조회
select
/*+ index_asc(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board;

-- rn 1~10까지의 데이터만 조회(1페이지)
select
/*+ index_asc(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board
where rownum <=10;

-- 고정된 값이 아닌 rownum -> 데이터 조회X
select
/*+ index_asc(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board
where rownum > 11 and rownum <=20;

-- 페이징 처리(서브 쿼리 이용) : 1페이지
select
    bno, title, content
from
(
    select
        /*+ index_asc(tbl_board pk_board) */
        rownum rn, bno, title, content
    from tbl_board
    where rownum <= 10
)
where rn > 0;

-- 페이징 처리 : 2페이지
select
    bno, title, content
from
(
    select
        /*+ index_asc(tbl_board pk_board) */
        rownum rn, bno, title, content
    from tbl_board
    where rownum <= 20
)
where rn > 10;

-- rownum과 rn의 범위 계속 변동되도록 설정(page, count 전달)
select
    bno, title, content
from
(
    select
        /*+ index_asc(tbl_board pk_board) */
        rownum rn, bno, title, content
    from tbl_board
    where rownum <= (page)*count
)
where rn > (page-1) * count;

-- 전체 목록 기본키 기준 내림차순 조회
select
/*+ index_desc(tbl_board pk_board) */
*
from tbl_board;

-- 페이지 개수 조회
select count(bno)
from tbl_board;