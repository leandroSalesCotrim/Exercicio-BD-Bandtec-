-- 1 e 2 CRIAR E SELECIONAR BANCO
CREATE DATABASE Campanha;

USE Campanha;

-- 3 CRIAR TABELAS DE ACORDO COM O MODELO LÓGICO
CREATE TABLE organizador(
	idOrganizador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    rua VARCHAR(45),
    bairro VARCHAR(45),
    email VARCHAR(45),
    fk_orientador INT,
    FOREIGN KEY (fk_orientador) REFERENCES organizador(idOrganizador)
)AUTO_INCREMENT = 30;

CREATE TABLE campanha(
	idCampanha INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(45),
    instituicao1 VARCHAR(45),
    instituicao2 VARCHAR(45),
    fk_organizador INT,
    FOREIGN KEY (fk_organizador) REFERENCES organizador (idOrganizador)
)AUTO_INCREMENT = 500;

-- 4 INSERIR DADOS DE FORMA QUE TENHA MAIS DE UMA CAMPANHA PARA ALGUM ORGANIZADOR,
-- E MAIS DE UM ORGANIZADOR NOVATO SENDO ORIENTADO POR OUTRO MAIS EXPERIENTE 
INSERT INTO organizador (nome,rua,bairro,email,fk_orientador) 
	VALUES('Globo','Vinte e Três','Bela Vista','globo@redeGlobo.com.br',NULL),
    ('APAD','Cobertura 8','Vila Nova','APAD@outlook.com.br',30),
    ('UEPA','Dom Pedro II','Bela Vista','UEPA@hotmail.com.br',30);

INSERT INTO campanha(categoria,instituicao1,instituicao2,fk_organizador) 
	VALUES ('Alimento','Cerene',NULL,30),
    ('Roupas','ACNUR','Cerene',30),
    ('Brinquedos','Cerene','ABCD',31),
    ('Livros','ACNUR',NULL,32);
    
-- 5 EXIBIR O DADOS DE CADA TABELA SEPARADAMENTE
SELECT * FROM organizador;
SELECT * FROM campanha;

-- 6 ACERTOS DE CHAVE ESTRANGEIRA (JÁ FEITO).

-- 7 EXIBIR OS DADOS DOS ORGANIZADORES E OS DADOS DE SUAS RESPECTIVAS CAMPANHAS
SELECT * FROM organizador
	JOIN campanha ON idOrganizador = fk_organizador;

-- 8 EXIBIR OS DADOS DE UM DETERMINADO ORGANIZADOR E OS DADOS DE SUAS RESPECTIVAS CAMPANHAS 
SELECT * FROM organizador
	JOIN campanha ON idOrganizador = fk_organizador
    WHERE nome = "UEPA";
    
-- 9 EXIBIR OS DADOS DOS ORGANIZADORES NOVATOS E OS DADOS DOS RESPECTIVOS ORGANIZADORES ORIENTADORES
SELECT org.*,ori.* FROM organizador AS org
	JOIN organizador AS ori ON ori.idOrganizador = org.fk_orientador;
    
-- 10 EXIBIR OS DADOS DOS ORGANIZADORES NOVATOS E OS DADOS DOS RESPECTIVOS ORGANIZADORES ORIENTADORES, DE UM SÓ ORIENTADOR
SELECT org.*,ori.* FROM organizador AS org
	JOIN organizador AS ori ON ori.idOrganizador = org.fk_orientador
    WHERE ori.nome = "Globo";
    
-- 11 EXIBIR OS DADOS DOS ORGANIZADORES NOVATOS , OS DADOS DAS RESPECTIVAS CAMPANHAS ORGANIZADAS E OS DADOS DOS RESPECTIVOS ORIENTADORES
SELECT org.*, ori.*, c.* FROM organizador AS org
	JOIN campanha AS c ON idOrganizador = fk_organizador
	JOIN organizador AS ori ON ori.idOrganizador = org.fk_orientador;
    
-- 12 EXIBIR OS DADOS DE UM ORGANIZADOR NOVATO, OS DADOS DAS RESPECTIVAS CAMPANHAS ORGANIZADAS E OS DADOS DOS RESPECTIVOS ORIENTADORES
SELECT org.*, ori.*, c.* FROM organizador AS org
	JOIN campanha AS c ON idOrganizador = fk_organizador
	JOIN organizador AS ori ON ori.idOrganizador = org.fk_orientador
    WHERE org.nome = "APAD";