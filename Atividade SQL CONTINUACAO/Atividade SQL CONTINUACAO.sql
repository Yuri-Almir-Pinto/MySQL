/*Retirar se já tiver alguma database pra usar pra ver as questões.*/
CREATE DATABASE db_tarefa;
USE db_tarefa;
/**/
CREATE TABLE tb_banco (
	Codigo integer primary key not null,
    Nome varchar(30) not null unique
);
CREATE TABLE tb_agencia (
	Numero_Agencia integer primary key not null auto_increment,
    Endereco varchar(40) not null,
    Cod_banco integer not null,
    foreign key (Cod_banco) references tb_banco (Codigo)
);
CREATE TABLE tb_conta (
	Numero_conta char(7) not null primary key,
    Num_agencia integer not null,
    Saldo decimal(10,2) not null,
    Tipo_conta integer not null,
    foreign key (Num_agencia) references tb_agencia (Numero_Agencia)
);
CREATE TABLE tb_cliente (
	Cpf char(14) not null primary key,
    Nome varchar(40) not null,
    Sexo char not null,
    Endereco varchar(40) not null
);
CREATE TABLE tb_historico (
	Cpf_cliente char(14) not null,
    Numero_conta char(7) not null,
    Data_inicio date not null,
    foreign key (Cpf_cliente) references tb_cliente (Cpf),
    foreign key (Numero_conta) references tb_conta (Numero_conta)
);
CREATE TABLE tb_telefone_cliente (
	Cpf_cli char(14) not null,
    Telefone_cli char(9) primary key,
    foreign key (Cpf_cli) references tb_Cliente (Cpf)
);

INSERT INTO tb_banco
VALUES (1, "Banco do Brasil"), (4, "CEF");

INSERT INTO tb_agencia (Numero_Agencia, Endereco, Cod_banco)
VALUES
(0562, "Rua Joaquim Teixeira Alves, 1555", 4),
(3153, "Av. Marcelino Pires, 1960", 1);

INSERT INTO tb_cliente (Cpf, Nome, Sexo, Endereco)
VALUES
("111.222.333-44", "Jennifer B Souza", "F", "Rua Cuiabá, 1050"),
("666.777.888-99", "Caetano K Lima", "M", "Rua Ivinhema, 879"),
("555.444.777-33", "Silvia Macedo", "F", "Rua Estados Unidos, 735");

INSERT INTO tb_conta (Numero_conta, Num_agencia, Saldo, Tipo_conta)
VALUES
("86340-2", 3153, 763.05, 2),
("23584-7", 0562, 3879.12, 1);

INSERT INTO tb_historico (Cpf_cliente, Numero_conta, Data_inicio)
VALUES
("111.222.333-44", "23584-7", "1997-12-17"),
("666.777.888-99", "23584-7", "1997-12-17"),
("555.444.777-33", "86340-2", "2010-11-29");

INSERT INTO tb_telefone_cliente (Cpf_cli, Telefone_cli)
VALUES
("111.222.333-44", "3422-7788"),
("666.777.888-99", "3423-9900"),
("666.777.888-99", "8121-8833");

ALTER TABLE tb_cliente ADD COLUMN email varchar(255) null;

DELETE FROM tb_historico WHERE Numero_conta = '86340-2';
DELETE FROM tb_conta WHERE Numero_conta = '86340-2';
/*a) Alterar o campo CEF da tabela Banco para Caixa Economica Federal.*/
UPDATE tb_banco SET Nome = 'Caixa Economica Federal' WHERE Codigo = 4;
/*b) Atualizar o endereço da Silvia para: Rua XV de Novembro, n 852.*/
UPDATE tb_cliente SET Endereco = 'Rua XV de Novembro, n 852' WHERE Cpf = '555.444.777-33';
/*c) Atualizar todos o numeros de telefone (45)999236356; (45)991235689; (45)998784512.
(PS: No esquema da ultima tarefa que se passou, não havia char para o número de área, então
eu não coloquei)*/
UPDATE tb_telefone_cliente SET Telefone_cli = '999236356' WHERE Cpf_cli = '111.222.333-44';
UPDATE tb_telefone_cliente SET Telefone_cli = '991235689' WHERE Cpf_cli = '666.777.888-99' AND Telefone_cli = '3423-9900';
UPDATE tb_telefone_cliente SET Telefone_cli = '998784512' WHERE Cpf_cli = '666.777.888-99' AND Telefone_cli = '8121-8833';
/*d) Atualizar a tabela de histórico com novas datas: 12/11/2022; 15/10/2022; 06/12/2022.*/
UPDATE tb_historico SET Data_inicio = '2022-12-11' WHERE Cpf_cliente = '111.222.333-44';
UPDATE tb_historico SET Data_inicio = '2022-10-15' WHERE Cpf_cliente = '666.777.888-99';
/*e) Delete o cliente Caetano e informe o que acontece.
DELETE FROM tb_cliente WHERE Cpf = '666.777.888-99';
/*Resposta questão: Não é possível deletar ou atualizar a linha pai, devido a existência
de uma chave estrangeira que depende desses dados.

PS: EU COMENTEI, PORQUE SE EU NÃO O FIZER, OBVIAMENTE DA ERRO E NÃO CONTINUA A EXECUTAR*/

/*f) Adicione na tabela de cliente os campos: email, data de nascimento e nome da mãe. 
Realize as inserções conforme as alterações.
ALTER TABLE tb_cliente ADD COLUMN email varchar(255) null; (Feito anteriormente)*/
ALTER TABLE tb_cliente ADD COLUMN DataDeNascimento date not null;
ALTER TABLE tb_cliente ADD COLUMN nomeMãe varchar(30) not null;
UPDATE tb_cliente SET email = 'Jennifer@gmail.com',
					DataDeNascimento = '1995-5-24',
					nomeMãe = 'Emilie Souza'
                    WHERE Cpf = '111.222.333-44';
UPDATE tb_cliente SET email = 'Silvia@gmail.com',
					DataDeNascimento = '2001-12-21',
					nomeMãe = 'Camila Macedo'
                    WHERE Cpf = '555.444.777-33';
UPDATE tb_cliente SET email = 'Caetano@gmail.com',
					DataDeNascimento = '1990-1-10',
					nomeMãe = 'Marcela Lima'
                    WHERE Cpf = '666.777.888-99';
/*g)Crie uma tabela para as movimentações da conta de entrada e saída do cliente e realize as 
adaptações necessárias.*/
CREATE TABLE tb_saidas (
	idMovimentacaoSaida integer primary key not null auto_increment,
	Numero_conta char(7) not null,
    Saida decimal(10,2) not null,
    DataMovimentacaoSaida datetime not null,
    foreign key (Numero_conta) references tb_conta (Numero_conta)
);
CREATE TABLE tb_entradas (
	idMovimentacaoEntrada integer primary key not null auto_increment,
	Numero_conta char(7) not null,
    Entrada decimal(10,2) not null,
    DataMovimentacaoEntrada datetime not null,
    foreign key (Numero_conta) references tb_conta (Numero_conta)
);

/*h)Selecionar todos os dados de cliente que tem histórico do dia 01 de Dezembro de 2022 
até dia 30/12/2022.*/
SELECT c.Cpf, c.Nome, c.Sexo, c.Endereco, c.email, c.DataDeNascimento, c.nomeMãe
		FROM tb_cliente AS c, tb_historico AS h
        WHERE (c.Cpf = h.Cpf_cliente) AND h.Data_inicio BETWEEN '2022-12-01' and '2022-12-31';