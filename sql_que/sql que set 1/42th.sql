drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table Sales (
    sale_date date,
    fruit enum('apples', 'oranges'),
    sold_num int,
    primary key (sale_date, fruit)
);

insert into Sales values
('2020-05-01', 'apples', 10),
('2020-05-01', 'oranges', 8),
('2020-05-02', 'apples', 15),
('2020-05-02', 'oranges', 15),
('2020-05-03', 'apples', 20),
('2020-05-03', 'oranges', 0),
('2020-05-04', 'apples', 15),
('2020-05-04', 'oranges', 16);

-- 42 

select sale_date, 
       sum(case when fruit = 'apples' then sold_num else -sold_num end) as diff
from Sales
group by sale_date
order by sale_date;