
drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table products (
    product_id int primary key,
    product_name varchar(255),
    product_category varchar(255)
);

insert into products (product_id, product_name, product_category)
values
    (1, 'Leetcode Solutions Book', 'Book'),
    (2, 'Jewels of Stringology Book', 'Book'),
    (3, 'HP Laptop', 'Electronics'),
    (4, 'Lenovo Laptop', 'Electronics'),
    (5, 'Leetcode Kit T-shirt', 'Apparel');

create table orders (
    product_id int,
    order_date date,
    unit int
);

insert into orders (product_id, order_date, unit)
values
    (1, '2020-02-15', 150),
    (2, '2020-02-10', 80),
    (3, '2020-02-05', 120),
    (4, '2020-03-01', 200),
    (5, '2020-02-20', 90),
    (1, '2020-02-18', 110);

-- 34 

select p.product_name, sum(o.unit) as amount
from products p
inner join orders o on p.product_id = o.product_id
where o.order_date between '2020-02-01' and '2020-02-29'
group by p.product_name
having sum(o.unit) >= 100;


