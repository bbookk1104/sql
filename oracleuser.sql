create table memo(
    no          number primary key,
    name        varchar2(20),
    msg         varchar2(100),
    writeday    date
);
drop table memo;

select * from memo;

insert into memo values(101,'�Ѽ���','ȯ���մϴ�','20/06/08');
insert into memo values(102,'������','�ǰ��ϼ���','20/06/08');
insert into memo values(103,'�̼���','�����մϴ�','20/06/08');