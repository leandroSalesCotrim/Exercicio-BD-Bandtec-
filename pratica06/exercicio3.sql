-- 1 2 e 3 CRIAR BANCO, USAR E CRIAR TABELAS
CREATE DATABASE restaurante;

USE restaurante;

CREATE TABLE restaurante(
	idRestaurante INT PRIMARY KEY AUTO_INCREMENT,
    nomeRestaurante VARCHAR (45),
    bairro VARCHAR(45),
    especialidade VARCHAR(45)
)AUTO_INCREMENT=1000;

CREATE TABLE cozinheiro(
	idCozinheiro INT PRIMARY KEY AUTO_INCREMENT,
    nomeCozinheiro VARCHAR(45),
    telCozinheiro CHAR(11),
    dataNasCozinheiro DATE,
    fk_restaurante INT,
    fk_orientador INT,
    FOREIGN KEY (fk_restaurante) REFERENCES restaurante (idRestaurante),
    FOREIGN KEY (fk_orientador) REFERENCES cozinheiro (idCozinheiro)
)AUTO_INCREMENT = 10;

-- 4 INSERIR DADOS NAS TABELAS, DE FORMA QUE EXISTA MAIS DE UM COZINHEIRO PARA ALGUM RESTAURANTE
-- E MAIS DE UM COZINHEIRO SENDO ORIENTADO POR ALGUM COZINHEIRO MAIS EXPERIENTE
INSERT INTO restaurante(nomeRestaurante,bairro,especialidade) 
	VALUES("Ratatouille","Itaim Paulista","Comida italiana");
    
INSERT INTO cozinheiro(nomeCozinheiro,telCozinheiro,dataNasCozinheiro,fk_restaurante,fk_orientador) 
	VALUES("Remy","12345678901","2001-10-13",1000,null),
    ("Anton Ego","01987654321","1995-01-23",1000,null),
    ("Horst","67890112345","1988-12-13",1000,11),
    ("Skinner","12678901345","1969-02-22",1000,10),
    ("Colette Tatou","67812345901","1991-06-15",1000,11),
    ("Linguini","12390145678","1990-02-02",1000,10);    

-- 5 EXIBIR TODOS OS DADOS DE CADA TABELA CRIADA, SEPARADAMENTE
SELECT * FROM cozinheiro;
SELECT * FROM restaurante;

-- 6 FAZER OS ACERTOS DE CHAVE ESTRANGEIRA (JÁ FEITO)

-- 7 EXIBIR OS DADOS DOS RESTAURANTES E OS DADOS DE SEUS DE SEUS RESPECTIVOS COZINHEIROS
SELECT * FROM restaurante 
	JOIN cozinheiro ON idRestaurante = fk_restaurante;

-- 8 EXIBIR OS DADOS DE UM DETERMINADO RESTAURANTE E OS DADOS DE SEUS RESPECTIVOS COZINHEIROS 
SELECT * FROM restaurante 
	JOIN cozinheiro ON idRestaurante = fk_restaurante
	WHERE nomeRestaurante = "Ratatouille";
    
-- 9 EXIBIR OS DADOS DOS COZINHEIROS E OS DADOS DOS RESPECTIVOS ORIENTADORES
SELECT c.*,o.nomeCozinheiro AS "Orientador"  FROM cozinheiro AS c 
	LEFT JOIN cozinheiro AS o ON c.fk_orientador = o.idCozinheiro;
    
-- 10 EXIBIR OS DADOS DOS COZINHEIROS E OS DADOS DO RESPECTIVO ORIENTADOR, DE UM DETERMINADO ORIENTADOR
SELECT c.*,o.nomeCozinheiro AS "Orientador"  FROM cozinheiro AS c 
	JOIN cozinheiro AS o ON c.fk_orientador = o.idCozinheiro
    WHERE o.nomeCozinheiro = "Remy";
    
-- 11 EXIBIR OS DADOS DOS COZINHEIROS, OS DADOS DO RESPECTIVO RESTAURANTE E OS DADOS DOS RESPECTIVOS ORIENTADORES
SELECT c.*,r.*,o.nomeCozinheiro AS "Orientador"  FROM cozinheiro AS c 
	LEFT JOIN restaurante AS r ON idRestaurante = fk_restaurante
	LEFT JOIN cozinheiro AS o ON c.fk_orientador = o.idCozinheiro;
    
-- 12 EXIBIR OS DADOS DE UM COZINHEIRO DETERMINADO, OS DADOS DO RESPECTIVO RESTAURANTE E ORIENTADOR
SELECT c.*,o.nomeCozinheiro AS "Orientador"  FROM cozinheiro AS c 
	LEFT JOIN cozinheiro AS o ON c.fk_orientador = o.idCozinheiro
    WHERE c.nomeCozinheiro = "Remy";