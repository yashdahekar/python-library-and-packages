drop database if exists sqlque_;

create database sqlque_;

use sqlque_;

create table books (
    book_id int primary key,
    name varchar(255),
    available_from date
);

insert into books values
    (1, 'Kalila And Demna', '2010-01-01'),
    (2, '28 letters', '2012-05-12'),
    (3, 'The Hobbit', '2019-06-10'),
    (4, '13 Reasons Why', '2019-06-01'),
    (5, 'The Hunger Games', '2008-09-21');

create table orders (
    order_id int primary key,
    book_id int,
    quantity int,
    dispatch_date date
);

-- 48 

select distinct b.name
from books b
left join orders o on b.book_id = o.book_id
where 
    (o.dispatch_date between date_sub('2019-06-23', interval 1 year) and '2019-06-23')
    or o.dispatch_date is null
group by b.name, b.available_from
having sum(ifnull(o.quantity, 0)) < 10
    and datediff('2019-06-23', b.available_from) >= 30;
