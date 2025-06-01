-- Muestra el nombre y apellido de todos los empleados.
-- select firstName, lastName from employees;

-- Muestra el nombre y el límite de crédito de todos los clientes que sean de Francia.
/*select contactFirstName, creditLimit from customers
where country = 'France'
order by creditLimit desc;*/

-- Cuenta cuántos clientes hay en cada país.
/*select distinct count(customerNumber) totalClientes, country from customers
group by country
order by totalClientes desc;*/

-- Muestra la ciudad y el código de oficina de todas las oficinas que se encuentren en Estados Unidos.
/*select city, officeCode from offices
where country = 'USA';*/

-- Encuentra el producto con el precio unitario (priceEach) más alto en la tabla orderdetails.
/*select max(priceEach) from orderdetails;*/

-- Muestra los números de pedido (orderNumber) que contengan más de 5 productos distintos.
/*select count(productCode) totalProductosVendidos, orderNumber from orderdetails
group by orderNumber
having totalProductosVendidos > 5
order by totalProductosVendidos desc;*/

-- Muestra los nombres de los clientes que no tengan asignado ningún representante de ventas (es decir, con salesRepEmployeeNumber nulo).
/*select contactFirstName, salesRepEmployeeNumber from customers
where salesRepEmployeeNumber is null;*/

-- Calcula el total de ventas (suma de cantidad * precio unitario) para cada pedido.
/*select sum(quantityOrdered * priceEach) from orderdetails;*/

-- Muestra los correos electrónicos y los cargos (jobTitle) de todos los empleados cuyo cargo contenga la palabra 'Manager'.
/*select email, jobTitle from employees
where jobTitle like '%Manager%';*/

-- Muestra los nombres y límites de crédito de los clientes cuyo límite de crédito sea mayor a 100000, ordenados de mayor a menor.
/*select contactFirstName, creditLimit from customers
where creditLimit > 10000
order by creditLimit desc;*/


-- Muestra los nombres de clientes que comiencen por "A".
/*select * from customers
where lower(contactFirstName) like 'a%';

-- Encuentra todos los empleados cuyo nombre (firstName) termine con "y".
select * from customers
where lower(contactFirstName) like '%y';

-- Muestra las ciudades de oficinas que contengan exactamente 6 letras.
select * from customers
where city like '______';

-- Encuentra los productos cuyo código (productCode) contenga la subcadena "S24".
select * from products
where productCode like 'S24_%'
;
-- Lista los clientes cuyo país contenga "land".
select * from customers
where country like '%land%'
;*/

-- Muestra los nombres y correos electrónicos de los empleados que trabajan en oficinas situadas en Estados Unidos.
/*select e.firstName, e.lastName, o.country from employees e
join offices o on e.officeCode = o.officeCode
where country = 'USA';
;*/

-- Muestra los nombres de clientes junto con el nombre y apellido de su representante de ventas.
/*SELECT DISTINCT
    c.customerName nombreCliente,
    e.firstName nombreEmpleado,
    e.lastName apellidoEmpleado
FROM
    customers c
        JOIN
    employees e ON c.salesRepEmployeeNumber = e.employeeNumber;*/
    
-- Muestra los nombres de productos y la cantidad total pedida por cada producto.
/*SELECT 
    p.productName, SUM(oD.quantityOrdered) totalVendidos
FROM
    products p
        JOIN
    orderdetails oD ON p.productCode = oD.productCode
GROUP BY p.productCode
ORDER BY totalVendidos DESC;*/

-- Muestra el número de pedido, el nombre del cliente y la fecha del pedido.
/*SELECT 
    o.orderNumber, o.orderDate, c.contactFirstName
FROM
    orders o
        JOIN
    customers c ON o.customerNumber = c.customerNumber;*/
    
-- Lista los nombres de empleados que tienen a otros empleados como subordinados (es decir, empleados que tienen a alguien reportando a ellos).
/*SELECT 
    e1.firstName, e1.lastName, COUNT(e2.reportsTo)
FROM
    employees e1
        JOIN
    employees e2 ON e1.employeeNumber = e2.reportsTo
GROUP BY e2.reportsTo
ORDER BY e2.reportsTo;*/

-- Muestra los nombres de los productos y las ciudades donde se han entregado pedidos (relación productos → pedidos → clientes → ciudad).
SELECT 
    p.productName, c.city
FROM
    products p
        JOIN
    orderdetails oD ON p.productCode = oD.productCode
        JOIN
    orders o ON oD.orderNumber = o.orderNumber
        JOIN
    customers c ON o.customerNumber = c.customerNumber
;
-- Muestra el número de pedido y el total de dinero pagado por ese pedido (usando JOIN con payments).
SELECT 
    o.orderNumber, SUM(p.amount)
FROM
    orders o
        JOIN
    payments p ON o.customerNumber = p.customerNumber
GROUP BY o.orderNumber;

-- Muestra todos los productos cuyo precio unitario medio (priceEach) es mayor de 100 (usa JOINs si es necesario para obtener información adicional de productos).
SELECT 
    oD.productCode, p.productName, AVG(oD.priceEach)
FROM
    orderdetails oD
        JOIN
    products p ON oD.productCode = p.productCode
WHERE
    oD.priceEach > 100
GROUP BY oD.productCode;
-- Muestra el nombre del cliente, nombre del producto y la cantidad pedida para cada línea de pedido.
SELECT 
    c.contactFirstName, p.productName, p.productLine
FROM
    products p
        JOIN
    orderdetails oD ON p.productCode = oD.productCode
        JOIN
    orders o ON oD.orderNumber = o.orderNumber
        JOIN
    customers c ON o.customerNumber = c.customerNumber
        JOIN
    productlines pL ON p.productLine = pL.productLine
GROUP BY c.contactFirstName, p.productName, p.productLine;
-- Muestra los nombres de las oficinas junto con los nombres de empleados y los nombres de clientes que han sido atendidos por esos empleados.
SELECT DISTINCT
    o.officeCode,
    e.firstName Empleado,
    e.lastName atiendeA,
    c.contactFirstName Cliente
FROM
    offices o
        JOIN
    employees e ON o.officeCode = e.officeCode
        JOIN
    customers c ON e.employeeNumber = c.salesRepEmployeeNumber;

--------------------------------------------------------------
SELECT 
    sub.officeCode, COUNT(*) AS totalEmpleados
FROM
    (SELECT 
        officeCode
    FROM
        employees) AS sub
GROUP BY sub.officeCode;

SELECT 
    o.officeCode, COUNT(e.employeeNumber) totalEmpleados
FROM
    offices o
        JOIN
    employees e ON o.officeCode = e.officeCode
GROUP BY o.officeCode
ORDER BY totalEmpleados DESC;
----------------------------------------------------------
SELECT customerName
FROM customers
WHERE salesRepEmployeeNumber IN (
    SELECT employeeNumber 
    FROM employees
    WHERE officeCode = (SELECT officeCode FROM offices WHERE city = 'San Francisco')
);


