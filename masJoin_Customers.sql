SELECT * 
FROM classicmodels.customers;

-- Calcula el promedio de pagos realizados por los clientes agrupados por país. (Usa AVG(), JOIN entre customers y payments, y GROUP BY).

select distinct c.country, avg(p.amount)
from customers c
join payments p
on c.customerNumber = p.customerNumber
group by c.country
order by c.country desc
limit 0,5
;

-- Lista los clientes cuyo total de pagos supera los 50,000. (Usa SUM(), HAVING, y JOIN entre customers y payments).

select * from customers;

select c.contactFirstName, c.contactLastName, sum(p.amount) totalGastado
from customers c
join payments p
on c.customerNumber = p.customerNumber
group by c.contactFirstName, c.contactLastName
having totalGastado > 50000.00
order by totalGastado desc
;





