SELECT * FROM classicmodels.employees;

select firstName,  count(reportsTo)
from employees
where employeeNumber = 1056;

/*Recordatorio de usar alias siempre!*/
select a.firstName, a.lastName, count(a.reportsTo) aCargoDe
from employees a
join employees b on a.employeeNumber = b.reportsTo
group by a.employeeNumber ,a.firstName, a.lastName
order by aCargoDe desc
;
