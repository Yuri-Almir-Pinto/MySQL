Create table tb_cnh (
	cnh_nrRegistro integer not null primary key auto_increment,
    cnh_Nome char(50) not null,
    cnh_DocIdentidade char(9) not null,
    cnh_OrgEmissor char(20) not null,
    cnh_uf char(2) not null,
    cnh_cpf char(14) not null,
    cnh_dataDeNascimento DATE not null,
    cnh_permissao char(20),
    cnh_ACC char(20),
    cnh_CatHab char(1) not null,
    cnh_validade DATE not null,
    cnh_PrimHab DATE not null,
    cnh_pai char(50) not null,
    cnh_mae char(50) not null
);

Create table tb_observacoes (
    obs_nrRegistro integer not null primary key,
    obs_observacoes varchar(80) not null,
    foreign key (obs_nrRegistro) references tb_CNH (cnh_nrRegistro)
);