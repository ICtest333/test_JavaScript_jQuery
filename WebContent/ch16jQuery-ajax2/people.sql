create table people(
	id varchar2(20) primary key,
	name varchar2(20) not null,
	job varchar2(20) not null,
	address varchar2(100) not null,
	bloodtype varchar2(2) not null
);