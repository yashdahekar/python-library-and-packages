drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table Customer (
    customer_id int,
    product_key int
);

create table Product (
    product_key int primary key
);

insert into Customer (customer_id, product_key) values
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);

insert into Product (product_key) values
(5),
(6);

-- 46

select c.customer_id
from Customer c
join Product p on c.product_key = p.product_key
group by c.customer_id
having count(distinct c.product_key) = (select count(*) from Product);
