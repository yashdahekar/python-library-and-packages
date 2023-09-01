use sqlque;

create table countries (
    country_id int primary key,
    country_name varchar(255)
);

insert into countries (country_id, country_name)
values
    (2, 'USA'),
    (3, 'Australia'),
    (7, 'Peru'),
    (5, 'China'),
    (8, 'Morocco'),
    (9, 'Spain');

create table weather (
    country_id int,
    weather_state int,
    day date,
    primary key (country_id, day)
);

insert into weather (country_id, weather_state, day)
values
    (2, 15, '2019-11-01'),
    (2, 12, '2019-10-28'),
    (2, 12, '2019-10-27'),
    (3, -2, '2019-11-10'),
    (3, 0, '2019-11-11'),
    (3, 3, '2019-11-12'),
    (5, 16, '2019-11-07'),
    (5, 18, '2019-11-09'),
    (5, 21, '2019-11-23'),
    (7, 25, '2019-11-28'),
    (7, 22, '2019-12-01'),
    (7, 20, '2019-12-02'),
    (8, 25, '2019-11-05'),
    (8, 27, '2019-11-15'),
    (8, 31, '2019-11-25'),
    (9, 7, '2019-10-23'),
    (9, 3, '2019-12-23');

-- 22

select
    countries.country_name,
    case
        when avg(weather.weather_state) <= 15 then 'cold'
        when avg(weather.weather_state) >= 25 then 'hot'
        else 'warm'
    end as weather_type
from countries
left join weather on countries.country_id = weather.country_id
where weather.day between '2019-11-01' and '2019-11-30'
group by countries.country_name;
