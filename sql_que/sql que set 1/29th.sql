drop database if exists sqlque_;

create database sqlque_;

use sqlque_;

create table content (
    content_id varchar(50) primary key,
    title varchar(50),
    kids_content enum('Y', 'N'),
    content_type varchar(50)
);

insert into content values
    ('1', 'leetcode movie', 'n', 'movies'),
    ('2', 'alg. for kids', 'y', 'series'),
    ('3', 'database sols', 'n', 'series'),
    ('4', 'aladdin', 'y', 'movies'),
    ('5', 'cinderella', 'y', 'movies');

create table tvprogram (
    program_date date,
    content_id int,
    channel varchar(50),
    primary key (program_date, content_id)
);

insert into tvprogram values
    ('2020-06-10', 1, 'lc-channel'),
    ('2020-05-11', 2, 'lc-channel'),
    ('2020-05-12', 3, 'lc-channel'),
    ('2020-05-13', 4, 'disney ch'),
    ('2020-06-18', 4, 'disney ch'),
    ('2020-07-15', 5, 'disney ch');

-- 29

select distinct c.title
from content c
join tvprogram p on c.content_id = p.content_id
where c.kids_content = 'y'
    and p.program_date between '2020-06-01' and '2020-06-30'
    and c.content_type = 'movies';
