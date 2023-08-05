create database aula04;

-- criando as tabelas
create table clientes(
    id int primary key auto_increment,
    nome varchar(100) not null
);

create table livros(
    id int primary key auto_increment,
    titulo varchar(100) not null,
    valor_unit decimal(10,2) not null
);

create table autores(
    id int primary key auto_increment,
    nome varchar(100) not null
);

create table autores_livros(
    id_autor int not null,
    id_livro int not null,
    primary key(id_autor, id_livro),
        foreign key(id_autor) references autores(id),
        foreign key(id_livro) references livros(id)
);

create table vendas(
    id int primary key auto_increment,
    data date,
    id_cliente int not null,
    constraint vendas_fk_id_cliente
        foreign key(id_cliente) references clientes(id)
);

create table vendas_livros(
    id int primary key auto_increment,
    id_livro int not null,
    qtd int not null,
    valor_unit decimal(10,2) not null,
    constraint vendas_livros_fk_id_livro
        foreign key(id_livro) references livros(id)
);

-- populando as tabelas
-- tabela clientes
INSERT INTO clientes (nome) VALUES ('João da Silva');
INSERT INTO clientes (nome) VALUES ('Maria da Silva');
INSERT INTO clientes (nome) VALUES ('Pedro Oliveira');
INSERT INTO clientes (nome) VALUES ('Ana Santos');
INSERT INTO clientes (nome) VALUES ('Luiz Gonzaga');
-- tabela livros
INSERT INTO livros (titulo, valor_unit) VALUES ('O Senhor dos Anéis', 49.99);
INSERT INTO livros (titulo, valor_unit) VALUES ('Harry Potter e a Pedra Filosofal', 29.99);
INSERT INTO livros (titulo, valor_unit) VALUES ('1984', 19.99);
INSERT INTO livros (titulo, valor_unit) VALUES ('Cem Anos de Solidão', 39.99);
INSERT INTO livros (titulo, valor_unit) VALUES ('A Divina Comédia', 24.99);
-- tabela autores
INSERT INTO autores (nome) VALUES ('J.R.R. Tolkien');
INSERT INTO autores (nome) VALUES ('J.K. Rowling');
INSERT INTO autores (nome) VALUES ('George Orwell');
INSERT INTO autores (nome) VALUES ('Gabriel Garcia Marquez');
INSERT INTO autores (nome) VALUES ('Dante Alighieri');
-- tabela autores_livros
INSERT INTO autores_livros (id_autor, id_livro) VALUES (1, 1);
INSERT INTO autores_livros (id_autor, id_livro) VALUES (2, 2);
INSERT INTO autores_livros (id_autor, id_livro) VALUES (3, 3);
INSERT INTO autores_livros (id_autor, id_livro) VALUES (4, 4);
INSERT INTO autores_livros (id_autor, id_livro) VALUES (5, 5);
-- tabela vendas
INSERT INTO vendas (data, id_cliente) VALUES ('2023-03-25', 1);
INSERT INTO vendas (data, id_cliente) VALUES ('2023-03-25', 2);
INSERT INTO vendas (data, id_cliente) VALUES ('2023-03-26', 3);
INSERT INTO vendas (data, id_cliente) VALUES ('2023-03-26', 4);
INSERT INTO vendas (data, id_cliente) VALUES ('2023-03-27', 5);
-- tabela vendas_livros
INSERT INTO vendas_livros (id_livro, qtd, valor_unit) VALUES (1, 2, 49.99);
INSERT INTO vendas_livros (id_livro, qtd, valor_unit) VALUES (2, 3, 29.99);
INSERT INTO vendas_livros (id_livro, qtd, valor_unit) VALUES (3, 1, 19.99);
INSERT INTO vendas_livros (id_livro, qtd, valor_unit) VALUES (4, 2, 39.99);
INSERT INTO vendas_livros (id_livro, qtd, valor_unit) VALUES (5, 1, 24.99);

-- fazendo as consultas
-- Crie uma view chamada "livros_mais_vendidos" que exiba o título, autor, preço e a quantidade de vezes que cada livro foi vendido.
create view livros_mais_vendidos
as
SELECT l.titulo as nome, l.valor_unit as preco_unitario, a.nome as autor, vl.qtd as quantidade_vendida
FROM livros l
    INNER JOIN autores_livros al
        on l.id = al.id_livro
    INNER JOIN autores a
        on al.id_autor = a.id
    INNER JOIN vendas_livros vl
        on l.id = vl.id_livro
ORDER BY quantidade_vendida DESC;

-- Crie uma view que lista os autores que nunca venderam livros
create view autores_sem_vendas
as
SELECT id, nome as autor
FROM autores a
WHERE id NOT IN(
    SELECT distinct id_autor
    FROM autores_livros al
        INNER JOIN vendas_livros vl
            on al.id_livro = vl.id_livro
);

-- Use a sua criatividade e crie uma view que se aplique nessa modelagem.
create view livros_nao_vendidos
as
SELECT l.id, l.titulo, l.valor_unit
FROM livros l
    LEFT JOIN vendas_livros vl 
        on l.id = vl.id_livro
WHERE vl.id_livro IS NULL;