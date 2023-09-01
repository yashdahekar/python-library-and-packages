drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table prices (
    product_id int,
    start_date date,
    end_date date,
    price int,
    primary key (product_id, start_date, end_date)
);

insert into prices values
    (1, '2019-02-17', '2019-02-28', 5),
    (1, '2019-03-01', '2019-03-22', 20),
    (2, '2019-02-01', '2019-02-20', 15),
    (2, '2019-02-21', '2019-03-31', 30);

create table units_sold (
    product_id int,
    purchase_date date,
    units int
);

insert into units_sold values
    (1, '2019-02-25', 100),
    (1, '2019-03-01', 15),
    (2, '2019-02-10', 200),
    (2, '2019-03-22', 30);

-- 40

select
    u.product_id,
    round(sum(u.units * p.price) / sum(u.units), 2) as average_price
from units_sold u
join prices p on u.product_id = p.product_id and u.purchase_date >= p.start_date and u.purchase_date <= p.end_date
group by u.product_id;
