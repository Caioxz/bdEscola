USE bdEscolaIdiomas0



--1) Apresentar os nomes dos alunos ao ladodo nome dos cursos que eles fazem
SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
		INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
		INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso

--2) Apresentar aquantidade de alunos matriculados por nome do curso
SELECT COUNT(tbAluno.idAluno)AS 'Quantidade Alunos', nomeCurso FROM tbAluno
			INNER JOIN tbMatricula ON tbAluno.idALuno = tbMatricula.idAluno
				INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
					INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
						GROUP BY nomeCurso

--3) Apresentar a quantidade de alunos matriculados por nome da turma
SELECT COUNT(tbAluno.idAluno) AS 'Quantidades de Alunos Matriculados',nomeTurma FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idMatricula
		INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
			GROUP BY nomeTurma

--4)  Apresentar aquantidade de alunos que fizeram matricula em maio de 2016
SELECT COUNT (idAluno) nomeAluno  FROM tbMatricula
	WHERE MONTH (dataMatricula) = 5 AND YEAR (dataMatricula) = 2016
	
		


--5)Apresentar o nome dos alunos em ordema lfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados
SELECT tbAluno.nomeAluno AS 'Aluno', nomeTurma AS 'Nome Turma', nomeCurso AS 'Nome Curso' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
		INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
			INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
				ORDER BY nomeAluno



--6)Apresentar o nome dos cursos e os horários em que eles são oferecidos
SELECT tbCurso.nomeCurso, tbTurma.HorarioTurma FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.idCurso = tbTurma.idCurso

--7) Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT tbAluno.naturalidadeAluno, COUNT(DISTINCT tbMatricula.idAluno) as QuantidadeAlunos
FROM tbMatricula
INNER JOIN tbAluno ON tbMatricula.idAluno = tbAluno.idAluno
INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
WHERE tbCurso.nomeCurso = 'Inglês'
GROUP BY tbAluno.naturalidadeAluno;

--8)
SELECT tbAluno.nomeAluno, CONVERT(varchar, tbMatricula.dataMatricula, 103) AS dataMatricula
FROM tbAluno 
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno;

--9)
SELECT tbAluno.nomeAluno, tbCurso.nomeCurso 
FROM tbAluno 
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno 
INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma 
INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso 
WHERE tbCurso.nomeCurso = 'Inglês' AND tbAluno.nomeAluno LIKE 'A%';

--10)
SELECT COUNT(*) AS qtdMatriculas 
FROM tbMatricula 
WHERE YEAR(tbMatricula.dataMatricula) = 2016;

--11)
SELECT tbCurso.nomeCurso, COUNT(*) AS qtdMatriculas 
FROM tbCurso 
INNER JOIN tbTurma ON tbCurso.idCurso = tbTurma.idCurso 
INNER JOIN tbMatricula ON tbTurma.idTurma = tbMatricula.idTurma 
GROUP BY tbCurso.nomeCurso;

--12)
SELECT COUNT(DISTINCT tbMatricula.idAluno) AS qtdAlunos 
FROM tbMatricula 
INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma 
INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso 
WHERE tbCurso.valorCurso > 300.00;

--13)SELECT tbAluno.nomeAluno 
SELECT tbAluno.nomeAluno 
FROM tbAluno 
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno 
INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma 
INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso 
WHERE tbCurso.nomeCurso = 'Alemão';