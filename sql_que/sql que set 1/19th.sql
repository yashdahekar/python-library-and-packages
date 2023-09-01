use sqlque;

create table Delivery(
    delivery_id int primary key auto_increment,
    customer_id int,
    order_date date,
    customer_pref_delivery_date date
);

insert into Delivery(customer_id, order_date, customer_pref_delivery_date) values
(1 ,'2019-08-01','2019-08-02'),
(5 ,'2019-08-02','2019-08-02'),
(1 ,'2019-08-11','2019-08-11'),
(3 ,'2019-08-24','2019-08-26'),
(4 ,'2019-08-21','2019-08-22'),
(2 ,'2019-08-11','2019-08-13');

select * from delivery;

--19
select (select count(delivery_id) from delivery 
where order_date = customer_pref_delivery_date) * 100.0 /
(select count(delivery_id) from delivery) AS immediate_order_percentage;

