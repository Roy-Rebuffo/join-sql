SELECT * FROM payments;
-- Encuentra el nombre del cliente que ha realizado el pago más alto y muestra el monto de ese pago. (Usa JOIN entre customers y payments junto con MAX()).

select max(p.amount)
from payments p
;
-- 120166.58
select max(p.amount), c.contactFirstName
from payments p
join customers c
on p.customerNumber = c.customerNumber
group by p.amount, c.contactFirstName
order by p.amount desc
limit 0,1
;

-- Lista el nombre de cada cliente junto con el total de pagos que ha realizado. (Usa SUM() y JOIN entre customers y payments).

select distinct c.contactFirstName, sum(p.amount) totalPagos
from payments p 
join customers c
on p.customerNumber = c.customerNumber
group by c.contactFirstName
;


-- Calcula el total de ingresos por año basado en los pagos de los clientes. (Usa YEAR(), SUM(), JOIN entre customers y payments, y GROUP BY).
SELECT * FROM payments;

SELECT distinct sum(p.amount), year(p.paymentDate) año
FROM payments p
join customers c
on p.customerNumber = c.customerNumber
group by año
order by año
;



