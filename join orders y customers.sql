/*En esta consulta quiero saber cuantas ordenes han sido canceladas por mes*/
select month(a.requiredDate) monthNumber, 
       COUNT(*) totalCancelled
from orders a  
join customers b on a.customerNumber = b.customerNumber  
where a.status = "Cancelled"  
group by month(a.requiredDate)
order by monthNumber;

/*aqui averiguo las personas en concreto para poder contactar con ellas por si hubo algun problema y poder solucionar si es posible*/
select a.customerNumber,  month(a.requiredDate) mesRequerido, b.contactFirstName, b.contactLastName, a.status, b.phone
from orders a join customers b on a.customerNumber = b.customerNumber
where a.status = "Cancelled"
order by mesRequerido;
