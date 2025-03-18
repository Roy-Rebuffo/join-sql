/*busco el productCode S10_1678 de la tabla products. luego hago el join con orderDetails donde el productCode coincida en ambas tablas
lo agrupo por productCode y productName finalmente hago la suma del total de productos pedidos de la tabla de orderDetails para 
obtener el total de pedidos*/

SELECT a.productCode, a.productName, SUM(b.quantityOrdered) totalQuantity
FROM products a  
JOIN orderdetails b ON a.productCode = b.productCode  
WHERE a.productCode = 'S10_1678'  
GROUP BY a.productCode, a.productName;
