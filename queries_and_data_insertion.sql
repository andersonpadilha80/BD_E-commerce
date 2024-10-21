-- inserção de dados e queries
USE ecommerce;
SHOW TABLES;

-- idClient, Fname, Minit, Lname, CPF, Address
INSERT INTO Clients (Fname, Minit, Lname, CPF, Address)
    VALUES('Maria', 'M', 'Silva', 12346789, 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
          ('Matheus', 'O', 'Pimentel', '987654321', 'Rua Alameda 289, Centro - Cidade das Flores'),
          ('Ricardo', 'F', 'Silva', 45678913, 'Avenida Alameda Vinha 1009, Centro - Cidade das Flores'),
          ('Julia', 'S', 'França', 789123456, 'Rua Lareiras 861, Centro - Cidade da Flores'),
          ('Roberta', 'G', 'Assis', 98745631, 'Avenida Koller 19, Centro - Cidade das Flores'),
          ('Isabela', 'M', 'Cruz', 654789123, 'Rua Alameda das Flores 28, Centro - Cidade das Flores');
          
DESC Clients;
SELECT * FROM Clients;


-- idProduct, Pname, classification_kids bool, category('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis'), evaluation, size
INSERT INTO product (Pname, classification_kids, category, evaluation, size) VALUES
                    ('Fone de ouvido', FALSE, 'Eletrônico', '4', NULL),
                    ('Barbie Elsa', TRUE, 'Brinquedos', '3', NULL),
                    ('Body Carters', TRUE, 'Vestuário', '5', NULL),
                    ('Microfone Vedo - Youtuber', FALSE, 'Eletrônico', '4', NULL),
                    ('Sofá retrátil', FALSE, 'Móveis', '3', '3x57x80'),
                    ('Farinha de arroz', FALSE, 'Alimentos', '2', NULL),
                    ('Fire Stick Amazon', FALSE, 'Eletrônico', '3', NULL);

DESC product;
SELECT * FROM product;


-- idOrder,idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
-- DELETE FROM orders WHERE idOrderClient IN (1, 2, 3, 4);
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
                   (1, DEFAULT, 'compra via aplicativo', NULL, 1),
                   (2, DEFAULT, 'compra via aplicativo', 50, 0),
                   (3, 'Confirmado', NULL, NULL, 1),
                   (4, DEFAULT, 'compra via web site', 150, 0),
                   (2, DEFAULT, 'compra via aplicativo', NULL, 1);
                   
DESC orders;
SELECT *FROM orders;


-- idPOproduct, idPOorder, poQuantity, poStatus
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
                         (1, 1, 2, NULL),
                         (2, 1, 1, NULL),
                         (3, 2, 1, NULL);
                         
DESC productOrder;
SELECT * FROM productOrder;


-- storageLocation, quantity
INSERT INTO productStorage (storageLocation, quantity) VALUES
                           ('Rio de Janeiro', 1000),
                           ('Rio de Janeiro', 500),
                           ('São Paulo', 10),
                           ('São Paulo', 100),
                           ('São Paulo', 10),
                           ('Brasília', 60);
                           
DESC productStorage;
SELECT * FROM productStorage;


-- idLproduct, idLstorage, location
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
                            (1, 2, 'RJ'),
                            (2, 6, 'GO');
                            
DESC storageLocation;
SELECT * FROM storageLocation;


-- idSupplier, SociaalName, CNPJ, contact
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
                     ('Almeida e filhos', 123456789123456, '21985474'),
                     ('Eletrônicos Silva', 854519649143457, '21985484'),
                     ('Eletrônicos Valma', 934567893934695, '21975474');
                     
DESC supplier;
SELECT * FROM supplier;


-- idPsSupplier, idPsProduct, quantity
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
                            (1, 1, 500),
                            (1, 2, 400),
                            (2, 4, 633),
                            (3, 3, 5),
                            (2, 5, 10);
                            
DESC supplier;
SELECT * FROM productSupplier;


-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact) VALUES
                   ('Tech Eletronics', NULL, 123456789456321, NULL, 'Rio de Janeiro', 219946287),
                   ('Botique Durgas', NULL, NULL, 123456783, 'Rio de Janeiro', 219567895),
                   ('Kids World', NULL, 456789123654485, NULL, 'São Paulo', 1198657484);
                   
DESC seller;
SELECT * FROM seller;


-- idPseller, idPproduct, prodQuantity
INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) VALUES
                          (1, 6, 80),
                          (2, 7, 10);
                          
DESC productSeller;
SELECT * FROM productSeller;


-- consultas

SELECT COUNT(*) FROM clients;

SELECT * FROM clients AS c, orders AS o WHERE c.idClient = idOrderClient; 

SELECT Fname, Lname, idOrder, orderStatus FROM clients AS c, orders AS o WHERE c.idClient = idOrderClient;
SELECT concat(Fname,' ', Lname) AS Cliente, idOrder AS Pedido, orderStatus AS Situação FROM clients AS c, orders AS o WHERE c.idClient = idOrderClient;

                   