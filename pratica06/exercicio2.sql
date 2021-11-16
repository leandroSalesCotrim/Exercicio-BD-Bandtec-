-- 1
CREATE DATABASE AC3_produto;

USE AC3_produto;

-- 2
CREATE TABLE categoria(
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nomeCategoria VARCHAR(45)
)AUTO_INCREMENT = 10;

CREATE TABLE produto(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    descProduto VARCHAR(45),
    marcaProduto VARCHAR(45),
    fk_categoria INT,
    FOREIGN KEY (fk_categoria) REFERENCES categoria (idCategoria)
)AUTO_INCREMENT = 100;

CREATE TABLE loja(
	idLoja INT PRIMARY KEY AUTO_INCREMENT,
    nomeLoja VARCHAR(45),
    dataFundLoja DATE
)AUTO_INCREMENT = 1000;

CREATE TABLE vendaLoja(
	fk_loja INT,
    fk_produto INT,
    precoProduto DOUBLE,
    PRIMARY KEY (fk_loja,fk_produto,precoProduto)
);

-- 3 INSERIR DADOS DE FORMA QUE TENHA UMA CATEGORIA QUE TENHA UMA CATEGORIA QUE POSSUA MAIS DE UM PRODUTO
-- E TENHA PELO MENOS UM PRODUTO SENDO VENDIDO EM MAIS DE UMA LOJA
INSERT INTO categoria (nomeCategoria) 
	VALUES ('Placa de video'),('Mouse'),('Teclado');

INSERT INTO produto (descProduto,marcaProduto,fk_categoria)
	VALUE('GTX-650 1GB','NVIDIA',10),
    ('Radeon rx 580 8GB','AMD',10),
    ('Mouse X Soldado gm-600','Infokit',11),
    ('Mouse G403 HERO','Logitech',11),
    ('Teclado 6013160','Maxprint',12),
    ('Teclado GTS-01','XZone',12);
    
INSERT INTO loja (nomeLoja,dataFundLoja)
	VALUE('Kabum','2003-15-03'),
    ('Pichau','2007-20-07');
    
INSERT INTO vendaLoja (fk_loja,fk_produto,precoProduto)
	VALUE(1000,100,450.80),
    (1000,101,3899),
    (1000,102,48.90),
    (1000,103,129.99),
    (1001,100,400),
    (1001,101,3369.87),
    (1001,102,70.90),
    (1001,104,40.90),
    (1001,105,170.90);
    
-- 5
SELECT * FROM categoria;
SELECT * FROM produto;
SELECT * FROM loja;
SELECT * FROM vendaLoja;

-- 6 EXIBIR OS DADOS DAS CATEGORIAS E OS DADOS DOS SEUS PRODUTOS 
SELECT * FROM categoria JOIN produto ON idCategoria = fk_categoria;

-- 7 EXIBIR OS DADOS DE UMA DETERMINADA CATEGORIA E OS DADOS DOS SEUS PRODUTOS
SELECT * FROM categoria JOIN produto ON idCategoria = fk_categoria
	WHERE nomeCategoria = "Placa de video";

-- 8 EXIBIR A MÉDIA E A SOMA DOS PREÇOS DOS PRODUTO, EM GERAL
SELECT TRUNCATE(AVG(precoProduto),2),TRUNCATE(SUM(precoProduto),2) FROM vendaLoja;

-- 9 EXIBIR O MENOR E MAIOR PRECO DOS PRODUTOS, EM GERAL
SELECT MIN(precoProduto) AS "Menor preço",MAX(precoProduto) AS "Maior preço" FROM vendaLoja;

-- 10 EXIBIR OS DADOS DOS PRODUTOS, OS DADOS DAS LOJAS CORRESPONDENTES E OS PREÇOS DOS PRODUTOS EM CADA LOJA
SELECT produto.*,loja.*,vendaLoja.precoProduto FROM produto
	JOIN vendaLoja ON idProduto = fk_produto
	JOIN loja ON idLoja = fk_loja;
    
-- 11 EXIBIR OS DADOS DE UM DETERMINADO PRODUTO, OS DADOS DAS LOJAS QUE O VENDEM E SEU PREÇO EM CADA LOJA
SELECT produto.*,loja.*,vendaLoja.precoProduto FROM produto
	JOIN vendaLoja ON idProduto = fk_produto
	JOIN loja ON idLoja = fk_loja
    WHERE descProduto = "Mouse X Soldado gm-600";

-- 12 EXIBIR OS DADOS DOS PRODUTOS, OS DADOS DAS CATEGORIAS CORRESPONDENTES, OS DADOS DAS LOJAS CORRESPONDENDTES
-- E OS PRECOS DOS PRODUTOS EM CADA LOJA
SELECT produto.*,categoria.nomeCategoria,loja.*,vendaLoja.precoProduto FROM produto
	JOIN categoria ON idCategoria = fk_categoria
    JOIN vendaLoja ON idProduto = fk_produto
	JOIN loja ON idLoja = fk_loja;
    
-- 13 EXIBIR A INDENTIFICAÇÃO DO PRODUTO (FK OU DESC), A MÉDIA E A SOMA DOS PREÇOS DOS PRODUTOS, AGRUPADOS POR PRODUTO
SELECT descProduto, TRUNCATE(AVG(precoProduto),2) AS "Média preço", TRUNCATE(SUM(precoProduto),2) AS "Soma preço" FROM produto
	JOIN vendaLoja ON idProduto = fk_produto
    GROUP BY descProduto;
    
-- 14 EXIBIR A INDENTIFICAÇÃO DA LOJA (FK OU NOME), A MÉDIA E A SOMA DOS PREÇOS DOS PRODUTOS, AGRUPADOS POR LOJA
SELECT nomeLoja, TRUNCATE(AVG(precoProduto),2) AS "Média preço", TRUNCATE(SUM(precoProduto),2) AS "Soma preço" FROM loja
	JOIN vendaLoja ON idLoja = fk_Loja
    GROUP BY nomeLoja;
    
-- 15 EXIBIR A INDENTIFICAÇÃO DO PRODUTO (FK OU DESC), O MENOR E MAIOR PREÇO, AGRUPADOS POR PRODUTO
SELECT descProduto, MIN(precoProduto) AS "Menor preço", MAX(precoProduto) AS "Maior preço" FROM produto
	JOIN vendaLoja ON idProduto = fk_produto
    GROUP BY descProduto;
-- 16 EXIBIR A INDENTIFICAÇÃO DO LOJA (FK OU DESC), O MENOR E MAIOR PREÇO, AGRUPADOS POR LOJA
SELECT nomeLoja, MIN(precoProduto) AS "Menor preço", MAX(precoProduto) AS "Maior preço" FROM loja
	JOIN vendaLoja ON idLoja = fk_loja
    GROUP BY nomeLoja;
