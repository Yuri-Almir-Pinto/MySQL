 
create database db_livraria;
USE db_livraria;

Create Table Tb_Bairro   (Bai_Codigo integer Not Null Primary Key,
                          Bai_Descricao varchar(30) Not Null);

Create Table Tb_Cidade   (Cid_Codigo integer Not Null Primary Key,
                          Cid_Descricao varchar(30) Not Null);

Create Table Tb_Endereco (End_Codigo integer Not Null Primary Key,
                          End_Descricao varchar(30) Not Null);

Create Table Tb_Cargo    (Car_Codigo integer Not Null Primary Key,
                          Car_Descricao varchar(25) Not Null,
                          Car_Salariobase integer Not Null);

Create Table Tb_Funcionario (Fun_Codigo integer Not Null Primary Key,
                             Fun_Nome varchar(30) Not Null,
                             Fun_Rg  varchar(14) Not Null,
                             Fun_Cpf varchar(14) Not Null,
	                       Fun_Codcargo integer    Not Null References Tb_Cargo(Car_Codigo),
                             Fun_Codendereco integer Not Null References Tb_Endereco(End_Codigo),
                             Fun_Codbairro   integer Not Null References Tb_Bairro(Bai_Codigo),
                             Fun_Codcidade   integer Not Null References Tb_Cidade(Cid_Codigo));


Create Table Tb_Editora (Edi_Codigo integer Not Null Primary Key,
                         Edi_Nome varchar(23) Not Null,
                         Edi_Codendereco integer Not Null References Tb_Endereco(End_Codigo),
                         Edi_Codcidade   integer Not Null References Tb_Cidade(Cid_Codigo), 
                         Edi_Codbairro   integer Not Null References Tb_Bairro(Bai_Codigo),
                         Edi_Fone varchar(12) Not Null,
                         Edi_Contato varchar(10) );


Create Table Tb_Cliente (Cli_Codigo integer Not Null Primary Key, 
                         Cli_Nome varchar(30) Not Null,
                         Cli_Rg   varchar(14) Not Null,
                         Cli_Codendereco integer Not Null References Tb_Endereco(End_Codigo),
                         Cli_Numero varchar(5),
                         Cli_Codbairro integer Not Null References Tb_Bairro(Bai_Codigo),
                         Cli_Codcidade integer Not Null References Tb_Cidade(Cid_Codigo),
                         Cli_Fone  varchar(12) Not Null,
                         Cli_Prazodevol integer Not Null, 
                         Cli_Cpf  varchar(14));


Create Table Tb_Categoria (Cat_Codigo integer Not Null Primary Key,
                           Cat_Descricao varchar(20));

Create Table Tb_Livro (Liv_Codigo Integer Not Null Primary Key,
                       Liv_Titulo varchar(150) Not Null,
                       Liv_Codeditora integer Not Null References Tb_Editora (Edi_Codigo),
                       Liv_Codcategoria integer Not Null References Tb_Categoria(Cat_Codigo),
                       Liv_Edicao varchar(15) Not Null,
                       Liv_Ano    integer Not Null,
                       Liv_Prazominimo varchar(15));


Create Table Tb_Autor (Aut_Codigo integer Not Null Primary Key,
                       Aut_Nome varchar(45) Not Null);


Create Table Tb_Autorlivro 
                      (Autliv_Codautor integer Not Null References Tb_Autor(Aut_Codigo),
                      Autliv_Codlivro integer Not Null References Tb_Livro(Liv_Codigo),
	         Autliv_Principal varchar(3) Not Null,
Primary Key(Autliv_Codautor, Autliv_Codlivro));


Create Table Tb_Reserva  (Res_Codigo integer Not Null Primary Key,
                          Res_Data Date Not Null,
                          Res_Codlivro integer Not Null References Tb_Livro(Liv_Codigo),
                          Res_Codfunc integer Not Null References Tb_Funcionario(Fun_Codigo),
                          Res_Codcliente integer Not Null References Tb_Cliente(Cli_Codigo),
                          Res_Situacao varchar(10) ); 


Create Table Tb_Exemplar (Exe_Codigo integer Not Null Primary Key, 
                          Exe_Codlivro integer Not Null References Tb_Livro(Liv_Codigo),
                          Exe_Status varchar(10) Not Null);


Create Table Tb_Emprestimo (Emp_Codigo integer Not Null Primary Key,
                            Emp_Data  Date Not Null,
                            Emp_Codcliente integer Not Null References Tb_Cliente(Cli_Codigo),
                            Emp_Codfuncionario integer Not Null References Tb_Funcionario(Fun_Codigo) );


Create Table Tb_Exemplaremprestimo(
	Exepre_Codexemplar	integer	Not Null References Tb_Exemplar(Exe_Codigo),
	Exepre_Codemprestimo	integer	Not Null References Tb_Emprestimo(Emp_Codigo),
	Exepre_Dtprevdev Date Not Null,
	Exepre_Dtdevmul Date,
	Exepre_Dtpgmul Date,
	Exepre_Codreserva integer References Tb_Reserva(Res_Codigo),
      Exepre_Valormulta integer Not Null,
	Primary Key(Exepre_Codexemplar, Exepre_Codemprestimo)
	);



Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (1,'Centro');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (2,'Cidade Alta');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (3,'Ipê');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (4,'Belo Horizonte');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (5,'Itaipu');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (6,'Bnh');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (7,'Jardim Das Laranjeiras');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (8,'Parque Independência');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (9,'Nazaré');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (10,'São Cristovão');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (11,'Vila Borges');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (12,'Vila Iolanda');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (13,'Jardim São Paulo');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (14,'Jardim Jupira');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (15,'Três Lagoas');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (16,'Morumbi I');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (17,'Vila Portes');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (18,'Jardim Petrópolis');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (19,'Porto Da Madeira');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (20,'Casa Amarela');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (21,'Boa Viagem');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (22,'Campo Grande');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (23,'Encruzilhada');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (24,'Arruda');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (25,'Aflitos');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (26,'Batel');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (27,'Leblon');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (28,'Copacabana');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (29,'Rio Doce');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (30,'Interlagos');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (31,'Tietê');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (32,'Jardim São Paulo');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (33,'Jardim Atlântico');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (34,'Umburá');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (35,'Frimesa');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (36,'Porto');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (37,'Bessa');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (38,'Pelorinho');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (39,'Casa Forte');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (40,'Parnamirim');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (41,'João De Barros');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (42,'Cais Do Apolo');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (43,'Flor Da Serra');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (44,'Jardinópolis');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (45,'Lapa');
	
Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (46,'Boa Vista');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (47,'Jardim Das Ações');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (48,'Vila Brasília');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (49,'Parque Presidente');

