
create database ecommerce_r;
use ecommerce_r;

create table tipopessoa (
    idtipopessoa int primary key auto_increment,
    descricao varchar(50)
);

insert into tipopessoa ( descricao)values
				   ('Fisica'),
                   ('Juridica');

CREATE TABLE pessoa (
	idpessoa int NOT NULL,
    idtipopessoa int,
    PRIMARY KEY (idpessoa),
    CONSTRAINT FK_tipoPessoaPessoa FOREIGN KEY (idtipopessoa)
    REFERENCES tipopessoa(idtipopessoa)
);

insert into pessoa (idpessoa, idtipopessoa) values  
               (1, 1), 
               (2, 2),
               (3, 2), 
			   (4, 2), 
               (5, 1), 
               (6, 1),
               (7, 1), 
			   (8, 1),
			   (9, 1);
               
 create table PessoaFisica(
idPessoaFisica int NOT NULL,
	Inome varchar(40),
    Mabrev char(3),
    Fnome varchar(40),
	CPF varchar (11) NOT NULL,
	DataNascimento date, 
    endereco varchar(255),
	PRIMARY KEY (idPessoaFisica),
    CONSTRAINT FK_Pessoa_PessoaFisica FOREIGN KEY (idPessoaFisica)
    REFERENCES pessoa(idpessoa)
 );

 insert into PessoaFisica (idPessoaFisica, Inome, Mabrev,Fnome, CPF, DataNascimento, endereco) values  
		  (1,'Maria','M','Silva', 1234689,'1991-12-14','rua silva prata 29,Carangola - Cidade das Flores'),
		  (5,'Matheus','O','Pimentel', 987654321,'1965-10-24','rua alemeda 289, Centro - Cidade das Flores'),
          (6,'Ricardo','F','Silva', 45678913,'1965-10-24','avenida alemeda vinha 1009, Centro - Cidade das Flores'),
          (7,'Julia','S','França', 789123456,'1965-10-24','rua laranjeiras 861, Centro - Cidade das Flores'),
          (8,'Roberta','G','Assis', 98745631,'1965-10-24','avenida Koller 19, Carangola - Cidade das Flores'),
          (9,'Isabela', 'M','Cruz', 654789123,'1965-10-24','rua alemeda das flores 28, Centro- Cidade das Flores');
              
   
create table PessoaJuridica(
	idPessoaJuridica int NOT NULL,
	RazaoSocial varchar(50),
	CNPJ char (15) NOT NULL unique,
    Localizacao varchar(255) ,
    Contato char(11) not null,
	PRIMARY KEY (idPessoaJuridica),
    CONSTRAINT FK_Pessoa_PessoaJuridica FOREIGN KEY (idPessoaJuridica)
    REFERENCES pessoa(idpessoa)
 );

 insert into PessoaJuridica (idPessoaJuridica, RazaoSocial, CNPJ,Localizacao,Contato) values  
                        (2,'Tech eletronics', 123456789456321,'Rio de Janeiro', 219946287),
                        (3,'Botique Durgas',12345689123456,'Rio de Janeiro', 219567895),
                        (4,'Kids World', 456321123456789,'São Paulo',119865284);

create table Fornecedor(
    idFornecedor int not null,
    PessoaJuridica int NOT NULL, 
    PRIMARY KEY (idFornecedor),
    CONSTRAINT FK_Fornecedor_PessoaJuridica FOREIGN KEY (PessoaJuridica)
    REFERENCES pessoa(idpessoa)  
);
insert into Fornecedor(idFornecedor, PessoaJuridica) values
					 (1, 2),
					 (2, 3),
					 (3, 4);

create table Vendedor(
idVendedor int not null,
    PRIMARY KEY (idVendedor),
    CONSTRAINT FK_Vendedor_Pessoa FOREIGN KEY (idVendedor)
    REFERENCES pessoa(idpessoa)  
   ); 
   
 insert into Vendedor(idVendedor) values
					 (2),
					 (3),  
                     (4);

create table Cliente(
	idCliente int not null,
    PessoaFisica int not null,
	PRIMARY KEY (idCliente),
    CONSTRAINT FK_Cliente_PessoaFisica FOREIGN KEY (PessoaFisica)
    REFERENCES pessoa(idpessoa)  
   ); 
   
   insert into Cliente(idCliente, PessoaFisica) values
					 (1, 1), 
                     (2, 5),
                     (3, 6),
                     (4, 7),
                     (5, 8),
                     (6, 9);

