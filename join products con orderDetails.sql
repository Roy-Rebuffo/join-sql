-- cual es la linea de producto mas comprada por clientes

select productCode, quantityOrdered
from orderdetails;

select productline
from products
group by productline;

select productline, sum(quantityOrdered)
from products a 
join orderdetails b on a.productCode=b.productCode
group by a.productline
order by a.productline;

