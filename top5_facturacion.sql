SELECT * FROM classicmodels.orderdetails;

-- top 5 empleados que generan mas ventas
-- selecciono y sumo cada uno de priceEach de los productCode
select distinct productCode, sum(priceEach)
from orderdetails
group by productCode
;
-- le hago join para unir con orders para luego unir con customers
select distinct a.productCode, sum(priceEach), b.customerNumber
from orderdetails a join orders b on a.orderNumber = b.orderNumber
group by a.productCode, b.customerNumber
;
-- hago el segundo join para unir luego con employees
select distinct a.productCode, sum(priceEach), b.customerNumber
from orderdetails a join orders b on a.orderNumber = b.orderNumber
join customers c on b.customerNumber = c.customerNumber
group by a.productCode, b.customerNumber
;
-- hago el join con employees y corrijo lo que quiero ver. lo ordeno y le pongo limit para ver el top5
select distinct  d.firstName, d.lastName, sum(a.priceEach) facturacion_total, c.salesRepEmployeeNumber
from orderdetails a join orders b on a.orderNumber = b.orderNumber
join customers c
join employees d on c.salesRepEmployeeNumber = d.employeeNumber
group by  c.salesRepEmployeeNumber
order by facturacion_total desc
limit 0,5
;