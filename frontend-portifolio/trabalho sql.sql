create database trabalho;
use trabalho; -- selcionando databse

create table especialidades(
  especialidade varchar(100) not null,
  idespecialidade int not null primary key
);

create table medicos(
  nome varchar(200),
  idcrm int not null primary key
);

create table pacientes(
  nome varchar (200),
  nascimento date,
  sexo varchar (10),
  rg bigint not null,
  cpf bigint not null primary key,
  contato bigint not null
);

create table convenios(
  nome varchar (200),
  idconvenio int not null primary key
);

create table endereco(
  logradouro varchar (100),
  nome varchar (200),
  numero int not null,
  complemento varchar (200),
  cidade varchar (100),
  ufestado varchar (2),
  cep bigint not null,
  idendereco int not null primary key
);

create table consultasdiarias(
  dia date,
  hora time,
  descricao varchar (200) -- descricao da consulta
);

-- adicionando foreign key às tabelas 
    -- tabela medicos
alter table medicos
  add column idespecialidade int;
alter table medicos add 
    constraint foreign key (idespecialidade)
	   references especialidades(idespecialidade);
       
	-- tabela pacientes
    
 alter table pacientes
  add column idconvenio int;
alter table pacientes add 
    constraint foreign key (idconvenio)
	   references convenios(idconvenio);   
 -- --------------------      
alter table pacientes
  add column idendereco int;
alter table pacientes add 
    constraint foreign key (idendereco)
	   references endereco(idendereco);  
-- ---------------------
	
 -- tabela concultas diarias      

alter table consultasdiarias
  add column cpf bigint;
alter table consultasdiarias add 
    constraint foreign key (cpf)
	   references pacientes(cpf);
       
alter table consultasdiarias
  add column idcrm int;
alter table consultasdiarias add 
    constraint foreign key (idcrm)
	   references medicos(idcrm);
       
-- --------------------- fim de adição de foreign key

-- -------- inicio de comandos ------------
       -- inserir valores às tabelas
	-- inserir as especialidades
insert into especialidades(especialidade, idespecialidade)
 values ('oftalmologia','1'),
		('otorrinolaringologia','2'),
        ('pediatria','3'),
        ('dermatologia','4');
        
   select especialidades.especialidade
     from especialidades;

-- desc especialidades; detalhes
-- -------------- medicos
describe medicos;

 insert into medicos(nome, idcrm, idespecialidade)
 values ('carlos akiko', '123453', 3 ),
        ('juliana moura', 5678, 4),
        ('renesmee cullen', 9123, 1);
 
 select * from medicos; 


-- convenios
insert into convenios(nome,idconvenio)
            values ('unimed', '6');
insert into convenios(nome,idconvenio)
            values ('frimed', '7');
insert into convenios(nome,idconvenio)
            values ('gramed', '8');
            
-- endereço
insert into endereco(logradouro,nome,numero,complemento,idendereco,cidade,ufestado,cep)
            values ('rua','juvian peixoto','167','','890','bh','mg','12345679');
insert into endereco(logradouro,nome,numero,complemento,idendereco,cidade,ufestado,cep)
            values ('avenida','hian paraguai','543','','435','bh','mg','3456796');
insert into endereco(logradouro,nome,numero,complemento,idendereco,cidade,ufestado,cep)
            values ('beco','19','3','','423','bh','mg','46778899');


-- pacientes
insert into pacientes (nome, nascimento, sexo, rg, cpf, idconvenio, contato, idendereco)
			values ('catarina amaral','2011-02-08', 'f','1234567','12345678910',6,'31983015867',890);
insert into pacientes (nome, nascimento, sexo, rg, cpf, idconvenio, contato, idendereco)
			values ('viviane silva','1990-09-09', 'f','8910112','10987654321',7,'31987060504',435);
insert into pacientes (nome, nascimento, sexo, rg, cpf, idconvenio, contato, idendereco)
            values ('fidalgo magalhaes','2000-02-20', 'm','2467987','13579246801',8,'31987605432',423);
  
 -- inserir consultas e mostrá-las
 #1 
 alter table consultasdiarias
   add constraint colsultasdiarias
   unique (dia,hora);
   
 insert into consultasdiarias (cpf, dia,hora,descricao,idcrm)
   values (12345678910,'2023-06-12','12:00:00','pediatria',123453);
   
 -- #2
 insert into consultasdiarias (cpf,dia,hora,descricao,idcrm)
   values ('10987654321','2023-06-12','11:00:00',' dermatologia','5678');
   
-- #3
insert into consultasdiarias (cpf,dia,hora,descricao,idcrm)
   values ('13579246801','2023-07-12','11:30:00','oftalmologia','9123');

select *
  from consultasdiarias;

-- historico do paciente

select *
   from consultasdiarias
   where cpf = "13579246801"; -- indira o cpf desejado