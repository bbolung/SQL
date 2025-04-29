create user book_ex identified by book_ex
default tablespace users    -- 테이블, 인덱스하면 저장되는 공간
TEMPORARY tablespace temp;  -- 임시 데이터 저장소

grant connect, dba to book_ex;

commit;