Insert Into Tb_Bairro (Bai_Codigo,Bai_Descricao)
   Values (50,'Jardim Cláudia');


Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (1,'Foz Do Iguaçu');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (2,'Assis Chateubriand');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (3,'Capitão Leonidas Marques');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (4,'Cascavel');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (5,'Catanduvas');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (6,'Céu Azul');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (7,'Corbélia');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (8,'Guaraniaçu');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (9,'Itaipulândia');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (10,'Marechal Cândido Rondon');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (11,'Matelândia');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (12,'Medianeira');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (13,'Palotina');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (14,'Pato Bragado');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (15,'Quedas Do Iguaçu');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (16,'Ramilândia');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (17,'Santa Helena');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (18,'Santa Terezinha De Itaipu');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (19,'São Miguel Do Iguaçu');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (20,'Serranópolis Do Iguaçu');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (21,'Toledo');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (22,'Vera Cruz');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (23,'Maringá');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (24,'Londrina');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (25,'Curitiba');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (26,'Ponta Grossa');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (27,'Cafelândia');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (28,'Missal');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (29,'Cianorte');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (30,'Cornélio Procópio');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (31,'Quatro Pontes');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (32,'Ouro Verde Do Oeste');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (33,'Diamante Do Oeste');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (34,'Catanduvas');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (35,'Terra Roxa');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (36,'Pato Branco');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (37,'Francisco Beltrão');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (38,'Palmas');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (39,'Capanema');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (40,'Recife');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (41,'Florianópolis');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (42,'Porto Alegre');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (43,'São Paulo');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (44,'Rio De Janeiro');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (45,'Itajaí');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (46,'Joinvile');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (47,'Olinda');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (48,'Salvador');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (49,'João Pessoa');

Insert Into Tb_Cidade (Cid_Codigo,Cid_Descricao)
   Values (50,'Vitória');


Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (1,'Rua Paraná');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (2,'Rua Argentina');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (3,'Rua Alagoas');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (4,'Avenida Brasil');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (5,'Rua Rio De Janeiro');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (6,'Avenida João Xxiii');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (7,'Avenida Pedro Soccol');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (8,'Avenida José Calegari');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (9,'Rua Minas Gerais');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (10,'Rua Rio Grande Do Norte');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (11,'Avenida Lagoa Vermelha');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (12,'Avenida Soledade');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (13,'Rua Paraguai');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (14,'Rua Santa Catarina');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (15,'Rua Acre');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (16,'Rua Bahia');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (17,'Rua Pernambuco');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (18,'Rua Amapá');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (19,'Rua Cerejeira');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (20,'Rua Karol Woityla');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (21,'Rua Mato Grosso');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (22,'Rua Piauí');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (23,'Avenida República Argentina');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (24,'Avenida Das Cataratas');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (25,'Avenida Juscelino Kubitscheck');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (26,'Avenida Jorge Schimmelpfeng');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (27,'Avenida Beberibe');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (28,'Rua Presidente Kennedy');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (29,'Rua Castro Alves');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (30,'Rua Carlos Gomes');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (31,'Rua Curitiba');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (32,'Rua Olavo Bilac');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (33,'Rua Rio Grande Do Sul');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (34,'Rua Recife');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (35,'Rua 7 De Setembro');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (36,'Avenida Tancredo Neves');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (37,'Rua Londrina');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (38,'Rua General Ozório');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (39,'Rua Manaus');

Insert Into Tb_Endereco (End_Codigo,End_Descricao)
   Values (40,'Rua Getúlio Vargas');

insert into tb_endereco (end_codigo,end_descricao)
   values (41,'Rua Vitória');

insert into tb_endereco (end_codigo,end_descricao)
   values (42,'Avenida Padre Calegaro');

insert into tb_endereco (end_codigo,end_descricao)
   values (43,'Avenida Dom Geraldo Sigaud');

insert into tb_endereco (end_codigo,end_descricao)
   values (44,'Rua Goiás');

insert into tb_endereco (end_codigo,end_descricao)
   values (45,'Avenida Castelo Branco');

insert into tb_endereco (end_codigo,end_descricao)
   values (46,'Avenida Boa Viagem');

insert into tb_endereco (end_codigo,end_descricao)
   values (47,'Avenida Santos Dumont');

insert into tb_endereco (end_codigo,end_descricao)
   values (48,'Rua Salgado Filho');

insert into tb_endereco (end_codigo,end_descricao)
   values (49,'Rua São Sebastião');

insert into tb_endereco (end_codigo,end_descricao)
   values (50,'Rua do Príncipe');

Insert Into Tb_Cargo(Car_Codigo, Car_Descricao, Car_Salariobase) 
Values(1, 'Bibliotecario', 1000);

Insert Into Tb_Cargo(Car_Codigo, Car_Descricao, Car_Salariobase) 
Values(2, 'Auxiliar Bibliotecario', 800);

Insert Into Tb_Cargo(Car_Codigo, Car_Descricao, Car_Salariobase) 
Values(3, 'Zelador', 750);

Insert Into Tb_Cargo(Car_Codigo, Car_Descricao, Car_Salariobase) 
Values(4, 'Assistente Bibliotecario', 800);

