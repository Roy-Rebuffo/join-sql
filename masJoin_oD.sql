SELECT * FROM classicmodels.orderdetails;

-- Obtén el número de pedido, el código del producto y el nombre del producto para cada detalle de pedido.

select a.orderNumber, b.productCode, b.productName
from orderdetails a
join products b
;

-- Encuentra el número de pedido que tiene el mayor total en ventas (precio por cantidad de productos en el pedido). (Usa SUM(), JOIN entre orderdetails y orders, y MAX()).

select oD.orderNumber, sum(oD.quantityOrdered) totalOrdenes
from orderdetails oD
join orders o
on oD.orderNumber = o.orderNumber
group by oD.orderNumber
order by totalOrdenes desc
limit 0,1
;



