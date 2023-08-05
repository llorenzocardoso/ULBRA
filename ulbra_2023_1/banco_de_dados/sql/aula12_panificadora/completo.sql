CREATE TABLE categorias(
    id INT PRIMARY KEY auto_increment,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE ingredientes(
    id INT PRIMARY KEY auto_increment,
    descricao VARCHAR(100) NOT NULL,
    estoque DECIMAL(10,2) NOT NULL
);

create table produtos(
    id INT PRIMARY KEY auto_increment,
    categoria INT NOT NULL, 
    estoque INT NOT NULL,
    data_prod DATE NOT NULL,
    CONSTRAINT cate_fk_prod
        FOREIGN KEY (categoria) REFERENCES Categoria(id)
            ON DELETE restrict 
            ON UPDATE cascade
);

create table produto_ingrediente(
    id_produto INT NOT NULL,
    id_ingrediente INT NOT NULL,
    qtd DECIMAL(10,2) NOT NULL,
    CONSTRAINT prod_fk_receita
        FOREIGN KEY (id_produto) REFERENCES Produto(id)
            ON DELETE restrict 
            ON UPDATE cascade,
    CONSTRAINT ingre_fk_receite
        FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id)
            ON DELETE restrict 
            ON UPDATE cascade
);

CREATE TABLE devolucoes(
    id_produto INT NOT NULL,
    date_dev DATE DEFAULT now(),
    CONSTRAINT devo_fk_prod
        FOREIGN KEY (id_produto) REFERENCES Produto(id)
            ON DELETE RESTRICT 
            ON UPDATE CASCADE
);
-- inserts ---------------------------------------------------------------

INSERT INTO categorias (descricao) VALUES
    ('Pães'),
    ('Bolos'),
    ('Salgados'),
    ('Bebidas'),
    ('Doces');


INSERT INTO ingredientes (descricao, estoque) VALUES
    ('Farinha de trigo', 50.00),
    ('Leite', 20.00),
    ('Ovos', 30.00),
    ('Fermento em pó', 5.00),
    ('Açúcar', 15.00),
    ('Manteiga', 10.00),
    ('Sal', 2.00),
    ('Óleo', 8.00),
    ('Creme de leite', 12.00),
    ('Cacau em pó', 7.00);

INSERT INTO produtos (categoria, estoque, data_prod)
VALUES (1, 50, '2023-05-08'),
       (2, 100, '2023-05-08'),
       (1, 75, '2023-05-08'),
       (2, 150, '2023-05-08'),
       (1, 25, '2023-05-07'),
       (2, 50, '2023-05-07'),
       (1, 100, '2023-05-07'),
       (2, 200, '2023-05-07'),
       (1, 30, '2023-05-06'),
       (2, 60, '2023-05-06');

INSERT INTO produtos (categoria, estoque, data_prod, data_validade) VALUES 
(3, 50, '2023-05-09', '2023-06-01'),
(4, 30, '2023-05-09', '2023-06-02'),
(5, 20, '2023-05-09', '2023-06-03'),
(3, 60, '2023-05-10', '2023-06-04'),
(4, 25, '2023-05-10', '2023-06-05'),
(5, 35, '2023-05-10', '2023-06-06'),
(3, 45, '2023-05-11', '2023-06-07'),
(4, 40, '2023-05-11', '2023-06-08'),
(5, 30, '2023-05-11', '2023-06-09'),
(3, 55, '2023-05-12', '2023-06-10');


INSERT INTO produto_ingrediente (id_produto, id_ingrediente, qtd)
VALUES (1, 1, 0.5),
       (1, 2, 0.3),
       (1, 3, 0.2),
       (2, 2, 0.4),
       (2, 4, 0.2),
       (2, 5, 0.1),
       (3, 1, 0.3),
       (3, 2, 0.2),
       (3, 3, 0.2),
       (3, 4, 0.1),
       (3, 5, 0.1),
       (4, 2, 0.5),
       (4, 3, 0.2),
       (5, 1, 0.4),
       (5, 3, 0.3);

--------------------------------------------------------------------------

-- 3. Alterar a tabela de Produtos e incluir o tempo de validade. 
ALTER TABLE produtos ADD column data_validade DATE NOT NULL;

-- Exibir quantos produtos há para cada categoria; 
SELECT sum(estoque) AS quantidade, categoria  
FROM produtos
GROUP BY categoria
ORDER BY quantos DESC;

-- Exibir todos os produtos, quais ingredientes e em que quantidade são  utilizados para produzi-lo; 
SELECT prod.id AS produtos, ing.descricao, prod_ing.qtd
FROM produtos prod
    INNER JOIN produto_ingrediente prod_ing 
        ON prod.id = prod_ing.id_produto
    INNER JOIN ingredientes ing 
        ON prod_ing.id_ingrediente = ing.id
ORDER BY prod.id

-- Exibir qual a quantidade produzida de cada produto dos últimos 30 dias; 
SELECT sum(estoque)
FROM produtos
WHERE data_prod >= date_sub(curdate(), interval 30 day);

-- Se for dobrada a produção para o próximo mês, quanto de ingrediente será  necessário.  
SELECT (prod_ing.qtd * 2) AS dobro
FROM produtos prod
    INNER JOIN produto_ingrediente prod_ing 
        ON prod.id = prod_ing.id_produto
    INNER JOIN ingredientes ing 
        ON prod_ing.id_ingrediente = ing.id;

-- Mostrar os ingredientes que nunca foram utilizados; 
SELECT descricao
FROM ingredientes
WHERE id NOT IN (
    SELECT id_ingrediente
    FROM produto_ingrediente
);

-- Crie uma trigger para garantir o controle de estoque dos produtos fabricados.
-- Quanto um produto for fabricado deve dar saída dos estoque dos ingredientes utilizados.
-- Caso ocorra o estorno da fabricação, manter o estoque dos ingredientes atualizado também;
DELIMITER $$
CREATE TRIGGER estoque_ingrediente AFTER INSERT ON produtos
	FOR EACH ROW
BEGIN
	UPDATE ingredientes SET qtd = (qtd - (SELECT qtd FROM produto_ingrediente WHERE id_produto = new.id ) )
    WHERE id in (SELECT id FROM produto_ingrediente);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER devolucao AFTER INSERT ON devolucoes 
	FOR EACH ROW
BEGIN
	UPDATE ingredientes SET qtd = (qtd + (select qtd from produto_ingrediente WHERE id_produto = new.id_produto ) )
    WHERE id in (select id from produto_ingrediente);
END $$
DELIMITER ;

-- Utilizando controle de transações, atualize as receitas para reduzir em 10% a  quantidade de fermento utilizada; 
SET AUTOCOMMIT=0

START TRANSACTION

UPDATE produto_ingrediente SET qtd = (qtd * 0.9) WHERE id_ingrediente = 3;  

-- Confirme a transação do exercício anterior; 
commit               

-- Utilizando controle de transações, exclua todos os registros de produção do  último mês; 
START TRANSACTION 

DELETE produtos WHERE data_prod >= date_sub(curdate(), interval 30 DAY);

-- Desfaça a transação realizada no exercício anterior;
rollback