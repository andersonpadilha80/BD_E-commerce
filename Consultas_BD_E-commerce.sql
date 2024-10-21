USE ecommerce;

-- consultas

SELECT COUNT(*) FROM clients;

SELECT * FROM clients AS c, orders AS o WHERE c.idClient = idOrderClient;

SELECT Fname, Lname, idOrder, orderStatus FROM clients AS c, orders AS o WHERE c.idClient = idOrderClient;
SELECT concat(Fname,' ', Lname) AS Cliente, idOrder AS Pedido, orderStatus AS Situação FROM clients AS c, orders AS o WHERE c.idClient = idOrderClient;

SELECT * FROM clients AS c, orders AS o
    WHERE c.idClient = idOrderClient
    GROUP BY idOrder;

SELECT COUNT(*) FROM clients AS c, orders AS o
    WHERE c.idClient = idOrderClient
    GROUP BY idOrder;
    
SELECT * FROM orders;
SELECT c.idClient, Fname, COUNT(*) AS Number_of_orders FROM clients AS c
    INNER JOIN orders AS o ON c.idClient = o.idOrderClient
    INNER JOIN productOrder AS p ON p.idPOorder = o.idOrder
    GROUP BY idClient;

-- Recuperar quantos pedidos foram realizados pelos clientes?
SELECT c.idClient, Fname, COUNT(*) AS Number_of_orders FROM clients AS c
    INNER JOIN orders AS o ON c.idClient = o.idOrderClient
    GROUP BY idClient;