CREATE TABLE Pais(
	id SERIAL,
	nome VARCHAR(20),

	PRIMARY KEY(id)
)

--Numeros reais podem ser DECIMAL, DOUBLE PRECISION, REAL, e etc

CREATE TABLE Pista(
	id SERIAL, 
	nome VARCHAR(15) NOT NULL,
	tamanho DECIMAL,
	cidade VARCHAR(20),
	pais INT NOT NULL,
	
	PRIMARY KEY(id),
	FOREIGN KEY (pais) REFERENCES Pais
)

CREATE TABLE Corrida(
	id SERIAL, 
	nome_evento VARCHAR(40) NOT NULL,
	data_evento DATE NOT NULL,
	pista INT NOT NULL,
	
	FOREIGN KEY(pista) REFERENCES Pista
)

CREATE TABLE Piloto(
	id SERIAL, 
	nome VARCHAR(40) NOT NULL, 
	idade INT,
	pais INT NOT NULL,
	
	PRIMARY KEY(id),
	FOREIGN KEY(pais) REFERENCES Pais
)

CREATE TABLE Equipe(
	id SERIAL, 
	nome VARCHAR(40),
	sede VARCHAR(30),
	pais INT,
	
	PRIMARY KEY(id),
	FOREIGN KEY(pais) REFERENCES Pais
)

CREATE TABLE Contratos(
	piloto INT,
	equipe INT, 
	data_inicio DATE NOT NULL,
	data_termino DATE,
	
	FOREIGN KEY(piloto) REFERENCES Piloto,
	FOREIGN KEY(equipe) REFERENCES Equipe
)

CREATE TABLE Classificacao(
	id SERIAL,
	piloto INT,
	posicao INT NOT NULL,
	pontuacao INT NOT NULL,
	
	CHECK(posicao BETWEEN 1 AND 20),
	PRIMARY KEY(id),
	FOREIGN KEY(piloto) REFERENCES Piloto
)

