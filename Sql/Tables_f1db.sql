CREATE TABLE Pais(
	id SERIAL,
	nome VARCHAR(30),

	PRIMARY KEY(id),
	UNIQUE(nome)
)
select * from pais

CREATE TABLE Pista(
	id SERIAL, 
	nome VARCHAR(50) NOT NULL,
	tamanho DECIMAL,
	cidade VARCHAR(20),
	pais INT NOT NULL,
	
	PRIMARY KEY(id),
	FOREIGN KEY (pais) REFERENCES Pais,
	UNIQUE(nome)
)

CREATE TABLE Corrida(
	id SERIAL, 
	nome_evento VARCHAR(60) NOT NULL,
	data_evento DATE NOT NULL,
	pista INT NOT NULL,
	
	PRIMARY KEY(id),
	FOREIGN KEY(pista) REFERENCES Pista
)

CREATE TABLE Piloto(
	id SERIAL, 
	nome VARCHAR(40) NOT NULL, 
	data_de_nascimento Date,
	local_de_nascimento VARCHAR(20),
	
	nacionalidade INT NOT NULL,
	
	PRIMARY KEY(id),
	FOREIGN KEY(nacionalidade) REFERENCES Pais
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
	piloto INT NOT NULL, 
	posicao VARCHAR(5) NOT NULL,
	pontuacao INT NOT NULL,
	corrida INT NOT NULL,
	
	PRIMARY KEY(id),
	FOREIGN KEY(piloto) REFERENCES Piloto,
	FOREIGN KEY(corrida) REFERENCES Corrida
)