Insert Into Tb_Cargo(Car_Codigo, Car_Descricao, Car_Salariobase) 
Values(5, 'Estagiario', 300);


Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(1, 'Ana Paula Da Silva', '99098784', '098.675.777-89', 1, 2, 3, 1);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(2, 'Ana Rosa De Aparecida', '77994523', '154.897.345-93', 2, 1, 1, 2);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(3, 'Bruna Oliveira', '78654367', '543.986.431-12', 5, 3, 2, 1);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(4, 'Bruno Rafael Souza', '87654345', '087.876.953-54', 4, 1, 2, 2);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(5, 'Carla De Camargo', '98769876', '873.897.435-93', 3, 4, 6, 3);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(6, 'Carlos Pereira', '34651267', '123.321.431-12', 2, 10, 12, 15);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(7, 'Cristiane Da Silva', '87654833', '074.675.555-89', 2, 9, 8, 11);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(8, 'Cristiano Fagundes', '99882223', '222.121.345-93', 3, 14, 10, 13);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(9, 'Daiane Aparecida', '90874367', '123.987.111-12', 1, 16, 17, 12);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(10, 'Deborah De Lima', '99652145', '564.321.953-54', 1, 20, 21, 30);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(11, 'Diego Machado', '34459876', '999.234.435-43', 1, 31, 29, 45);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(12, 'Douglas Pereira', '56651547', '099.123.456-12', 2, 40, 49, 31);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(13, 'Johny Bitencourt', '77098777', '909.808.777-12', 5, 32, 23, 41);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(14, 'Juliana Gonçalves', '99886677', '111.222.345-93', 4, 21, 41, 22);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(15, 'Juliano Vasconcelos', '12344367', '333.111.431-12', 1, 33, 32, 31);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(16, 'Joaquim Pereira', '11123445', '123.123.123-54', 2, 41, 42, 42);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(17, 'Elaine Mallman', '98799996', '666.897.435-93', 3, 44, 46, 43);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(18, 'Eduardo Gomes', '88881267', '777.321.555-12', 2, 11, 22, 45);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(19, 'Emanuel Dias Pereira', '22254222', '222.622.555-89', 2, 19, 18, 42);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(20, 'Fabiana Nobrega', '11121123', '999.111.345-93', 3, 34, 30, 33);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(21, 'Fernando Teixeira', '44444367', '444.987.111-12', 5, 46, 47, 42);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(22, 'Gabriela Fagundes', '33353335', '345.111.666-54', 4, 47, 42, 41);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(23, 'Gabriel Machado', '31119876', '911.211.435-43', 1, 21, 39, 35);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade) 
Values(24, 'Gustavo Pereira', '56111547', '011.111.411-12', 2, 28, 39, 28);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(25, 'Heitor Damaceno', '55522211', '321.654.987-12', 1, 26, 23, 29);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(26, 'Ivo Machado', '22525501', '789.254.987-02', 2, 32, 37, 35);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(27, 'Karla Rodrigues', '25836914', '258.159.987-99', 5, 41, 45, 49);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(28, 'Lauana De Souza', '14715425', '333.232.121-02', 4, 17, 28, 49);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(29, 'Laura Pereira', '96395175', '157.555.157-57', 1, 28, 39, 42);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(30, 'Laurindo Bitencourt', '99955586', '111.114.411-25', 2, 16, 18, 47);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(31, 'Luciano Rodrigues', '69696958', '474.575.788-77', 3, 12, 43, 10);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(32, 'Lindauva De Lima', '12115425', '124.123.121-09', 2, 21, 32, 43);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(33, 'Maiara Damaceno', '98987845', '101.205.604-11', 1, 9, 14, 33);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(34, 'Maria Machado', '29995588', '157.367.987-14', 2, 12, 47, 25);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(35, 'Mario Rodrigues', '87822214', '242.242.987-11', 4, 12, 24, 36);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(36, 'Mariana De Souza', '12457856', '213.224.129-02', 5, 30, 20, 40);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(37, 'Naiara Pereira', '25236475', '147.124.985-07', 1, 19, 37, 45);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(38, 'Nicole Bitencourt', '14257846', '414.457.421-27', 2, 49, 38, 27);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(39, 'Nicolas Rodrigues', '52526958', '147.741.001-75', 3, 22, 23, 20);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(40, 'Orlando De Lima', '99115525', '101.888.987-25', 2, 41, 22, 13);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(41, 'Otavio Rodrigues', '22246958', '224.442.788-49', 3, 26, 37, 48);
Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(42, 'Odair De Lima', '95198795', '999.487.129-09', 2, 50, 20, 30);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(43, 'Osmarino Damaceno', '87789845', '201.105.904-91', 1, 15, 24, 39);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(44, 'Paulo Machado', '99778858', '805.388.988-15', 2, 19, 20, 38);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(45, 'Paula Rodrigues', '99772424', '542.542.547-18', 3, 24, 34, 39);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(46, 'Patricia De Souza', '456784599', '809.299.177-07', 2, 30, 40, 20);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(47, 'Pedro Pereira', '67589147', '058.474.574-88', 1, 49, 27, 35);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(48, 'Rosa Bitencourt', '66448877', '114.117.412-22', 4, 28, 18, 9);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(49, 'Samuel Rodrigues', '87459864', '022.221.229-25', 3, 12, 13, 10);

