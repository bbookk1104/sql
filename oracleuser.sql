create table memo(
    no          number primary key,
    name        varchar2(20),
    msg         varchar2(100),
    writeday    date
);
drop table memo;

select * from memo;

insert into memo values(101,'한석규','환영합니다','20/06/08');
insert into memo values(102,'유관순','건강하세요','20/06/08');
insert into memo values(103,'이순신','감사합니다','20/06/08');