create table clientes
(
    id int not null primary key, 
    nome varchar(100) not null,
    CPF char(14) not null unique,
);
create table enderecos
(
    id int not null primary key, 
    logradouro varchar(100) not null, 
    numero varchar(10), 
    bairro varchar(100),
    cidade varchar(100), 
    estado char(2), 
    id_cliente int not null, 
        constraint fk_clientes_enderecos
            foreign key(id_cliente) references clientes(id)
);

create table engenheiros
(
    id int not null primary key, 
    nome varchar(100) not null
);

create table projetos
(
    id int not null primary key, 
    nome varchar(250) not null
);

create table atuacoes
(
    id int not null primary key,
    funcao varchar(20),
    id_engenheiro int not null, 
    id_projeto int not null, 
    constraint fk_engenheiros_atuacoes
        foreign key(id_engenheiro) references engenheiros(id),
    constraint fk_projetos_atuacoes
        foreign key(id_projeto) references projetos(id)
);

CREATE TABLE alunos
(
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(80) not null
);

CREATE TABLE departamentos
(
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(30) not null
);

CREATE TABLE cursos
(
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(50) not null,
    id_departamento int not null,
    CONSTRAINT fk_cursos_departamentos 
        FOREIGN KEY (id_departamento)
            REFERENCES departamentos(id)
);

CREATE TABLE professores
(
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(80) not null
);

CREATE TABLE disciplinas
(    
    id INT auto_increment PRIMARY KEY,
    nome VARCHAR(30) not null,
    id_professor int not null,
    CONSTRAINT fk_disciplinas_professores
        FOREIGN KEY (id_professor)
            REFERENCES professores(id)
);

CREATE TABLE matriculas
(
    id int not null auto_increment primary key,
    data_matricula DATE,
    id_aluno INT not null,
    id_disciplina INT not null,

    CONSTRAINT fk_alunos_matriculas
        FOREIGN KEY (id_aluno)
            REFERENCES alunos(id),
            
    CONSTRAINT fk_disciplinas_matriculas
        FOREIGN KEY (id_disciplina)
            REFERENCES disciplinas(id)
);