-- Cuales son los emails de los empleados que han generado menos que la media del 2005

-- Media del total de los payments
select avg(amount)
from payments
where year(paymentDate) = 2005
;

-- agrupo por employeeNumber y obtengo la suma de cada uno de sus amount para poder luego comparar con la media
select e.employeeNumber, e.firstName,e.lastName, e.email, sum(p.amount)
from employees e
join customers c on e.employeeNumber = c.salesRepEmployeeNumber
join payments p on c.customerNumber = p.customerNumber
group by e.firstName, e.lastName, e.employeeNumber
;

-- no hay menores que la media pero si mayores.
select tablaEmails.* from (select avg(amount) media
from payments
where year(paymentDate) = 2005
)tablaMedia, 
(select e.email, sum(p.amount) sumaTotalVentas
from employees e
join customers c on e.employeeNumber = c.salesRepEmployeeNumber
join payments p on c.customerNumber = p.customerNumber
group by e.firstName, e.lastName, e.employeeNumber) tablaEmails
where tablaEmails.sumaTotalVentas < tablaMedia.media
;
