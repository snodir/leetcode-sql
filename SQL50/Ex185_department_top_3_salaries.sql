/* Write your T-SQL query statement below */
;with A as (
    select *, dense_rank() over(partition by departmentId order by salary desc) as highest_salaries
    from Employee
)
select D.name as Department, A.name as Employee, A.salary as Salary
from Department as D
left join A on D.id = A.departmentId 
where A.highest_salaries <= 3;
