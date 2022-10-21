# Write your MySQL query statement below
select
  ifnull((
    select
      r.salary
    from (
        select
          salary,
          dense_rank() over (order by salary desc) as rnk
        from
          Employee e) r
    where 
      r.rnk = 2
    limit 1), null) as SecondHighestSalary
