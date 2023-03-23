# Tarefa 1

DROP DATABASE IF EXISTS clinica;
CREATE DATABASE clinica;
USE clinica;

# Tarefa 2

CREATE TABLE ambulatorios (
	nroa int primary key auto_increment,
    andar float not null,
    capacidade int
);

CREATE TABLE medicos (
	codm int primary key auto_increment,
    nome varchar(40) not null,
    idade smallint not null,
    especialidade char(20),
    CPF numeric(11) unique,
    cidade varchar(30),
    nroa int,
    foreign key (nroa) references ambulatorios (nroa)
);

CREATE TABLE pacientes (
	codp int primary key auto_increment,
    nome varchar(40) not null,
    idade smallint not null,
    cidade char(30),
    CPF numeric(11) unique,
    doenca varchar(40) not null
);

CREATE TABLE funcionarios (
	codf int primary key auto_increment,
    nome varchar(40) not null,
    idade smallint,
    CPF numeric(11) unique,
    cidade varchar(30),
    salario float,
    cargo varchar(20)
);

CREATE TABLE consultas (
	codm int,
    codp int,
    cData date,
    hora time,
    foreign key (codm) references medicos (codm),
    foreign key (codp) references pacientes (codp)
);

# Tarefa 3

ALTER TABLE funcionarios ADD COLUMN nroa int;

# Tarefa 4

CREATE UNIQUE INDEX index_CPF ON medicos (CPF);
CREATE INDEX index_nroa ON medicos (nroa);
CREATE INDEX index_doenca ON pacientes (doenca);

# Tarefa 5

DROP INDEX index_doenca ON pacientes;

# Tarefa 6

ALTER TABLE funcionarios DROP COLUMN cargo;
ALTER TABLE funcionarios DROP COLUMN nroa;

# Tarefa de adicionar os elementos

INSERT INTO ambulatorios (andar, capacidade)
VALUES
(1, 30),
(1, 50),
(2, 40),
(2, 25),
(2, 55);

INSERT INTO medicos (nome, idade, especialidade, CPF, cidade, nroa)
VALUES
("Joao", 40, "ortopedia", 10000100000,"Florianopolis", 1),
("Maria", 42, "traumatologia", 10000110000,"Blumenau", 2),
("Pedro", 51, "pediatria", 11000100000,"São José", 2),
("Carlos", 28, "otropedia", 11000110000,"Joinvile", null),
("Marcia", 33, "neurologia", 11000111000,"Biguacu", 3);

INSERT INTO pacientes (nome, idade, cidade, CPF, doenca)
VALUES
("Ana", 20, "Florianopolis", 20000200000, "gripe"),
("Paulo", 24, "Palhoca", 20000220000, "fratura"),
("Lucia", 30, "Biguacu", 22000200000, "tendinite"),
("Carlos", 28, "Joinvile", 11000110000, "sarampo");

INSERT INTO consultas (codm, codp, cData, hora)
VALUES
(1 ,1 , "2006-06-12", "14:00"),
(1 ,4 , "2006-06-12", "10:00"),
(2 ,1 , "2006-06-13", "9:00"),
(2 ,2 , "2006-06-13", "11:00"),
(2 ,3 , "2006-06-14", "14:00"),
(2 ,4 , "2006-06-14", "17:00"),
(3 ,1 , "2006-06-19", "18:00"),
(3 ,3 , "2006-06-12", "10:00"),
(3 ,4 , "2006-06-19", "13:00"),
(4 ,4 , "2006-06-20", "13:00"),
(4 ,4 , "2006-06-22", "19:30");

INSERT INTO funcionarios (nome, idade, cidade, salario, CPF)
VALUES
("Rita",32 ,"Sao Jose",1200 ,20000100000 ),
("Maria",55 ,"Palhoca",1220 ,30000110000 ),
("Caio",45 ,"Florianopolis",1100 ,41000100000 ),
("Carlos",44 ,"Florianopolis",1200 ,51000110000 ),
("Paula",33 ,"Florianopolis",2500 ,61000111000 );

# Tarefa 7

UPDATE pacientes SET cidade = "Ilhota" WHERE codp = 2;
# a)
UPDATE consultas SET hora = "12:00", cData = "2006-07-04" WHERE codm = 1 and codp = 4;
# b)
UPDATE pacientes SET idade = idade+1, doenca = "cancer" WHERE codp = 1;
# c)
UPDATE consultas SET hora = ADDTIME(hora, "01:30:00") WHERE codm = 3 and codp = 4;
# d)
DELETE FROM funcionarios WHERE codf = 4;
# e)
DELETE FROM consultas WHERE hora BETWEEN "19:00" and "23:59";
# f)
DELETE FROM consultas WHERE codp = (SELECT codp FROM pacientes WHERE doenca = "cancer" or idade < 10);
DELETE FROM pacientes WHERE doenca = "cancer" or idade < 10;
# g)
DELETE FROM medicos WHERE cidade = "Biguacu" or cidade = "Palhoca";

# Tarefa 8

SELECT codp, nome FROM pacientes WHERE idade > 25 and (doenca = "tendinite" or
														doenca = "fratura" or
                                                        doenca = "gripe" or
                                                        doenca = "sarampo");
                                                        
# Tarefa 9

SELECT MAX(salario) as maior_salario, MIN(salario) as menor_salario FROM funcionarios;

# Tarefa 10

SELECT AVG(salario) FROM funcionarios WHERE cidade = "Florianopolis";

# Tarefa 11

SELECT SUM(salario) as Gastos, COUNT(codf) as qnt_funcionarios FROM funcionarios;

# Tarefa 12

SELECT AVG(idade) as media_idades, COUNT(distinct nroa) as nmro_ambulatorios FROM medicos;

# Tarefa 13 | a)

SELECT m.nome, m.CPF FROM medicos as m
				 INNER JOIN pacientes as p
                 ON m.CPF = p.CPF;
                 
# b)

SELECT m.codm as Codigo_medico, m.nome as Nome_medico, 
	   f.codf as Codigo_funcionario, f.nome as Nome_funcionario 
       FROM medicos as m
	   INNER JOIN funcionarios as f
	   ON m.cidade = f.cidade;
       
# c)

SELECT p.codp as Codigo_paciente, p.nome as Nome_paciente
	   FROM pacientes as p
       INNER JOIN consultas as c
       ON p.codp = c.codp AND hora BETWEEN "14:00" and "23:59";

































