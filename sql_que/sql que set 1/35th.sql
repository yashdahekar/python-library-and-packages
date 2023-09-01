
drop database if exists sqlque_;

create database sqlque_ ;

use sqlque_;

create table movies (
    movie_id int primary key,
    title varchar(255)
);

insert into movies (movie_id, title)
values
    (1, 'Avengers'),
    (2, 'Frozen 2'),
    (3, 'Joker');

create table users (
    user_id int primary key,
    name varchar(255)
);

insert into users (user_id, name)
values
    (1, 'Daniel'),
    (2, 'Monica'),
    (3, 'Maria'),
    (4, 'James');

create table movierating (
    movie_id int,
    user_id int,
    rating int,
    created_at date,
    primary key (movie_id, user_id)
);

insert into movierating (movie_id, user_id, rating, created_at)
values
    (1, 1, 3, '2020-01-12'),
    (1, 2, 4, '2020-02-11'),
    (1, 3, 2, '2020-02-12'),
    (1, 4, 1, '2020-01-01'),
    (2, 1, 5, '2020-02-17'),
    (2, 2, 2, '2020-02-01'),
    (2, 3, 2, '2020-03-01'),
    (3, 1, 3, '2020-02-22'),
    (3, 2, 4, '2020-02-25');

 -- 35
 
(with UserMovieCounts as (
    select u.name, count(distinct mr.movie_id) as movie_count
    from users u
    left join movierating mr on u.user_id = mr.user_id
    group by u.user_id, u.name
)
select name from UserMovieCounts
where movie_count = (select max(movie_count) from UserMovieCounts)
order by name limit 1)
union
(with MovieAvgRatings as (
    select m.title, avg(mr.rating) as avg_rating
    from movies m
    join movierating mr on m.movie_id = mr.movie_id
    where mr.created_at >= '2020-02-01' and mr.created_at <= '2020-02-29'
    group by m.movie_id, m.title
)
select title from MovieAvgRatings
where avg_rating = (select max(avg_rating) from MovieAvgRatings)
order by title limit 1);