Insert Into Tb_Funcionario(Fun_Codigo, Fun_Nome, Fun_Rg, Fun_Cpf, Fun_Codcargo, Fun_Codendereco, Fun_Codbairro, Fun_Codcidade)
Values(50, 'Tatiane Ferreira', '55477845', '052.565.987-87', 5, 41, 28, 33);


Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(1, 'Abril', 1, 1, 1, '11-0000-0001', 'Andre');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(2, 'Panini', 2, 2, 2, '11-0000-0002', 'Pedro');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(3, 'Mythos', 3, 3, 3, '11-0000-0003', 'Marcos');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(4, 'Atica', 4, 4, 4, '11-0000-0004', 'Artur');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(5, 'Escala', 5, 5, 5, '11-0000-0005', 'Everton');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(6, 'Visual Books', 6, 6, 6, '11-0000-0006', 'Vitor');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(7, 'Scipione', 7, 7, 7, '11-0000-0007', 'Sandra');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(8, 'Ufpr', 8, 8, 8, '41-0000-0008', 'Itamar');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(9, 'Ufrj', 9, 9, 9, '21-0000-0008', 'Djoni');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(10, 'Positivo', 10, 10, 10, '41-0000-0010', 'Juliano');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(11, 'Brainstore', 11, 11, 11, '11-0000-0011', 'Luciano');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(12, 'Opera Graphica', 12, 12, 12, '11-0000-0012', 'Jorge');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(13, 'Devir', 13, 13, 13, '11-0000-0013', 'Tiago');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(14, 'Pandora Books', 14, 14, 14, '11-0000-0014', 'Alexandre');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(15, 'Herois.Com', 15, 15, 15, '11-0000-0015', 'Joao');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(16, 'Universo Hq', 16, 16, 16, '11-0000-0016', 'Humberto');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(17, 'Argos', 17, 17, 17, '11-0000-0017', 'Hugo');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(18, 'Arte E Ciencia', 18, 18, 18, '11-0000-0018', 'Claudio');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(19, 'Aymara', 19, 19, 19, '11-0000-0019', 'Michele');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(20, 'Base', 20, 20, 20, '11-0000-0020', 'Fabio');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(21, 'Dcl', 21, 21, 21, '11-0000-0021', 'Marcelo');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(22, 'Dimensao', 22, 22, 22, '11-0000-0022', 'Fabian');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(23, 'Disal', 23, 23, 23, '11-0000-0023', 'Guilherme');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(24, 'Sm', 24, 24, 24, '11-0000-0024', 'Ronaldo');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(25, 'Edifurb', 25, 25, 25, '47-0000-0025', 'Michel');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(26, 'Ediouro', 26, 26, 26, '11-0000-0026', 'Jeferson');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(27, 'Edipucrs', 27, 27, 27, '51-0000-0027', 'Ana');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(28, 'Editora Do Brasil', 28, 28, 28, '11-0000-0028', 'Paula');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(29, 'Eduel', 29, 29, 29, '11-0000-0029', 'Airton');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(30, 'Eduem', 30, 30, 30, '11-0000-0030', 'Romualdo');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(31, 'Edufrgs', 31, 31, 31, '51-0000-0031', 'Nelson');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(32, 'Ftd', 32, 32, 32, '11-0000-0032', 'Rafael');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(33, 'Eduem', 33, 33, 33, '11-0000-0033', 'Felipe');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(34, 'Global', 34, 34, 34, '11-0000-0034', 'Fernando');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(35, 'Ground', 35, 35, 35, '11-0000-0035', 'Emanuel');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(36, 'Guanabara Koogan', 36, 36, 36, '11-0000-0036', 'Oscar');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(37, 'Harbra', 37, 37, 37, '11-0000-0037', 'Nelcimar');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(38, 'Komedi', 38, 38, 38, '11-0000-0038', 'Valdemar');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(39, 'Larousse Do Brasil', 39, 39, 39, '11-0000-0039', 'Rita');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(40, 'Mackenzie', 40, 40, 40, '11-0000-0040', 'Amelia');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(41, 'Macmillan', 41, 41, 41, '11-0000-0041', 'Irma');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(42, 'Martins Fontes', 42, 42, 42, '11-0000-0042', 'Ida');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(43, 'Melhoramentos', 43, 43, 43, '11-0000-0043', 'Leopoldo');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(44, 'Mr Bens', 44, 44, 44, '11-0000-0044', 'Anderson');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(45, 'Multi Marcas Editoriais', 45, 45, 45, '11-0000-0045', 'Rudimar');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(46, 'Nova Fronteira', 46, 46, 46, '11-0000-0046', 'Desiree');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(47, 'Nova Geracao', 47, 47, 47, '11-0000-0047', 'Icaro');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(48, 'Odysseus', 48, 48, 48, '11-0000-0048', 'Samuel');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(49, 'Pioneira', 49, 49, 49, '11-0000-0049', 'Fabricio');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(50, 'Saraiva', 50, 50, 50, '11-0000-0050', 'Gustavo');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(51, 'Globo Marcas', 1, 2, 3, '11-0000-0051', 'Fausto');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(52, 'Uape', 2, 3, 4, '11-0000-0052', 'Marcio');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(53, 'Moderna', 3, 4, 1, '11-0000-0053', 'Angela');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(54, 'Prentice-Hall',13,14,11, '11-0000-0054', 'Paula');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(55, 'Atlas', 23,24,21, '11-0000-0055', 'Paulo');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(56, 'Campus', 33, 34, 31, '11-0000-0056', 'José');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(57, 'Amacom', 43, 44, 41, '11-0000-0057', 'Pedro');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(58, 'Esfera', 35, 45, 15, '11-0000-0058', 'Carlos');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(59, 'Ltc', 36, 46, 16, '11-0000-0059', 'Eudardo');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(60, 'Lisa Livros Irradiantes', 37, 47, 17, '11-0000-0060', 'Maria');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(61, 'Ensino Renovado', 38, 48, 18, '11-0000-0061', 'Carla');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(62, 'Difel', 39, 49, 19, '11-0000-0062', 'Carlos');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(63, 'Lisboa', 32, 42, 12, '11-0000-0063', 'Antonio');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(64, 'Brasiliense', 33, 43, 13, '11-0000-0064', 'Pedro');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(65, 'Record', 35, 45, 15, '11-0000-0065', 'Paulo');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(66, 'Infobook', 32, 42, 12, '11-0000-0066', 'Joaquim');

