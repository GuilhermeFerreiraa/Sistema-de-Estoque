create DATABASE estoque;
use estoque;

CREATE TABLE fornecedor (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(64) DEFAULT NULL,
  cnpj varchar(15) DEFAULT NULL, 
  tel1 varchar(11) DEFAULT NULL,	
  tel2 varchar(11) DEFAULT NULL,
  cep varchar(10) DEFAULT NULL,
  num int(6) DEFAULT NULL,
  rua varchar(64) DEFAULT NULL,
  comp varchar(32) DEFAULT NULL,
  bairro varchar(64) DEFAULT NULL,
  cidade varchar(64) DEFAULT NULL,
  estado varchar(64) DEFAULT NULL,
  deleted_at date DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE categoria (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(64),
  deleted_at date,
  PRIMARY KEY (id)
 );

CREATE TABLE produtos (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(64) DEFAULT NULL,
  preco double DEFAULT NULL,
  qntd double DEFAULT NULL,
  tipoUn varchar(5),
  estoqueMin double DEFAULT 20,
  localPic varchar(256),
  idFornecedor int,
  idCategoria int,
  deleted_at date DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idFornecedor) REFERENCES fornecedor (id),
  FOREIGN KEY (idCategoria) REFERENCES categoria (id)
 );

 CREATE TABLE usuario (
	id int NOT NULL AUTO_INCREMENT,
	nome varchar(64),
	cpf varchar(11),
	sexo varchar(1),
	dataNasc date,
	tel1 varchar(11),
	tel2 varchar(11),
	cep varchar(10),
	num int(6),
	rua varchar(64),
	comp varchar(32),
	bairro varchar(64),
	cidade varchar(64),
	estado varchar(64),
	cargo int,
	login varchar(32),
	senha varchar(32),
	deleted_at date DEFAULT NULL,
	localPic varchar(256),
	PRIMARY KEY (id)	
 );

 CREATE TABLE compras (
	id int NOT NULL AUTO_INCREMENT,
	idUsuario int NOT NULL,
	valor double,
	status int DEFAULT 0,
	dataCompra datetime,
	dataEntrega datetime,
	dataFinal datetime DEFAULT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (idUsuario) REFERENCES usuario (id)
);
 
 CREATE TABLE produtos_compra(
 	idCompra int NOT NULL,
	idProduto int NOT NULL,
	qtdProduto double,
	precoUnProduto double,
	PRIMARY KEY(idCompra,idProduto),
	FOREIGN KEY (idCompra) REFERENCES compras (id),
	FOREIGN KEY (idProduto) REFERENCES produtos (id)
);

 CREATE TABLE vendas (
	id int NOT NULL AUTO_INCREMENT,
	idUsuario int NOT NULL,
	valor double,
	dataVenda datetime,
	PRIMARY KEY (id),
	FOREIGN KEY (idUsuario) REFERENCES usuario (id)
);

 CREATE TABLE produtos_venda(
 	idVenda int NOT NULL,
	idProduto int NOT NULL,
	qtdProduto double DEFAULT 0,
	precoUnProduto double,
	PRIMARY KEY(idVenda,idProduto),
	FOREIGN KEY (idVenda) REFERENCES vendas (id),
	FOREIGN KEY (idProduto) REFERENCES produtos (id)
);



INSERT INTO usuario(nome, cpf, sexo, dataNasc, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado, cargo, login, senha) 
	values ('Guilherme Ferreira','46760818806','M','2001-06-13','1140028022','0','13563340',181,'Rua Nossa Senhora me Socorre','','Parque Santa Ajuda','São Projeto','SP',0,'admin','admin');

INSERT INTO usuario(nome, cpf, sexo, dataNasc, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado, cargo, login, senha) 
	values ('Matheus Coturri','44691492844','M','2001-12-06','1633661367','16982472564','13573059',882,'Rua Joaquim Garcia de Oliveira ','','Cidade Aracy ','São Carlos','SP',2,'almoxarife','almoxarife');
	
INSERT INTO usuario(nome, cpf, sexo, dataNasc, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado, cargo, login, senha) 
	values ('Felipe Ferreira','31313131313','M','1990-10-21','1633667070','16988536978','23065190',562,'Rua Dezoito','','Paciência','Rio de Janeiro','RJ',1,'supervisor','supervisor');

INSERT INTO usuario(nome, cpf, sexo, dataNasc, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado, cargo, login, senha) 
	values ('Alex Christos','74598861067','M','1987-05-12','1633665897','0','72903088',12,'Quadra Quadra 169','','Parque Estrela Dalva XVII','Santo Antônio do Descoberto','GO',3,'caixa','caixa');



INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Specx Eletrônica Ltda','02948980000184','1339025792','0','11349285','917','Rua Antonio Pacífico','','Conjunto Residencial Humaitá','São Vicente','SP');

INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Laura Pães e Doces Ltda','98250971000194','1635030991','16989944942','14093536','646','Rua Mario Maurim','','Parque Residencial Cândido Portinari','Ribeirão Preto','SP');

INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Alvorecer Comercio de Bebidas Ltda','53211931000103','1138922225','11988929113','03286040','824','Rua José Loureiro das Neves','','Vila Cleonice','São Paulo','SP');

INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Cutigi Frios','50899158000113','1939150257','19982701726','13087536','110','Rua Antero Patrício Silvestre','','Parque Rural Fazenda Santa Cândida','Campinas','SP');

INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Tati Salgados & Pastéis','48338778000131','1135270579','11992705672','05831115','997','Travessa Dona Dora','','Chácara Santana','São Paulo','SP');	
	
INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Depósito de Bebidas','54946336000170','1738036418','17987241975','15041522','931','Avenida Aguinaldo Rossini','','Jardim Bianco','São José do Rio Preto','SP');	
	
INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Kabum Eletrônicos','01624509000178','17993755105','17987241975','15500310','837','Rua Benjamin Constant','','Jardim Bom Clima','Votuporanga','SP');
	
INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Livraria Kzar','43712077000105','1138673753','0','06707200','891','Rua Maestro Manoel Vitorino dos Santos','','Granja Viana II','Cotia','SP');

INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Tem-de-Tudo','43712077789157','1137873753','0','06707200','1002','Rua Maestro Manoel Vitorino dos Santos','','Granja Viana I','Cotia','SP');

INSERT INTO fornecedor(nome, cnpj, tel1, tel2, cep, num, rua, comp, bairro, cidade, estado) 
	values ('Jô Modas e Calçados','52042077789157','1136873356','0','08599660','102','Rua Beta','','Una','Itaquaquecetuba','SP');



INSERT INTO categoria(nome) values ('Doces'); 
INSERT INTO categoria(nome) values ('Salgados');
INSERT INTO categoria(nome) values ('Eletrônicos');
INSERT INTO categoria(nome) values ('Bebidas');
INSERT INTO categoria(nome) values ('Acessórios');	
INSERT INTO categoria(nome) values ('Roupas');
INSERT INTO categoria(nome) values ('Sapatos');
INSERT INTO categoria(nome) values ('Escolar');
INSERT INTO categoria(nome) values ('Encanamentos');
INSERT INTO categoria(nome) values ('Cabos');
INSERT INTO categoria(nome) values ('Construção');
INSERT INTO categoria(nome) values ('Cosméticos');
INSERT INTO categoria(nome) values ('Decoração');
INSERT INTO categoria(nome) values ('Brinquedos');
INSERT INTO categoria(nome) values ('Peças Automotivas');
INSERT INTO categoria(nome) values ('Móveis');
INSERT INTO categoria(nome) values ('Animais');
INSERT INTO categoria(nome) values ('Utensílios Domésticos');
INSERT INTO categoria(nome) VALUES ('Cinema');
INSERT INTO categoria(nome) VALUES ('Bebê');
INSERT INTO categoria(nome) VALUES ('Frios');
INSERT INTO categoria(nome) VALUES ('Limpeza');



INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Pão De Queijo', 2.50, 25,'UN', 7, 2);
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('teclado Razer Blackwindow ',459.99, 17,'UN', 7, 3);
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Mortadela',4.99, 97,'KG', 4, 21);
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Linguiça Toscana Seara', 45.52, 32,'KG', 4, 21 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Crepúsculo',39.90, 58,'UN', 8, 19);

INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Mouse Pad', 119.90, 52,'UN', 1, 3 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Cabo Apple 3/4 ',89.99, 1500,'M', 1, 10);
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('whisky Red Label 1l', 99.99, 150,'UN', 3, 4 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Limpador De Vidro',15.50, 43,'UN', 9, 18);
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Liquidificador', 65.89, 37,'UN', 9, 14);

INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Capinha De Celular',79.90, 93,'UN', 9, 5);
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Nike Air Max 90',449.90, 17,'UN', 10, 7);
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Lapiseira 0.5 BIC', 8.50, 72,'UN', 8, 8 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Pão De Banha',12.99, 61,'KG', 2, 2);
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Askov', 8.99, 83,'UN', 6, 4 );


INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Alexa', 299.99, 21,'UN', 9, 9 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Manteiga',4.99, 67,'UN', 4, 21);
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Cera Automotiva', 19.90, 14,'UN', 9, 15 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('yogurt', 6.50, 315,'UN', 2, 4 );

INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Amaciante YPÊ', 13.99, 126,'UN', 9, 22 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Coca-Cola 600ML', 5.50, 679,'UN', 6, 4 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('filé mignom', 59.90, 65.5,'KG', 4, 21 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Tornera Aço Inox', 17.69, 128,'UN', 9, 15 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Fone De Ouvido intra auricular ', 15.99, 32,'UN', 9, 12 );

INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Porta Retratos 15x21', 14.99, 23,'UN', 9, 13 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Croissante', 7.99, 8,'UN', 5, 2 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Pão Doce', 7.99, 33,'UN', 2, 1 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Repetidor tp-link tl-wa850re', 79.90, 17,'UN', 1, 3 );

INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Carrinho de Bebê', 120.00, 7,'UN', 9, 16 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Fralda Pampers', 49.90, 65,'UN', 9, 20 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Iogurte Caseiro', 6.00, 36.5,'L', 2, 4);

INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Reguá 30cm', 5.00, 112,'UN', 9, 5 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Carpete Welcome', 37.90, 5,'UN', 9, 18 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Gravador De CDs', 67.90, 7,'UN', 9, 3 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Cabo DVI', 19.50, 6,'UN', 7, 10);

INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Monitor LED AOC 144Hz', 1799.00, 9,'UN', 7, 3 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Jogo de Talheres Tramontina', 59.90, 19,'UN', 9, 18 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Caixa De Som M-AUDIO', 1349.90, 1,'UN', 1, 3 );
INSERT INTO produtos(nome, preco, qntd, tipoUn, idFornecedor, idCategoria) values ('Argamassa', 36.90, 54.7,'KG', 9, 11);

SELECT * FROM usuario;