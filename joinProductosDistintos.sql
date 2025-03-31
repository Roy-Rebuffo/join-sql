SELECT * FROM classicmodels.orderdetails;

-- de orderDetails voy a orders con orderNumber. de orders voy a customers con customerNumber. de customers voy a employees con salesRepNumber.
-- cuento el productCoder y selecciono nombre y apellido

-- cuantos productos distintos ha vendido cada empleado

select distinct count(oD.productCode) productosDistintos, e.firstName, e.lastName
from orderdetails oD
join orders o
on oD.orderNumber = o.orderNumber
join customers c
on o.customerNumber = c.customerNumber
join employees e
on c.salesRepEmployeeNumber = e.employeeNumber
group by e.firstName, e.lastName
order by productosDistintos desc
;

-- con venta totalVendidos
select distinct count(oD.productCode) productosDistintos, e.employeeNumber, e.firstName, e.lastName, sum(oD.quantityOrdered) totalVendidosProd
from orderdetails oD
join orders o
on oD.orderNumber = o.orderNumber
join customers c
on o.customerNumber = c.customerNumber
join employees e
on c.salesRepEmployeeNumber = e.employeeNumber
group by e.employeeNumber
order by productosDistintos desc
;
