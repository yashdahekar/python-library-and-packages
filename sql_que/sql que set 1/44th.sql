drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table Employee (
    id int primary key,
    name varchar(50),
    department varchar(50),
    managerId int
);

insert into Employee values
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);

-- 44 

select distinct e1.name
from Employee e1
join (select managerId, count(*) as cnt
      from Employee
      group by managerId
      having count(*) >= 5) e2
on e1.id = e2.managerId;

