# Portfolio - parte 1

Un banco quiere empezar a ofrecer servicios financieros a sus clientes. Dentro de estos servicios está la posibilidad de poder ver agrupaciones de cuentas. Esas agrupaciones de cuentas se denominan Portfolios.

Un portfolio es una agrupación de cuentas o portfolios, y se puede hacer con ellos lo mismo que con una cuenta salvo registrar transacciones. 
Por ejemplo si un portfolio es la agrupación de cuenta1 (con balance de $100) y cuenta2 (con balance de $200), se espera que el balance del portfolio sea $300.
También se espera poder preguntarle a un portfolio si alguna de sus cuentas registró una transacción por medio del mensaje #hasRegistered: y poder conocer todas las transacciones de las cuentas que forman parte del portfolio por medio del mensaje #transactions.
Por último, se espera que portfolios puedan formar parte de portfolios no únicamente cuentas, pero hay que asegurarse que estas no se repitan porque sino habría duplicación de información.
Respecto de la estructura del portfolio, tener en cuenta que:
1) Los portfolios se pueden modificar agregándoles cuentas o portfolios
2) Una cuenta o portfolio puede estar en más de un portfolio
3) Como es una estructura de árbol en donde no puede haber nodos repetidos, hay que estar seguros que cuando se modifique un portfolio (agregar una cuenta o portfolio) siga siendo un árbol sin nodos repetidos
4) Por ahora no se puede sacar cuentas o portfolios de un portfolio

Resolver este ejercicio por medio de TDD.

