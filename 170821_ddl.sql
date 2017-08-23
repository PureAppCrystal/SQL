--create table

create table book(
	no number(10),
	title varchar2(200) not null,
	author varchar2(5) not null,
	state varchar2(12) not null,
	pub_date date, 
	
	primary key( no ),
	constraint c_book_check check( state in ('대여중','대여가능') )

);


select * from book;
-- insert

insert into book
values(1, '토지', '가', to_date('2017/02/21', 'yyyy/mm/dd'), 'aaa');

insert into book
values(seq_book.nextval, '토지', '가', to_date('2017/02/21', 'yyyy/mm/dd'), 'unKnown');

insert into book 
values(seq_book.nextval, '토지2', 'ak', '대여가능', sysdate);

--delete
delete from book
where no = 1;

--update
update book
set title = '토지2'
where no = 1;

--table 삭제 
drop table book;


--alter table
select * from book;
alter table book add(pubs varchar2(120));
alter table book modify(pubs varchar2(200));
alter table book modify(no PRIMARY KEY );
alter table book modify(author varchar2(12) not null);
alter table book rename column pubs to publising;
alter table book drop publising;
alter table book set unused( author ); 

--truncate vs drop

truncate table book; -- 데이터만 삭제

drop table book; -- 테이블과 데이터까지 삭제 

--comment
comment on table book is '책정보를 저장하는 테이블';

--rename table
rename article to book;

select * from article;

--sequence : pk 의 자동증가를 위한.....ㅉㅉㅉㅉ
create sequence seq_book
start with 1
increment by 1
maxvalue  999999999;

select seq_book.nextval from dual;







-- commit 
commit;

-- rollback;
rollback;

-- select 
select * from book;

select rowid from book;









------------------------------
--select 문으로 테이블 만들기  : not null조건만 상속됨 
create table employees_bak01 as (
	select * 
	from employees 
	where job_id = 'FI_ACCOUNT';
);










------------------------------------
select value
from nls_database_parameters
where parameter = 'NLS_TIMESTAMP_FORMAT';

select value
from nls_database_parameters
where parameter = 'NLS_CHARACTERSET';



