drop table if exists employees;
create table if not exists employees (
  id int(255) primary key not null,
  name varchar(255) not null,
  salary int(255) not null,
  team_id int(255) default null
);

insert into employees (id, name, salary, team_id) values
(
  1,
  'Ali',
  70000,
  1
),
(
  2,
  'Akbar',
  90000,
  1
),
(
  3,
  'Alireza',
  80000,
  2
),
(
  4,
  'Bahram',
  60000,
  2
),
(
  5,
  'Asghar',
  90000,
  1
);

drop table if exists teams;
create table if not exists teams (
  id int(255) primary key not null,
  name varchar(255) not null
);


insert into teams (id, name) values
(
  1,
  'Shop'
),
(
  2,
  'Full'
),
(
  3,
  'Market'
);

select * from employees;
select MAX(salary) as salary from employees;

select * from employees where salary in (select salary from (select MAX(salary) as salary, team_id from employees inner join teams on
teams.id = employees.team_id group by team_id) as tmp where employees.team_id = tmp.team_id);
