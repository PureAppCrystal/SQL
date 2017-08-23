


--author sequence
drop sequence seq_author;

create sequence seq_author
start with 1
increment by 1
maxvalue 999999999;
 
select seq_author.nextval from dual;


-- author table
drop table author;

create table author(
	no 		number(10) 		primary key,
	name 	varchar2(200) 	not null,
	profile nvarchar2(2000)
);


-- author data
insert into author
values(seq_author.nextval, '둘리', null);

commit;
select * from author;

--book sequence
drop sequence seq_book;

create sequence seq_book
start with 1
increment by 1
maxvalue 999999999;


-- book table
drop table book;

create table book(
	no number(10),
	title varchar2(200) not null,
	author_no number(10) not null,
	state varchar2(12) not null,
	pub_date date, 
	
	primary key( no ),
	constraint c_book_fk foreign key  (author_no)  references author(no),
	constraint c_book_check check( state in ('대여중','대여가능') )
);



insert into book
values(seq_book.nextval, '님아가지마오', 1, '대여가능', sysdate);





commit;
select * from book;
select * from author;


select * from all_users

