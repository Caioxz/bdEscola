CREATE DATABASE bdEscolaIdiomas0
GO

USE	bdEscolaIdiomas0

CREATE TABLE tbCurso (
idCurso INT PRIMARY KEY IDENTITY (1,1)
,nomeCurso VARCHAR (30) NOT NULL
,cargahorariaCurso SMALLINT NOT NULL
,valorCurso SMALLMONEY NOT NULL
)

CREATE TABLE tbAluno(
idAluno INT PRIMARY KEY IDENTITY (1,1)
,nomeAluno VARCHAR (30) NOT NULL
,dataNascAluno DATETIME NOT NULL
,naturalidadeAluno VARCHAR(30) NOT NULL  
,rgAluno VARCHAR (15) NOT NULL

)
 
CREATE TABLE tbTurma( 
idTurma INT PRIMARY KEY IDENTITY (1,1)
,nomeTurma VARCHAR (4) NOT NULL
,horarioTurma TIME NOT NULL
,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
)

CREATE TABLE tbMatricula (
idMatricula INT PRIMARY KEY IDENTITY (1,1)
,dataMatricula DATE NOT NULL
,idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
,idTurma INT FOREIGN KEY REFERENCES tbTurma (idTurma)
)


