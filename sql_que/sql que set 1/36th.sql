drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table users (
    id int primary key,
    name varchar(255)
);

insert into users values
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Alex'),
    (4, 'Donald'),
    (7, 'Lee'),
    (13, 'Jonathan'),
    (19, 'Elvis');

create table rides (
    id int primary key,
    user_id int,
    distance int
);

insert into rides values
    (1, 1, 120),
    (2, 2, 317),
    (3, 3, 222),
    (4, 7, 100),
    (5, 13, 312),
    (6, 19, 50),
    (7, 7, 120),
    (8, 19, 400),
    (9, 7, 230);

-- 36 

select u.name, coalesce(sum(r.distance), 0) as travelled_distance
from users u
left join rides r on u.id = r.user_id
group by u.id, u.name
order by travelled_distance desc, u.name;
