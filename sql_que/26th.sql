use sqlque;

create table products (
    product_id int primary key,
    product_name varchar(255),
    product_category varchar(255)
);

create table orders (
    product_id int,
    order_date date,
    unit int
);

insert into products (product_id, product_name, product_category)
values
    (1, 'Leetcode Solutions Book', 'Book'),
    (2, 'Jewels of Stringology Book', 'Book'),
    (3, 'HP Laptop', 'Laptop'),
    (4, 'Lenovo Laptop', 'Laptop'),
    (5, 'Leetcode Kit T-shirt', 'Clothing');

insert into orders (product_id, order_date, unit)
values
    (1, '2020-02-05', 60),
    (1, '2020-02-10', 70),
    (2, '2020-01-18', 30),
    (2, '2020-02-11', 80),
    (3, '2020-02-17', 2),
    (3, '2020-02-24', 3),
    (4, '2020-03-01', 20),
    (4, '2020-03-04', 30),
    (4, '2020-03-04', 60),
    (5, '2020-02-25', 50),
    (5, '2020-02-27', 50),
    (5, '2020-03-01', 50);


select * from products;
select * from orders;

-- 26

select products.product_name, sum(unit) as amount
from products
inner join orders on products.product_id = orders.product_id
where extract(month from order_date) = 2
group by products.product_name
having sum(unit) >= 100;
