/*hago esta consuta para averiguar donde trabajan los empleados (officeCode) y para poder comunicarme con ellos su email*/

select a.officeCode, b.lastName, b.firstName, b.email
from offices a join employees b ON a.officeCode=b.officeCode
order by b.lastName;

/*Lo mismo pero para encontrar a una persona en concreto*/
select a.officeCode, b.lastName, b.firstName, b.email
from offices a join employees b ON a.officeCode=b.officeCode
where b.firstName = "Gerard"
and b.lastName = "Bondur"
order by b.lastName;