create table Produto(
	idProduto int auto_increment primary key,
	Pnome varchar(100) not null,
	classificacao_criancas bool default false,
	categoria enum('Eletrônico','Vestúario','Brinquedos', 'Alimentos','Moveis') not null,
	avaliacao float default 0,
	dimensao varchar(10)
       ) ;
alter table produto auto_increment=1;


insert into produto (Pnome, classificacao_criancas, categoria, avaliacao, dimensao) values
						('Fone de ouvido',false,'Eletrônico','4',null),
                        ('Barbie Elsa',true,'Eletrônico','3',null),
                        ('Body Carters',true,'Vestúario','5',null),
                        ('Microfone Vedo-Youtuber',False,'Eletrônico','3',null),
                        ('Sofá retrátil',False,'Móveis','3','3X57X80'),
						('Farinha de arroz',False,'Alimentos','2',null),
                        ('Fire Sticks Amazon',False,'Vestúario','3',null);
     
create table Pagamento(
	idCliente int,
	idPagamento int,
	tipoPagamento enum ('Boleto','Cartão','Dois Cartões'),
	AvaliacaoLimite float,
	PRIMARY KEY (idCliente, IdPagamento),
    CONSTRAINT FK_Pagamento_Cliente FOREIGN KEY (idCliente)
    REFERENCES Cliente(idCliente)  
 );   

 create table Pedido(
 idPedido int auto_increment primary key,
 idPedidoCliente int ,
 pedidoStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
 pedidoDescricao varchar(255),
 Frete float default 10,
 formaPagamento bool default false, -- boleto  
  constraint fk_pedido_Cliente foreign key (idPedidoCliente) references Cliente(idCliente)
		on update cascade
 );
   alter table pedido auto_increment=1;
   insert into pedido (idPedidoCliente, pedidoStatus, pedidoDescricao, Frete, formaPagamento)values
						(1,default,'compra via aplicativo',null,1),
                        (2,default,'compra via aplicativo',50,0),
                        (3,'Confirmado',null,null,1),
                        (4,default,'compra via web site',150,0);
select * from Pedido;              
create table EstoquePedido(
 idEstoque int auto_increment primary key,
 localizacaoEstoque varchar(255),
 quantidade int default 0
 );
   alter table EstoquePedido auto_increment=1;
   insert into EstoquePedido (localizacaoEstoque,quantidade) values
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('Brasilia', 60);
   
  create table vendedorProduto(
 idVendedorProduto int,
 idPproduto int,
 prodQuantidade int default 1,
 primary key( idVendedorProduto, idPproduto),
 constraint fk_vendedor_produto foreign key (idVendedorProduto) references vendedor(idVendedor),
 constraint fk_pProduto_produto foreign key (idPproduto) references produto(idProduto)
 );   
 
  insert into vendedorProduto (idVendedorProduto,idPproduto, prodQuantidade) values
							(2,6,80),
                            (3,7,10);
 
  create table pedidoProduto(
 idPproduto int,
 idPpedido int,
 ppQuantidade int default 1,
 ppStatus enum('Disponivel','Sem estoque') default 'Disponivel',
 primary key(idPproduto, idPpedido),
 constraint fk_produtoPedido_vendedor foreign key (idPproduto) references produto(idProduto),
 constraint fk_produtoPedido_produto foreign key (idPpedido) references Pedido(idPedido)
 );
 
 insert into pedidoProduto (idPproduto, idPpedido, ppQuantidade, ppStatus) values
							(1,1,2,null),
                            (2,2,1,null),
                            (3,3,1,null);
select * from Pedido;
  create table localizacaoEstoque(
 idLproduto int,
 idLestoque int,
 localizacao varchar(255) not null, 
 primary key(idLproduto, idLestoque),
 constraint fk_estoque_localizacao_produto foreign key (idLproduto) references produto(idProduto),
 constraint fk_estoque_localizacao_estoque foreign key (idLestoque) references EstoquePedido(idEstoque)
 );
insert into localizacaoEstoque(idLproduto, idLestoque,localizacao) values
							(1,2,'RJ'),
                            (2,4,'SP'); 

  create table fornecedorProduto(
 idPFornecedor int,
 idPProduto int,
quantidade int not null, 
 primary key(idPFornecedor, idPProduto ),
 constraint fk_produto_fornecedor_fornecedor foreign key (idPFornecedor) references fornecedor(idFornecedor),
 constraint fk_produto_fornecedor_produto foreign key (idPProduto) references produto(idProduto)
 );
 
 insert into fornecedorProduto (idPFornecedor, idPProduto, quantidade) values
								(1,1,500),
                                (1,2,400),
                                (2,4,633),
                                (3,3,5),
                                (2,5,10);
                                