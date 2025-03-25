SELECT * FROM classicmodels.products;

-- Obtén el nombre del producto que más unidades ha vendido en total. (Usa SUM(), JOIN entre products y orderdetails, y MAX()).

select distinct p.productName, sum(oD.quantityOrdered) totalOrdenados
from products p
join orderdetails oD
on p.productCode = oD.productCode
group by p.productName
order by totalOrdenados desc
;
