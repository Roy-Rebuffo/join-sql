-- El empleado que ha vendido mas en cada oficina

 -- Obtenemos empleados pero se repiten las oficinas 
select e.firstName, e.lastName, e.employeeNumber, e.officeCode, sum(p.amount) totalVentas
from employees e, customers c, payments p
where e.employeeNumber = c.salesRepEmployeeNumber
and c.customerNumber = p.customerNumber
group by employeeNumber;

-- Ahora lo que queremos hacer es que de cada empleado de las oficinas queremos obtener el maximo de cada una de ellas
select est.officeCode,max(est.maxTotalVentas) from
(select e.employeeNumber,e.officeCode, sum(p.amount) maxTotalVentas
from employees e, customers c, payments p
where e.employeeNumber = c.salesRepEmployeeNumber
and c.customerNumber = p.customerNumber
group by e.employeeNumber, e.officeCode) est
group by est.officeCode
;


SELECT est.officeCode, est.firstName, est.lastName, est.totalVentas
FROM (
SELECT e.firstName, e.lastName, e.employeeNumber, e.officeCode, SUM(p.amount) AS totalVentas
FROM employees e JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY e.employeeNumber, e.firstName, e.lastName, e.officeCode) est
WHERE (est.officeCode, est.totalVentas) IN (
SELECT officeCode, MAX(totalVentas) AS maxVentas
FROM (
SELECT e.officeCode, SUM(p.amount) AS totalVentas
FROM employees e JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY e.officeCode, e.employeeNumber) ventasPorOficina
GROUP BY officeCode)
ORDER BY est.officeCode;
