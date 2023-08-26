use sqlque;

create table employee (
    employee_id int auto_increment primary key,
    team_id int
);

insert into employee (team_id) values
    (8),
    (8),
    (8),
    (7),
    (9),
    (9);

select * from employee;

-- 21
select
    employee.employee_id,
    (select count(*) from employee as e where e.team_id = employee.team_id) as team_size
from employee;




