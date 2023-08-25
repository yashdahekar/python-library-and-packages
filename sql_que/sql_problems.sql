--################################################################################
--first problem

create database sqlproblem;
use sqlproblem;

create table aitools (
id int,
technology varchar(25)
);

insert into aitools values
(1, 'ds'),
(1, 'tablean'),
(1, 'sql'),
(2, 'r'),
(2, 'powerbi'),
(1, 'python'),
(3, 'ds'),
(3, 'python'),
(3, 'sql'),
(4, 'ds'),
(4, 'python'),
(4, 'sql'),
(5, 'ds'),
(5, 'tablean'),
(5, 'python'),
(5, 'sql');

select * from aitools;

select id from aitools
where technology in ('ds', 'python', 'sql')
group by id
having count(distinct technology) = 3;

--or

select id from aitools
where technology = 'ds'
and id in (select id from aitools where technology = 'sql')
and id in (select id from aitools where technology = 'python');


--##################################################################################################################
--# 2nd problem

create database ecom;

use ecom;

create table product_info (
id int primary key,
product_name varchar(50)
);

insert into product_info values
(1, 'laptop'),
(2, 'smartphone'),
(3, 'tablet'),
(4, 'desktop pc'),
(5, 'led tv'),
(6, 'soundbar'),
(7, 'streaming device'),
(8, 'home theater system'),
(9, 'washing machine'),
(10, 'refrigerator'),
(11, 'dishwasher'),
(12, 'oven'),
(13, 'digital camera'),
(14, 'mirrorless camera'),
(15, 'camcorder'),
(16, 'camera lens'),
(17, 'bluetooth speaker'),
(18, 'smartwatch'),
(19, 'gaming console'),
(20, 'fitness tracker');
    

select * from product_info;

create table product_info_likes (
like_id int,
product_id int,
liked_date date,
foreign key (product_id) references product_info(id)
);


insert into product_info_likes (like_id, product_id, liked_date)
values
(1, 3, '2023-08-22'), 
(2, 7, '2023-08-23'), 
(3, 15, '2023-08-24'), 
(4, 2, '2023-08-25'); 

select * from product_info_likes;

select id from product_info
left join product_info_likes on product_info.id = product_info_likes.product_id
where product_info_likes.like_id is null

--##################################################################################################################