Insert Into Tb_Editora (Edi_Codigo, Edi_Nome, Edi_Codendereco, Edi_Codcidade, Edi_Codbairro, Edi_Fone, Edi_Contato)
Values(67, 'E. Blucher', 31, 41, 11, '11-0000-0067', 'Clodoaldo');


Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (1, 'Vanesa Damaceno Barbosa', '52791962', 17, '267', 33, 28, '41-3357-9838', 7, '286.209.389-84');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (2, 'Joaquim Francisco Souza', '26978413', 34, '3729', 25, 13, '97-3415-8156', 7, '934.821.016-30');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (3, 'Durinam Salqueiro', '39426923', 36, '274', 45, 31, '44-2235-7842', 14);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (4, 'Felipe Santos', '82640645', 45, '836', 24, 39, '32-4675-5421', 21, '784.527.894-52');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (5, 'Emanual Augusto Tavares', '93492349', 43, '7217', 5, 39, '12-7934-5278', 7, '278.964.537-84');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (6, 'Adamastor Jatoba Mello', '964238138', 12, '36', 35, 39, '44-5796-3428', 14);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (7, 'Jertrudes Silva Souza ', '964983321', 41, '7864', 7, 39, '45-5793-4516', 14, '278.554.936-45');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (8, 'Suzi Ramos Neto', '239734652', 29, '456', 17, 39, '73-1955-7438', 21, '789.538.754-21');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (9, 'Teobaldo Pisquila', '783165977', 21, '8942', 9, 6, '49-6378-1444', 7);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (10, 'Vandier Maciel De Souza', '25834831', 1, '419', 41, 50, '11-2245-7967', 7);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (11, 'Ismael Garcia', '3768121', 45, '1159', 15, 49, '45-3578-6969', 7);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (12, 'Rodrigo Perreira', '9648236', 32, '731', 17, 39, '54-3795-4216', 21, '432.256.789-45');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (13, 'Jair Bastos Ferreira', '39476592', 17, '171', 48, 39, '45-3347-9442', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (14, 'Antonio Oliveira', '68925672', 9, '157', 45, 49, '44-3179-5312', 14, '553.421.789-56');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (15, 'Valentim Rezende ', '34953285', 17, '453', 42, 41, '73-1522-7456', 14, '578.694.533-64');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (16, 'Matilde Rocha Gomes', '4921693496', 33, '6892', 17, 46, '12-4578-9631', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (17, 'Veronica Vicente Cardoso', '254936592', 9, '645', 45, 39, '35-7159-2468', 14, '557.893.652-41');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (18, 'Valdir Vedoka Sanshes', '5531564', 21, '333', 32, 1, '14-7896-3255', 7);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (19, 'Benedita Vicenti Costa', '4689219', 14, '1678', 41, 21, '12-4896-3795', 7);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (20, 'Sonia Amaral Bezerra', '68216924', 24, '1334', 50, 30, '22-4567-8913', 14, '457.896.312-45');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (21, 'Marcos Borges', '83497720', 21, '2341', 34, 39, '75-4284-3964', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (22, 'Emerson Oliveira Branco', '11005932', 39, '3452', 49, 25, '47-8542-4937', 7, '785.431.256-79');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (23, 'Nestor Victor Santos', '62492200', 23, '412', 11, 39, '75-6789-4246', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (24, 'Fatima Domingues Cabal', '59634891', 35, '7456', 43, 42, '24-379-6452', 14);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (25, 'Anicleto Schefer', '25498379', 20, '4573', 17, 26, '43-2167-8945', 14);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (26, 'Jihad Sarhan', '90285876', 40, '622', 33, 31, '75-3246-1986', 21, '789.453.367-89');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (27, 'Terezinha Schiziack', '13972395', 50, '345', 7, 45, '45-3278-9451', 14, '889.634.521-27');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (28, 'Mateus Saraiva', '39548538', 5, '3467', 1, 35, '43-2189-7624', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (29, 'Danieal Vasconcelo', '82048572', 45, '732', 47, 35, '53-2796-4528', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (30, 'Pedro De Larra Cardoso', '71037475', 21, '623', 37, 8, '44-2379-5642', 7, '899.645.278-33');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (31, 'Jose Henrique Amado', '11887424', 7, '724', 21, 3, '78-9345-6178', 7);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (32, 'Ramundo Ferreira Rocha', '11094875', 1, '234', 7, 9, '65-4982-1112', 14, '389.645.562-14');
	
Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (33, 'Roselaine Rodrigues', '18947264', 39, '621', 43, 50, '45-9632-6996', 21, '534.789.645-27');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (34, 'Frederico Ferrari', '78234975', 21, '67', 25, 39, '45-2435-6784', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (35, 'Mirna Marcolim', '275924974', 19, '87', 43, 47, '78-5423-9645', 7);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (36, 'Judite Fontana', '72932034', 15, '234', 7, 25, '42-7935-6241', 14, '778.964.523-12');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (37, 'Genofra Peixoto', '20495729', 4, '624', 4, 41, '95-4421-7351', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (38, 'Iracema Nunes Da Silza Sauro', '452108572', 29, '72', 17, 39, '96-5324-9788', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (39, 'Agenor Perreira Silva', '28733465', 37, '99', 11, 30, '55-3487-7521', 7, '224.578.963-42');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (40, 'Saldi Rovani', '18742623', 50, '484', 9, 20, '75-424-1834', 21, '224.578.956-42');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (41, 'Pamela Sardinha Nunes', '190875342', 39, '2642', 19, 50, '12-3345-7316', 7);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (42, 'Theresa Paes', '99174234', 38, '555', 50, 39, '48-3537-4219', 14, '224.578.963-45');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (43, 'Adalberto Lorencini', '1234872', 29, '2456', 45, 39, '45-3279-3561', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (44, 'Naligia Lombaldo', '1283164', 36, '4563', 23, 47, '45-3786-4532', 7, '553.378.964-52');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (45, 'Sayonara Santos Junior', '18731264', 29, '34512', 17, 39, '22-3345-6789', 14, '554.478.875-21');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (46, 'Natanael Mendes', '1237643', 8, '5341', 5, 20, '54-3217-8964', 21);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (47, 'Sinval Tonolo Tontini', '12381243', 6, '7223', 42, 39, '53-3412-4679', 14, '774.639.784-21');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol, Cli_Cpf)
Values (48, 'Alfanio Cortes Rocha', '123213356', 13, '3445', 14, 39, '78-3631-2459', 7, '445.378.639-78');

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (49, 'Josimeire Calgaro Juvenal', '23495436', 44, '341', 2, 47, '78-3542-8963', 7);

Insert Into Tb_Cliente(Cli_Codigo, Cli_Nome, Cli_Rg, Cli_Codendereco, Cli_Numero, Cli_Codbairro, Cli_Codcidade, Cli_Fone, Cli_Prazodevol)
Values (50, 'Felisbirna Menezes Portillo', '91237534', 50, '627', 50, 37, '45-3278-9341', 21);


Insert Into Tb_Categoria(Cat_Codigo, Cat_Descricao)
Values( 1, 'Informática');

Insert Into Tb_Categoria(Cat_Codigo, Cat_Descricao)
Values( 2, 'Matematica');

Insert Into Tb_Categoria(Cat_Codigo, Cat_Descricao)
Values( 3, 'Lingua Portuguesa');

Insert Into Tb_Categoria(Cat_Codigo, Cat_Descricao)
Values( 4, 'Geografia');

Insert Into Tb_Categoria(Cat_Codigo, Cat_Descricao)
Values( 5, 'História');

Insert Into Tb_Categoria(Cat_Codigo, Cat_Descricao)
Values( 6, 'Banco De Dados');


Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(1, 'Computação Básica E Programação', 50, 1, 1, '1977', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(2, 'O Computador Como Ferramenta Na Educação De Jovens E Adultos', 7  , 1, 1, '2006', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(3, 'Computadores, Escola E Sociedade', 7, 1, 3, '1988', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(4, 'Computation: Finite And Infinite Machines', 49, 1, 2, '1967', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(5, 'Análise De Sistemas: Teoria E Prática', 50, 1, 11, '1973', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(6, 'Análise De Sistemas Para Sistemas De Informação Por Computador', 38, 1, 3, '1987', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(7, 'Computer Data Processing And Rpg Programming', 49, 1, 1, '1970', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(8, 'Computer Glossary: The Complete Illustrated Desk Reference', 36,  1, 5, '1991', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(9, 'Computador Na Edcação: Guia Para O Ensino Com As Novas Tecnologias', 28,  1, 1, '2001', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(10, 'Computação Básica E Program. : Conceitos Básicos E Técnicas Element. De Programação, Ling. Simbólica Fortran, Formas Usuais Para Registro De Inform.', 50, 1, 2, '1983', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(11, 'Computação Básica E Program. : Conceitos Básicos E Técnicas Elementares De Program. , Ling. Simbólica Fortran, Formas Usuais Para Registro De Inform.', 53, 1, 1, '1977', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(12, 'Advanced Engineering Mathematics', 7, 2, 7, '1993', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(13, 'Advanced Engineering Mathematics', 19, 2, 8, '1999', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(14, 'Administ. Financeira E Orçamentária : Matemát. Financ. Aplicada, Estrat. Financ., Orçamento Empresarial', 39, 2, 6, '2007', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(15, 'Álgebra Linear', 16, 2, 1, '1972', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(16, 'Acentuação Gráfica Em Vigor : Uma Sistematização Crítica', 4, 3, 1, '1989', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(17, 'Geografia Do Desenvolvimento No Brasil: Problemas Brasileiros', 52, 3, 2, '1973', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(18, 'Alfbetização: A Escrita Espontânea', 4, 3, 2, '1994', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(19, 'Análise, Linguagem E Pensamento: A Diversidade De Textos Numa Proposta Socioconstrutivista', 32, 3, 1, '2000', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(20, 'Análise Sintática Teoria Geral E Descrição Do Português', 4, 3, 2, '1989', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(21, 'Geografia Do Desenvolvimento No Brasil : Problemas Brasileiros', 23, 4, 2, '1973', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(22, 'Geografia Do Desenvolvimento No Brasil : Problemas Brasileiros', 23, 4, 4, '1974', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(23, 'Geografia Do Desenvolvimento No Brasil : Problemas Brasileiros', 51, 4, 5, '1978', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(24, 'Geografia Do Paraná: Com Fundamentos De Geografia Geral', 40, 4, 4, '1983', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(25, 'Geografia Do Paraná: Com Fundamentos De Geografia Geral', 43, 4, 5, '1985', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(26, 'Geografia Do Paraná', 2, 4, 3, '1978', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(27, 'Geografia Do Subdesenvolvimento', 6, 4, 3, '1971', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(28, 'Geografia Do Subdesenvolvimento', 46, 4, 5, '1978', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(29, 'Geografia Do Subdesenvolvimento', 6, 4, 6, '1982', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(30, 'Geografia Do Subdesenvolvimento', 2, 4, 8, '1990', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(31, 'Geografia Dos Continentes: América', 7, 4, 1, '1997', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(32, 'Geografia Dos Continentes: Asia', 7, 4, 1, '1997', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(33, 'Geografia Dos Continentes: Ocidental', 7, 4, 1, '1997', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(34, 'Geografia Dos Continentes: Europeu', 7, 4, 1, '1997', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(35, 'A Cidade Antiga : Estudos Sobre O Culto, O Direito, As Instituições Da Grécia E De Roma', 3, 5, 8, '1976', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(36, 'A Cidade Antiga : Estudos Sobre O Culto, O Direito, As Instituições Da Grécia E De Roma', 3, 5, 9, '1978', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(37, 'A Cidade Antiga : Estudos Sobre O Culto, O Direito, As Instituições Da Grécia E De Roma', 3, 5, 10, '1980', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(38, 'A Crise Do Escravismo E A Grande Imigração', 4, 5, 1, '1976', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(39, 'A Crise Do Escravismo E A Grande Imigração', 4, 5, 2, '1981', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(40, 'A Amazonia E Cobiça Internacional', 5, 5, 1, '1965', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(41, 'A Amazonia E Cobiça Internacional', 21, 5, 2, '1967', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(42, 'A Amazonia E Cobiça Internacional', 27, 5, 3, '1968', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(43, 'Banco De Dados Orientado A Objetos', 6, 6, 1, '1994', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(44, 'Bancos De Dados: Conceitos, Modelos, Gerenciadores, Projeto Lógico, Projeto Físico', 7, 6, 1, '1986', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(45, 'Bancos De Dados: Conceitos, Modelos, Gerenciadores, Projeto Lógico, Projeto Físico', 7, 6, 2, '1987', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(46, 'Bancos De Dados: Conceitos, Modelos, Gerenciadores, Projeto Lógico, Projeto Físico', 7, 6, 3, '1989', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(47, 'Banco De Dados Orientado A Objetos', 52, 6, 1, '1999', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(48, 'Banco De Dados Orientado A Objetos', 7, 6, 2, '2001', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(49, 'Banco De Dados Orientado A Objetos', 12, 6, 3, '2003', 7);

Insert Into Tb_Livro(Liv_Codigo, Liv_Titulo, Liv_Codeditora, Liv_Codcategoria, Liv_Edicao, Liv_Ano, Liv_Prazominimo)
Values(50, 'Bancos De Dados: Conceitos, Modelos, Gerenciadores, Projeto Lógico, Projeto Físico', 34, 6, 4, '1992', 7);



Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(1, 'Antonio Nicolau Youssef');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(2, 'Vicente Paz Fernandez');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(3, 'Rui José De Arruda Campos');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(4, 'José Cordeiro');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(5, 'Jorge Pedro Dalledonne De Barros');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(6, 'Ubiratan D Ambrosio');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(7, 'Marvin Lee Minsky');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(8, 'Antony Chandor');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(9, 'John Graham');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(10, 'Robin Williamson');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(11, 'James C. Wetherbe');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(12, 'Thomas R Gilderslleve');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(13, 'Alan Freedman');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(14, 'Marco Gasperetti');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(15, 'Erwin Kreyszig');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(16, 'Masakazu Hoji');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(17, 'David C. Murdoch');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(18, 'Amini Boainain Hauy');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(19, 'Carlos Cesar Guterres Taveira');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(20, 'Ademar Da Silva');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(21, 'Maria Fernandes Cócco');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(22, 'Marco Antonio Hailer');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(23, 'Miriam Lemle');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(24, 'Iaroslaw Wons');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(25, 'Yves Lacoste');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(26, 'Helio Carlos Garcia');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(27, 'Tito Marcio Garavello');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(28, 'Fustel De Coulanges');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(29, 'Paula Beiguelman');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(30, 'Arthur Cezar Ferreira Reis');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(31, 'Setrag Khoshafian');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(32, 'Valdemar Waingort Setzer');

Insert Into Tb_Autor(Aut_Codigo, Aut_Nome)
Values(33, 'Eugênio A. Nassu');


Insert Into Tb_Autorlivro(Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(3, 1, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(4, 2, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(5, 3, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(6, 3, 'Não');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(7, 4, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(8, 5, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(11, 6, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(12, 7, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(13, 8, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(14, 9, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(3, 10, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(3, 11, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(15, 12, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(15, 13, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(16, 14, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(17, 15, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(18, 16, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(19, 17, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(20, 18, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(21, 19, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(22, 19, 'Não');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(23, 20, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(19, 21, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(19, 22, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(19, 23, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(24, 24, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(24, 25, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(24, 26, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(25, 27, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(25, 28, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(25, 29, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(25, 30, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(26, 31, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(27, 31, 'Não');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(26, 32, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(27, 32, 'Não');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(26, 33, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(27, 33, 'Não');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(26, 34, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(27, 34, 'Não');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(28, 35, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(28, 36, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(28, 37, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(29, 38, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(29, 39, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(30, 40, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(30, 41, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(30, 42, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(31, 43, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(32, 44, 'Sim');

Insert Into Tb_Autorlivro(Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(32, 45, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(32, 46, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(33, 47, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(33, 48, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(33, 49, 'Sim');

Insert Into Tb_Autorlivro (Autliv_Codautor, Autliv_Codlivro, Autliv_Principal)
Values(32, 50, 'Sim');


Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(1, '2012/02/01', 1, 1, 1, 'Ativa');

Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(2, '2022/01/02', 3, 3, 3, 'Ativa');

Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(3, '2010/01/01', 5, 5, 5, 'Cancelada');

Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(4, '2019/02/08', 7, 7, 7, 'Concluida');

Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(5, '2005/02/08', 9, 9, 9, 'Ativa');

Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(6, '2011/08/08', 11, 11, 11, 'Concluida');

Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(7, '2005/02/08', 13, 13, 13, 'Cancelada');

Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(8, '2009/08/05', 15, 15, 15, 'Ativa');

Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(9, '2006/02/10', 17, 17, 17, 'Concluida');

Insert Into Tb_Reserva(Res_Codigo, Res_Data, Res_Codlivro, Res_Codfunc, Res_Codcliente, Res_Situacao)
Values(10, '2010/10/10', 18, 19, 19, 'Ativa');


Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (1, 12,'Locado');
	
Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (2, 4,'Não Locado');
Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (3, 41,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (4, 18,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (5, 10,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (6, 33,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (7, 5,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (8, 25,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (9, 46,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (10, 1,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (11, 38,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (12, 16,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (13, 22,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (14, 50,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (15, 29,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (16, 20,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (17, 42,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (18, 6,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (19, 27,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (20, 48,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (21, 21,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (22, 49,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (23, 7,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (24, 35,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (25, 14,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (26, 2,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (27, 44,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (28, 47,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (29, 26,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (30, 11,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (31, 31,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (32, 3,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (33, 23,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (34, 30,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (35, 40,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (36, 8,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (37, 17,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (38, 37,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (39, 45,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (40, 28,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (41, 24,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (42, 39,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (43, 15,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (44, 43,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (45, 13,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (46, 19,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (47, 34,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (48, 36,'Não Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (49, 32,'Locado');

Insert Into Tb_Exemplar (Exe_Codigo,Exe_Codlivro, Exe_Status)
   Values (50, 9,'Não Locado');


Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (1, '2008/01/02', 5, 10);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (2, '2006/01/02', 10, 12);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (3, '2018/01/02', 12, 32);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (4, '2004/01/02',10, 50);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (5, '2003/01/02', 44, 22);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (6, '2008/02/02', 37, 22);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (7, '2008/10/05', 37, 11);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (8, '2008/10/11', 49, 1);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (9, '2012/01/02', 9, 23);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (10, '2006/01/02', 20, 30);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (11, '2006/01/04', 32, 33);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (12, '2006/01/03', 9, 12);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (13, '2006/01/05', 7, 42);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (14, '2006/10/27', 27, 31);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (15, '2005/01/25', 48, 5);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (16, '2014/01/22', 39, 44);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (17, '2003/11/12', 17, 28);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (18, '2016/08/02', 28, 37);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (19, '2016/01/02', 47, 36);

Insert Into Tb_Emprestimo (Emp_Codigo, Emp_Data, Emp_Codcliente, Emp_Codfuncionario) Values (20, '2010/11/02', 12, 29);


Insert Into Tb_Exemplaremprestimo (Exepre_Codexemplar, Exepre_Codemprestimo, Exepre_Dtprevdev, Exepre_Dtdevmul, Exepre_Dtpgmul, Exepre_Codreserva, Exepre_Valormulta)
   Values (2, 16, '2007/10/01', '2007/10/23', '2007/10/27', 25, 2);
	
Insert Into Tb_Exemplaremprestimo (Exepre_Codexemplar, Exepre_Codemprestimo, Exepre_Dtprevdev, Exepre_Dtdevmul, Exepre_Dtpgmul, Exepre_Codreserva, Exepre_Valormulta)
   Values (38, 24, '2008/10/01', '2008/10/23', '2008/10/27', 11, 2);

Insert Into Tb_Exemplaremprestimo (Exepre_Codexemplar, Exepre_Codemprestimo, Exepre_Dtprevdev, Exepre_Dtdevmul, Exepre_Dtpgmul, Exepre_Valormulta)
   Values (20, 50, '2009/10/01', '2009/10/23', '2009/10/27', 2);

Insert Into Tb_Exemplaremprestimo (Exepre_Codexemplar, Exepre_Codemprestimo, Exepre_Dtprevdev, Exepre_Dtdevmul, Exepre_Dtpgmul, Exepre_Codreserva, Exepre_Valormulta)
   Values (27, 3, '2010/10/01', '2010/10/23', '2010/10/27', 3, 2);

Insert Into Tb_Exemplaremprestimo (Exepre_Codexemplar, Exepre_Codemprestimo, Exepre_Dtprevdev, Exepre_Dtdevmul, Exepre_Dtpgmul, Exepre_Codreserva, Exepre_Valormulta)
   Values (42, 38, '2011/10/01', '2011/10/23', '2011/10/27', 4, 3);

Insert Into Tb_Exemplaremprestimo (Exepre_Codexemplar, Exepre_Codemprestimo, Exepre_Dtprevdev, Exepre_Dtdevmul, Exepre_Dtpgmul, Exepre_Valormulta)
   Values (23, 11, '2012/10/01', '2012/10/23', '2012/10/27', 5);

Insert Into Tb_Exemplaremprestimo (Exepre_Codexemplar, Exepre_Codemprestimo, Exepre_Dtprevdev, Exepre_Dtdevmul, Exepre_Dtpgmul, Exepre_Valormulta)
   Values (48, 27, '2013/10/01', '2013/10/23', '2013/10/27', 3);

Insert Into Tb_Exemplaremprestimo (Exepre_Codexemplar, Exepre_Codemprestimo, Exepre_Dtprevdev, Exepre_Dtdevmul, Exepre_Dtpgmul, Exepre_Valormulta)
   Values (13, 6, '2014/10/01', '2014/10/23', '2014/10/27', 2);
   
# 1 - Utilizando subconsultas, realize uma consulta que retorne quais os cargos 
#     que tem salário acima da média de todos os cargos;

SELECT c.Car_Descricao as Cargo, Car_Salariobase as Salario
		FROM tb_cargo as c
        WHERE Car_Salariobase > (SELECT AVG(c.Car_Salariobase)
										FROM tb_cargo as c);
                                        
# 2 - Utilizando subconsultas, realize uma consulta de quais dias houve um número de 
#	  empréstimos maior que o número de reservas;
        
SELECT DISTINCT e.Emprestimos, e.Data_Emprestimos
FROM (SELECT COUNT(e.Emp_Data) as Emprestimos, e.Emp_Data as Data_Emprestimos
			 FROM tb_emprestimo as e
			 GROUP BY e.Emp_Data) as e
LEFT JOIN (SELECT COUNT(r.Res_Data) as Reservas, r.Res_Data as Data_Reservas
				  FROM tb_reserva as r
				  GROUP BY r.Res_Data) as r
ON e.Data_Emprestimos = r.Data_Reservas
WHERE COALESCE(r.Reservas, 0) < e.Emprestimos;
								

# 3 - Utilizando subconsultas, realize uma consulta que retorne quais exemplares 
#     ainda não foram emprestados;

SELECT e.Exe_Codlivro as "Codigo Livro"
	   FROM tb_exemplar as e
       WHERE e.Exe_Codlivro NOT IN (SELECT ee.Exepre_Codexemplar
									FROM tb_exemplaremprestimo as ee);

# 4 - Utilizando subconsultas, realize uma consulta que retorne qual é a rua com número 
#     de clientes maior que a média de clientes por rua;

SELECT e.End_Descricao
	   FROM tb_endereco as e
       WHERE e.End_Codigo IN (SELECT DISTINCT c.Cli_Codendereco
									 FROM (SELECT COUNT(c.Cli_Codendereco) as count, c.Cli_Codendereco
										   FROM tb_cliente as c
										   GROUP BY c.Cli_Codendereco) as c
									 WHERE c.count > (SELECT AVG(a.enderecoCount)
															 FROM (SELECT COUNT(c.Cli_Codendereco) as enderecoCount
																		  FROM tb_cliente as c
																		  GROUP BY c.Cli_Codendereco) a))
