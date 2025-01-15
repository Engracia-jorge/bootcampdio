-- Persistindo dados no banco de dados ecomerce

use ecomerce;
show tables;
-- Registar Cliente
insert into cliente(Fname,Minit, Lname, CPF, Address)
  values('Maria','M','Silva',123456789,'Rua Silva de Prata 29,carangola - Cidade das Flores'),
		('Mateus','O','Pimentel',987654321,'Rua Alameda 289,centr - Cidade das Flores'),
        ('Ricardo','F','Silva',456789123,'Avenida Almeida Vinha 1009,carangola - Cidade das Flores'),
        ('Julia','S','França',789123456,'Rua Lareijar 861,carangola - Cidade das Flores'),
        ('Roberta','G','Assis',912345678,'Avinida Koller 19,centro - Cidade das Flores'),
        ('Isabela','M','Cruz',678912345,'Rua Alameda das Flores 28,centro - Cidade das Flores');
        
        
        -- Registar Produto
insert into product( Pname,Classification_kids, Category,  Avaliação,size)
  values('Fone de ouvido',false,'Electronico',4,null),
		('Barbie Elsa',true,'Brinquedos',3,null),
        ('Body Carters',true,'Vestuario',5,null),
        ('Microfone Vedo- Youtuber',false,'Electronico',4,null),
        ('Sofa retratil',false,'Moveis',3,null),
        ('Farinha de arroz',false,'Alimento',2,null),
        ('Fari stick amazon',false,'Electronico',3,null);
        
        select *from cliente;
        select *from product;
       
-- Registar pedidos
insert into  Orders( idOderClient, orderStatus, orderDescription, sendValues, paymentCash)
            values(1,default,'Compra via aplicativo',1,null),
		          (2,default,'Compra via aplicativo',50,0),
                  (3,'confirmado',null,null,1),
                  (4,default,'compra via website',150,0);
        
select *from Orders;
        
-- Registar productsOrder
insert into productsOrder( idPOproduct, idPOorder, poQuantity, poStatus)
				  values(1,5,2,null),
		                (2,5,1,null),
                        (3,6,1,null);
                        
-- Registar estoque
insert into productstorage( Storagelocation ,quantity )
				  values('Rio de janeiro',1000),
		                ('Rio de janeiro',500),
                        ('Luanda',2000),
						('Rio de janeiro',10),
                        ('Luanda',100),
                        ('Bengo',6300); 
                        
-- Registar storageLocation
insert into storageLocation(idLProduct , idLstorage,Location )
				  values(1,2,'RG'),
		                (2,6,'Ld');
                        
-- Registar fornecedor
insert into supplier(socialName ,CNPJ, contact )
				  values('Almeida e Filho',123456789123456,24356786),
		                ('Electronicos Silva',676543218123456,19283746),
						('Electronicos Valma',676543218123333,19222746);
                        
                        select *from supplier;
 
 -- Registar fornecedor produto
insert into ProductSupplier(idPsSupplier , idPSProduct, quantity )
				  values(1,1,500),
		                (1,2,400),
						(1,3,300);
                        
                        
  -- Registar vendedor
insert into seller(socialName , AbstName,CNPJ,CPF,Location,contact)
			values('Tech Electronics',null,500123456789111,null,'Rio de janeiro',34526798),
				  ('Boutique Durgas',null,123456783,null,'Rio de Janeiro',54321678),
				  ('Kids world',null,30034567890123,null,'São Paulo',65432798);                       
                        
	select *from seller;
        
          -- Registar vendedor produto
insert into productSeller(idPseller , idPproduct, prodQuantity)
				   values(1,6,80),
				         (2,7,10),
				         (3,4,59);  
                         
select *from  productSeller;     
select count(*)from cliente; 
select  Fname, Lname, idOder, orderStatus from cliente c, orders o where c.idclient=idOderClient;
select  concat(Fname,' ',Lname) as client, idOder as Request, orderStatus as status from cliente c, orders o where c.idclient = idOderClient;
select *from cliente c, orders o where c.idclient=idOderClient;
                        
select count(*)from cliente c, orders o where c.idclient = idOderClient;

-- recuperar quantos pedidos foram realizados pelos clientes
select  c.idclient, Fname, count(*) as Number_of_orders from cliente c 
INNER JOIN orders o ON c.idclient = O.idOderClient
INNER JOIN productsOrder P ON P.idPOorder = O.idOder 
group by idclient;
