SELECT * FROM classicmodels.orderdetails;

select distinct a.productCode, b.quantityInStock, b.productVendor, b.productDescription
from orderdetails a join products b ON a.productCode=b.productCode
where a.productCode like "%_4409";