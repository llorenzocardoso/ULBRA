create database aula_03_views;

-- criando as tabelas
CREATE TABLE produtos(
    id int primary key auto_increment,
    nome varchar(100) not null,
    valor decimal(10,2) not null,
    saldo int not null
);

CREATE TABLE orcamentos(
    id int primary key auto_increment,
    data date not null,
    status varchar(50) not null
);

CREATE TABLE orcamento_itens(
    id_prod int not null,
    id_orc int not null,
    valor_unit decimal(10,2) not null,
    quantidade int not null,
    valor_total_item decimal(10,2) not null,
    primary key (id_prod, id_orc),
        foreign key (id_prod) references produtos(id),
    constraint orcamento_itens_id_orc
        foreign key (id_orc) references orcamentos(id)
);

-- populando as tabelas
INSERT INTO produtos(nome, valor, saldo) VALUES 
    (1, 'Smartphone Samsung Galaxy S21', 3599.99, 50),
    (2, 'Notebook Dell Inspiron 15', 4499.99, 30),
    (3, 'Smartwatch Apple Watch Series 7', 2999.99, 20),
    (4, 'Câmera Digital Canon EOS Rebel T8i', 4799.99, 10),
    (5, 'Fone de ouvido sem fio Sony WH-1000XM4', 2399.99, 40),
    (6, 'Tablet Samsung Galaxy Tab S7+', 3299.99, 15),
    (7, 'Monitor Gamer Dell Alienware AW3418DW', 9999.99, 5),
    (8, 'Drone DJI Mavic 2 Pro', 10999.99, 2),
    (9, 'Console Sony PlayStation 5', 5999.99, 8),
    (10, 'Computador Gamer', 3499.99, 12);

INSERT INTO orcamentos(id, data, status) VALUES 
    (1, '2022-01-20', 'vendido'),
    (2, '2022-04-20', 'em orçamento'),
    (3, '2022-05-19', 'em orçamento'),
    (4, '2022-03-18', 'cancelado'),
    (5, '2022-03-17', 'vendido'),
    (6, '2022-08-16', 'em orçamento'),
    (7, '2022-11-15', 'vendido'),
    (8, '2022-01-21', 'cancelado'),
    (9, '2022-12-13', 'em orçamento'),
    (10, '2022-07-12', 'vendido');

INSERT INTO orcamento_itens(id_prod, id_orc, valor_unit, quantidade, valor_total_item) VALUES
    (1, 1, 3599.99, 2, 7199.98),
    (2, 1, 4499.99, 1, 4499.99),
    (3, 2, 2999.99, 3, 8999.97),
    (4, 2, 4799.99, 2, 9599.98),
    (5, 3, 6999.99, 1, 6999.99),
    (6, 3, 2499.99, 3, 7499.97),
    (7, 4, 1499.99, 4, 5999.96),
    (8, 5, 1099.99, 2, 2199.98),
    (9, 6, 399.99, 5, 1999.95),
    (10, 7, 799.99, 3, 2399.97);

-- consultas e views


-- explicacoes
-- Explique quando utilizar o GROUP BY, de um exemplo sql.
-- O uso do comando SQL GROUP BY é importante quando queremos selecionar diversos registros em uma tabela e agrupá-los por um ou mais campos.
SELECT p.categoria, p.nome, avg(v.preco),  sum(v.unidades)
FROM produtos p
    LEFT JOIN vendas v ON p.id = v.id_produto
GROUP BY p.categoria, p.nome;
-- Essa consulta irá mostrar a categoria, o nome do produto, a media de preço das vendas e o total de unidades vendidas agrupadas pela categoria e o nome do produto.

-- Explique quando utilizar o HAVING, de um exemplo sql.
-- o HAVING é aplicado às linhas no conjunto de resultados. Somente os grupos que atendem os critérios de HAVING são exibidos na saída da consulta. Você pode aplicar apenas uma cláusula HAVING em colunas que também são exibidas na cláusula GROUP BY ou em uma função de agregação.
SELECT d.nome as departamento, f.nome as funcionario, avg(d.salario) as media_salarial
FROM funcionarios f
    LEFT JOIN departamentos d
        on f.id = d.id_funcionario
GROUP BY d.nome, f.nome
HAVING media_salarial > 5000;
-- Essa consulta irá retonar o nome do departamento e o nome do funcionário apenas aos grupos que tem a média salarial maior a 500

-- Explique quando utilizar o UNION, de um exemplo sql.
-- O UNION permite que se incluam resultados de duas instruções SELECT em uma tabela resultante. Todas as linhas retornadas da instrução SELECT são combinadas no resultado da expressão UNION.

-- Explique quando utilizar o LEFT JOIN, de um exemplo sql.
-- Use a operação LEFT JOIN para criar uma junção externa esquerda. As junções externas esquerdas incluem todos os registros da primeira de duas tabelas (a da esquerda), mesmo se não houver valores correspondentes na segunda tabela (à direita).
SELECT d.nome as departamento, f.nome as funcionario, avg(d.salario) as media_salarial
FROM funcionarios f
    LEFT JOIN departamentos d
        on f.id = d.id_funcionario
GROUP BY d.nome, f.nome
HAVING media_salarial > 5000;