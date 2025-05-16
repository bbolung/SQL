desc tbl_board;

alter table tbl_board
add (replyCnt number default 0);

select * from tbl_board;

select count(rno) from tbl_reply;

update TBL_BOARD set replycnt = (
    select count(rno) from TBL_REPLY where TBL_REPLY.BNO = TBL_BOARD.BNO
);

select * from tbl_board
order by bno desc;