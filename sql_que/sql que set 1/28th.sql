drop database if exists sqlque_;

create database sqlque_;

use sqlque_;

create table customers(
    customer_id int primary key,
    name varchar(50),
    country varchar(50)
);
create table products(
    product_id int primary key,
    `description` varchar(50),
    price int
);
create table orders(
    order_id int primary key,
    customer_id int, 
    product_id int ,
    order_date date,
    quantity int,
    foreign key (customer_id) references customers(customer_id), 
    foreign key (product_id) references products(product_id) 
);


insert into customers values
    (1, 'Winston', 'USA'),
    (2, 'Jonathan', 'Peru'),
    (3, 'Moustafa', 'Egypt');

insert into products values
    (10, 'LC Phone', 300),
    (20, 'LC T-Shirt', 10),
    (30, 'LC Book', 45),
    (40, 'LC Keychain', 2);

insert into orders values
    (1, 1, 10, '2020-06-10', 1),
    (2, 1, 20, '2020-07-01', 1),
    (3, 1, 30, '2020-07-08', 2),
    (4, 2, 10, '2020-06-15', 2),
    (5, 2, 40, '2020-07-01', 10),
    (6, 3, 20, '2020-06-24', 2),
    (7, 3, 30, '2020-06-25', 2),
    (9, 3, 30, '2020-05-08', 1);

select * from orders;
select * from products;
select * from customers;


-- 28 

select c.customer_id, c.name
from customers c
where c.customer_id in (
    select o.customer_id
    from orders o
    where (month(o.order_date) = 6 and year(o.order_date) = 2020)
    group by o.customer_id
    having sum(o.quantity * (select price from products p where p.product_id = o.product_id)) >= 100
) and c.customer_id in (
    select o.customer_id
    from orders o
    where (month(o.order_date) = 7 and year(o.order_date) = 2020)
    group by o.customer_id
    having sum(o.quantity * (select price from products p where p.product_id = o.product_id)) >= 100
);


