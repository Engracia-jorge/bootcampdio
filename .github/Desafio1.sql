-- criação do banco de dados ecommerce
-- drop database ecomerce;

create database ecomerce;
use ecomerce;

-- criação da tabela cliente

create table cliente(
	idclient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique(CPF)
    );
    alter table cliente auto_increment 1;
    desc cliente;
    
-- criação da tabela Produto
-- size= dimensão do produto
create table product(
	idproduct int auto_increment primary key,
    Pname varchar(10) not null,
   Classification_kids bool,
   Category enum('Electronico','vestuario','Brinquedos','Alimento','Moveis')not null,
    Avaliação float default 0,
    size varchar(10)
    );
    -- para ser implementado no desafio
    -- criação da tabela pagamento
    create table payments(
		idpayment int,
        idclient int,
        typepayment enum('Boleto','cartão','Dois cartões'),
        limitAvailable floaT,
       primary key(idclient, id_payment) 
    
    );
    
-- criação da tabela pedido
Create table Orders (
	idOder int auto_increment primary key,
    idOderClient int,
    orderStatus enum('Cancelado','confirmado','Em andamento')default 'Em andamento',
    orderDescription varchar(255),
    sendValues float default 10,
    paymentCash bool default false,
    constraint fk_order_client foreign key( idoderClient)references cliente (idclient)
);

-- criação da tabela estoque
Create table productstorage(
	idproductstorage int auto_increment primary key,
    Storagelocation varchar(255),
	quantity int default 0
);
-- criação da tabela fornecedor
Create table supplier(
	idsupplier int auto_increment primary key,
    socialName varchar(255) not null,
	CNPJ char(15)not null,
    contact char(11)not null,
    constraint unique_supplier unique (CNPJ)
);
-- criação da tabela vendedor
Create table seller(
	idseller int auto_increment primary key,
    socialName varchar(255) not null,
    AbstName varchar(255),
	CNPJ char(15),
    CPF char(9),
    Location varchar(255),
    contact char(11)not null,
    constraint unique_cnpj_supplier unique (CNPJ),
    constraint unique_cpf_supplier unique (CPF)
);
-- criação da tabela resultante de um relacionamento MM
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key(idPseller,  idPproduct),
    constraint fk_product_seller foreign key(idPseller)references seller(idseller),
	constraint fk_product_product foreign key(idPproduct)references product(idproduct)
);
desc productSeller;

create table productsOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponivel', 'Sem Estoque') default 'Disponivel',
    primary key(idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key(idPOproduct)references product(idproduct),
	constraint fk_productorder_product foreign key(idPOorder)references orders(idOder)
);

create table storageLocation(
	idLProduct int,
    idLstorage int,
    Location varchar(255)not null,
    primary key(idLProduct, idLstorage),
    constraint fk_productstoragel_seller foreign key(idLProduct)references product(idproduct),
	constraint fk_productstoragel_product foreign key( idLstorage)references productstorage(idproductstorage)
);
create table ProductSupplier(
	idPsSupplier int,
    idPSProduct int,
	quantity int not null,
    primary key(idPsSupplier, idPSProduct),
    constraint fk_product_supplier_supplier foreign key(idPsSupplier)references supplier(idsupplier),
	constraint fk_products_supplier_product foreign key(idPSProduct )references product(idproduct)
);
 
 show tables;