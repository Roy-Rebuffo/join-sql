/*Selecciono todas las de orders(a), todas las de payments(b) de la tabla orders y que haga un join con la tabla payments y que coincida el customerNumber de a = customerNumber de b 
donde el customerNumber de a sea 363*/
/*fuerzo que el customer number sea el mismo porque en ambas tablas hay customerNumber (duh) pero si no coinciden me tira la informacion de otros customerNumber cosa que no quiero*/
/*busco el customerNumber 363 de la tabla orders y quiero relacionarlo con sus pagos(payments).*/
/*uso esta consulta para para ver cuando ha comprado cosas el customerNumber 363*/

SELECT a.*, b.*
FROM orders a JOIN payments b ON a.customerNumber=b.customerNumber
where a.customernumber = '363'


