use sqlque;
create table product (
    product_id int primary key auto_increment,
    product_name varchar(30),
    unit_price int
);

create table sales (
    seller_id int,
    product_id int,
    buyer_id int,
    sale_date date,
    quantity int,
    price int,
    foreign key (product_id) references product(product_id)
);

insert into product(product_name, unit_price) values 
('S8',1000),
('G4',800),
('iPhone',1400);

insert into sales(seller_id, product_id, buyer_id, sale_date, quantity, price) values
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 2, 3, '2019-06-02', 1, 800),
(3, 3, 4, '2019-05-13', 2, 2800);

select * from product;
select * from sales;

-- 17
select product_id , product_name from product 
where product_id in (
select product_id from sales 
where sale_date between '2019-01-01' and '2019-03-31')
