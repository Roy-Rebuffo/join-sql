SELECT * FROM classicmodels.employees;

--  Muestra el nombre y apellido del empleado que tiene asignados más clientes. (Usa COUNT(), JOIN entre customers y employees, y GROUP BY).

select e.firstName, e.lastName, count(c.salesRepEmployeeNumber) totalClientesAsignados
from employees e
join customers c
on e.employeeNumber = c.salesRepEmployeeNumber
group by e.firstName, e.lastName
order by totalClientesAsignados desc
;