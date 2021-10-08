-- Section1
select MAX(salary) as salary from employees;
-- Section2
select * from employees where salary in (select salary from (select MAX(salary) as salary, team_id from employees inner join teams on
teams.id = employees.team_id group by team_id) as tmp where employees.team_id = tmp.team_id);



