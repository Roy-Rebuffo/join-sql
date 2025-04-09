-- Cuales son los emails de los empleados que han generado menos que la media del 2005
select amount 
from payments
where amount like "34872.%"
;
-- Media del total de los payments
select avg(amount)
from payments
where year(paymentDate) = 2005
;

-- agrupo por employeeNumber y obtengo la suma de cada uno de sus amount para poder luego comparar con la media
select e.employeeNumber, e.firstName,e.lastName, e.email, sum(p.amount)
from employees e
join customers c on e.employeeNumber = c.salesRepEmployeeNumber
join payments p on c.customerNumber = p.customerNumber
group by e.firstName, e.lastName, e.employeeNumber
;

-- no hay menores que la media pero si mayores.
SELECT 
    tablaEmails.*
FROM
    (SELECT 
        AVG(amount) media
    FROM
        payments
    WHERE
        YEAR(paymentDate) = 2005) tablaMedia, -- quizás sea un poco redundante poner otra vez year aqui. preguntar a santi
    (SELECT 
        e.email, SUM(p.amount) sumaTotalVentas
    FROM
        employees e
    JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
    JOIN payments p ON c.customerNumber = p.customerNumber
    WHERE
        YEAR(p.paymentDate) = 2005
    GROUP BY e.employeeNumber) tablaEmails
WHERE
    tablaEmails.sumaTotalVentas < tablaMedia.media
;