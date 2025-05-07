-- ����
select * 
from tbl_board
order by title desc;

select * 
from tbl_board
order by bno desc;

-- ��ͺ��縦 ���ؼ� ������ ������ �ø�(���� ���� �̿�)
select title
from tbl_board
where bno = 13;

select content
from tbl_board
where title = '���� �� ����';

-- ���������� �ڵ� �ۼ�
select content
from tbl_board
where title = (
                select title
                from tbl_board
                where bno = 13
                );

-- �������� : from���� ������ ���̺� = ���� ���̺�
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

-- �ε��� ����(title)
select *
from tbl_board
order by title desc;

select *
/* + index_desc(tbl_board idx_tbl_board_title) */
from tbl_board;

create index idx_tbl_board_title
on tbl_board(title);

-- ��ü ������ �����Ͽ� ��ȸ
select
/*+ index_asc(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board;

-- rn 1~10������ �����͸� ��ȸ(1������)
select
/*+ index_asc(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board
where rownum <=10;

-- ������ ���� �ƴ� rownum -> ������ ��ȸX
select
/*+ index_asc(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board
where rownum > 11 and rownum <=20;

-- ����¡ ó��(���� ���� �̿�) : 1������
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

-- ����¡ ó�� : 2������
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

-- rownum�� rn�� ���� ��� �����ǵ��� ����(page, count ����)
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

-- ��ü ��� �⺻Ű ���� �������� ��ȸ
select
/*+ index_desc(tbl_board pk_board) */
*
from tbl_board;

-- ������ ���� ��ȸ
select count(bno)
from tbl_board;