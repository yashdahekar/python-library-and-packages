use sqlque;

create table prices (
    product_id int,
    start_date date,
    end_date date,
    price int,
    primary key (product_id, start_date, end_date)
);

insert into prices (product_id, start_date, end_date, price) values
    (1, '2019-02-17', '2019-02-28', 5),
    (1, '2019-03-01', '2019-03-22', 20),
    (2, '2019-02-01', '2019-02-20', 15),
    (2, '2019-02-21', '2019-03-31', 30);

create table unitssold (
    product_id int,
    purchase_date date,
    units int
);

insert into unitssold (product_id, purchase_date, units) values
    (1, '2019-02-25', 100),
    (1, '2019-03-01', 15),
    (2, '2019-02-10', 200),
    (2, '2019-03-22', 30);

select * from prices;
select * from unitssold;

-- 24

select prices.product_id,
round(sum(prices.price * unitssold.units) / sum(unitssold.units),2) 
as average_price from prices
join unitssold on unitssold.product_id = prices.product_id
and unitssold.purchase_date between prices.start_date and prices.end_date
group by prices.product_id;



