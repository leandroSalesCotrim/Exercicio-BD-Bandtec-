-- 1 E 2 CRIAR BANCO E FAZER TABELAS DE ACORDO COM A MODELAGEM
CREATE DATABASE AC3_Filme;
DROP DATABASE AC3_Filme;
USE AC3_Filme;

CREATE TABLE Diretor(
	idDiretor INT PRIMARY KEY AUTO_INCREMENT,
    nomeDiretor VARCHAR(45),
	paisDiretor VARCHAR(45)
);
CREATE TABLE Ator(
	idAtor INT PRIMARY KEY AUTO_INCREMENT,
    nomeAtor VARCHAR(45),
	dataNasc DATE
)AUTO_INCREMENT = 100;

CREATE TABLE Filme(
	idFilme INT PRIMARY KEY AUTO_INCREMENT,
    nomeFilme VARCHAR(45),
	generoFilme VARCHAR(45),
    fkDiretor INT,
    FOREIGN KEY (fkDiretor) REFERENCES Diretor(idDiretor)
)AUTO_INCREMENT = 1000;

CREATE TABLE PapelAtor(
	nomePapel VARCHAR(45),
	fkAtor INT,
    fkFilme INT,
    cacheAtor DOUBLE,
    PRIMARY KEY (fkAtor,fkFilme),
	FOREIGN KEY (fkAtor) REFERENCES Ator(idAtor),
    FOREIGN KEY (fkFilme) REFERENCES Filme(idFilme)
);

-- 3 INSERIR DADOS NO BANCO DE FORMA QUE TENHA NO MINIMO UM DIRETOR COM MAIS DE 1 FILME E UM ATOR QUE TENHA ATUADO EM MAIS DE 1 FILME
INSERT INTO Diretor(nomeDiretor, paisDiretor) 
	VALUES ('Sam Raimi','Estados Unidos');
    
INSERT INTO Ator(nomeAtor, dataNasc) 
	VALUES ('Tobey Maguire','1975-06-27'),
    ('Willem Dafoe','1955-07-22'),
    ('Alfred Molina','1955-05-24');
    
INSERT INTO filme(nomeFilme, generoFilme,fkDiretor) 
	VALUES ('Homem-Aranha','Super-Heroi',1),
	('Homem-Aranha 2','Super-Heroi',1);

INSERT INTO PapelAtor(nomePapel,fkAtor, fkFilme,cacheAtor) 
	VALUES ('Peter Parker',100,1000,9020530),
    ('Peter Parker',100,1001,7920130),
    ('Norman Osborn',101,1000,5003200),
    ('Dr.octpus',102,1001,7200880);     
    
-- 4 ACERTO DE CHAVE ESTRANGERIA JÁ FEITO
 
-- 5 EXIBIR TODOS OS DADOS DAS TABELAS DE FORMA SEPARADA
SELECT * FROM Diretor;
SELECT * FROM Ator;
SELECT * FROM Filme;
SELECT * FROM PapelAtor;

-- 6 EXIBIR OS DADOS DOS DIRETORES E SEUS FILMES
SELECT nomeDiretor,nomeFilme FROM Diretor
	JOIN Filme ON fkDiretor = idDiretor; 
    
-- 7 EXIBIR OS DADOS DE UM DETERMINADO DIRETOR E SEUS FILMES
SELECT nomeDiretor,nomeFilme FROM Diretor
	JOIN Filme ON fkDiretor = idDiretor
    WHERE NomeDiretor = "Sam Raimi";
    
-- 8 EXIBIR A MEDIA E SOMA DO CACHE DOS ATORES, DE FORMA GERAL
SELECT AVG(cacheAtor), SUM(cacheAtor) FROM PapelAtor;
 
-- 9 EXIBIR O CACHE MINIMO E MAXIMO DOS PAPEIS DOS ATORES, DE FORMA GERAL
SELECT MIN(cacheAtor), MAX(cacheAtor) FROM PapelAtor;

-- 10 EXIBIR OS DADOS DOS FILMES, SEUS ATORES, SEUS RESPECTIVOS PAPEIS E O VALOR DO CACHE   
SELECT F.*,A.*,P.* FROM Filme AS F
	JOIN PapelAtor AS P ON idFilme = fkFilme
	JOIN Ator AS A ON idAtor = fkAtor;
    
-- 11 EXIBIR OS DADOS DE UM DETERMINADO FILME E SEUS ATORES, SEUS RESPECTIVOS PAPEIS E O VALOR DO CACHE   
SELECT F.*,A.*,P.* FROM Filme AS F
	JOIN PapelAtor AS P ON idFilme = fkFilme
	JOIN Ator AS A ON idAtor = fkAtor
    WHERE nomeFilme = 'Homem-Aranha 2';

-- 12 EXIBIR OS DADOS DOS FILMES, DIRETORES, ATORES, SEUS RESPECTIVOS PAPEIS E O VALOR DO CACHE
SELECT F.*,D.nomeDiretor,D.paisDiretor,A.*,P.nomePapel,P.cacheAtor FROM Filme AS F
	JOIN Diretor AS D ON idDiretor = fkDiretor
    JOIN PapelAtor AS P ON idFilme = fkFilme
	JOIN Ator AS A ON idAtor = fkAtor;
    
-- 13 EXIBIR A IDENTIFICAÇÃO DO FILME (ID OU NOME), A MÉDIA E A SOMA DOS VALORES GANHO PELOS ATORES, AGRUPADAS POR FILME
SELECT nomeFilme, TRUNCATE(AVG(cacheAtor), 2), SUM(cacheAtor) FROM Filme
	JOIN PapelAtor ON idFilme = fkFilme  GROUP BY nomeFilme;

-- 14 EXIBIR A IDENTIFICAÇÃO DO ATOR (ID OU NOME), A MÉDIA E A SOMA DOS VALORES GANHO PELOS ATORES, AGRUPADAS POR ATOR
SELECT nomeAtor, TRUNCATE(AVG(cacheAtor), 2) AS 'Media Cache', SUM(cacheAtor) AS 'Soma Cache' FROM Ator
	JOIN PapelAtor ON idAtor = fkAtor  GROUP BY nomeAtor;
 
-- 15 EXIBIR A IDENTIFICAÇÃO DO FILME (ID OU NOME), O MENOR E MAIOR CACHE DOS ATORES, AGRUPADAS POR FILME
SELECT nomeFilme, MIN(cacheAtor) AS 'Menor Cache', MAX(cacheAtor) AS 'Maior Cache' FROM Filme
	JOIN PapelAtor ON idFilme = fkFilme  GROUP BY nomeFilme;
    
-- 16 EXIBIR A IDENTIFICAÇÃO DO ATOR (ID OU NOME), O MENOR E MAIOR CACHE DOS ATORES, AGRUPADAS POR ATOR
SELECT nomeAtor, MIN(cacheAtor) AS 'Menor Cache', MAX(cacheAtor) AS 'Maior Cache' FROM Ator
	JOIN PapelAtor ON idAtor = fkAtor  GROUP BY nomeAtor;    