-- criação do banco de dados para o cenário de E-commerce
-- DROP DATABASE ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela cliente
CREATE TABLE clients(
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(100),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);
ALTER TABLE clients AUTO_INCREMENT=1;

-- DESC clients;


-- criar tabela produto
-- evaluation = avaliação
-- size = dimensão do produto
CREATE TABLE product(
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(45) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico','Vestuário','Brinquedos','Alimentos','Móveis') NOT NULL,
    evaluation FLOAT DEFAULT 0,
    size VARCHAR(10)
);
-- DESC product;

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas ao pagamento

CREATE TABLE payments(
    idClient INT,
    idPayment INT,
    typePayment ENUM('Boleto','Cartão','Pix'),
    limitAvailable FLOAT,
    PRIMARY KEY(idClient, idPayment)
);

-- criar tabela pedido
CREATE TABLE orders(
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado','Confirmado','Em Processamento') DEFAULT 'Em Processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);
-- DESC orders;

-- criar tabela estoque
CREATE TABLE productStorage(
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);
-- DESC productStorage;

-- criar tabela fornecedor
CREATE TABLE supplier(
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);
-- DESC supplier;

-- criar tabela vendedor
CREATE TABLE seller(
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(9),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);
-- DESC seller;

-- criar tabela Produto_Vendedor(terceiro)
CREATE TABLE productSeller(
    idPseller INT,
    idPproduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idPproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)
);
-- DESC productSeller;

-- criar tabela Produto/Pedido
CREATE TABLE productOrder(
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível','Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);
-- DESC productOrder;

-- criar tabela Produto_em_Estoque
CREATE TABLE storageLocation(
    idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

-- criar tabela Produto_Fornecedor
CREATE TABLE productSupplier(
    idPsSupplier int,
    idPsProduct int,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);
-- DESC productSupplier;

-- SHOW TABLES;