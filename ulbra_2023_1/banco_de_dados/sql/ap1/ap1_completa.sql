-- criando as tabelas
CREATE TABLE fornecedores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE vendedores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL
);

CREATE TABLE produtos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
);

CREATE TABLE produtos_fornecedores(
    id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    PRIMARY KEY (id_produto, id_fornecedor),
        FOREIGN KEY (id_produto) REFERENCES produtos(id),
        FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE vendas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(50) NOT NULL,
    id_vendedor INT NOT NULL,
    CONSTRAINT venda_fk_vendedor
        FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE vendas_produtos(
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_venda, id_produto),
        FOREIGN KEY (id_venda) REFERENCES vendas(id),
        FOREIGN KEY (id_produto) REFERENCES produtos(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- populando as tabelas
INSERT INTO fornecedores (nome) VALUES
    ('Fornecedor A'),
    ('Fornecedor B'),
    ('Fornecedor C'),
    ('Fornecedor D'),
    ('Fornecedor E');

INSERT INTO vendedores (nome, cpf) VALUES
    ('Lucas Silva', '123.456.789-00'),
    ('Mariana Santos', '111.222.333-44'),
    ('Pedro Souza', '555.444.333-22'),
    ('Lara Lima', '777.888.999-00'),
    ('Gabriel Oliveira', '000.111.222-33');

INSERT INTO produtos (nome, preco, quantidade) VALUES
    ('Caneta esferográfica preta', 1.50, 500),
    ('Lápis de cor 12 cores', 12.00, 200),
    ('Borracha branca', 0.50, 1000),
    ('Caderno universitário 10 matérias', 18.00, 150),
    ('Mochila escolar', 50.00, 80),
    ('Régua de 30cm', 2.00, 300),
    ('Agenda 2023', 10.00, 200),
    ('Giz de cera 12 cores', 5.00, 250),
    ('Papel sulfite A4 500 folhas', 20.00, 300),
    ('Tesoura escolar', 4.00, 150);

INSERT INTO produtos_fornecedores (id_produto, id_fornecedor) VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 3),
    (6, 4),
    (7, 4),
    (8, 2),
    (9, 5),
    (10, 5);

INSERT INTO vendas (data, total, metodo_pagamento, id_vendedor) VALUES
    ('2023-04-01', 45.00, 'Cartão de crédito', 1),
    ('2023-04-02', 24.50, 'Dinheiro', 2),
    ('2023-04-03', 120.00, 'Cartão de débito', 3),
    ('2023-04-04', 72.80, 'Cartão de crédito', 4),
    ('2023-04-05', 35.00, 'Dinheiro', 5);
    

INSERT INTO vendas_produtos (id_venda, id_produto, quantidade) VALUES
    (1, 1, 10),
    (1, 3, 20),
    (2, 2, 3),
    (2, 3, 5),
    (3, 4, 2),
    (3, 5, 1),
    (4, 6, 10),
    (4, 7, 5),
    (5, 8, 4),
    (5, 9, 2);

-- fazendo as views

-- produtos em estoque
CREATE VIEW produtos_em_estoque 
AS
SELECT id, nome, preco, quantidade
FROM produtos
WHERE quantidade > 0;

select * from produtos_em_estoque;

-- produtos de fornecedores
CREATE VIEW produtos_de_fornecedores
AS
SELECT f.nome as fornecedor, p.nome as produto
FROM produtos p
	INNER JOIN produtos_fornecedores pf
		on p.id = pf.id_produto
    INNER JOIN fornecedores f 
		on f.id = pf.id_fornecedor;

select * from produtos_de_fornecedores;

-- saida de produtos
CREATE VIEW saida_produtos
AS
SELECT vp.id_venda, vp.id_produto, p.nome AS produtos, vp.quantidade, v.data
FROM vendas_produtos vp
    INNER JOIN produtos p 
        ON vp.id_produto = p.id
    INNER JOIN vendas v 
        ON vp.id_venda = v.id;

select * from saida_produtos;

-- produtos mais vendidos
CREATE VIEW produtos_mais_vendidos 
AS
SELECT p.nome AS produto, SUM(vp.quantidade) AS quantidade_total
FROM produtos p
    INNER JOIN vendas_produtos vp 
        ON p.id = vp.id_produto
GROUP BY p.id
ORDER BY quantidade_total DESC;

select * from produtos_mais_vendidos;

-- fornecedores que nao tiveram produtos vendidos
CREATE VIEW fornecedores_sem_vendas 
AS
SELECT f.id, f.nome as fornecedor
FROM fornecedores f
    LEFT JOIN produtos_fornecedores pf
        ON pf.id_fornecedor = f.id
    LEFT JOIN vendas_produtos vp 
        ON vp.id_produto = pf.id_produto
WHERE vp.id_venda IS NULL;

select * from fornecedores_sem_vendas;

-- stored procedures
-- 1 - cud produtos
DELIMITER $
CREATE PROCEDURE sp_cud_produtos(
    p_id int, 
    p_nome varchar(100), 
    p_preco decimal(10,2), 
    p_quantidade int, 
    oper char(1)
)
BEGIN
    IF(oper = 'C') THEN
        INSERT INTO produtos(nome, preco, quantidade) VALUES(p_nome, p_preco, p_quantidade);
    ELSEIF(oper = 'U') THEN
        UPDATE produtos SET nome = p_nome, preco = p_preco, quantidade = p_quantidade WHERE id = p_id;
    ELSEIF(oper = 'D') THEN
        DELETE FROM produtos WHERE id = p_id;
    END IF;
END $
DELIMITER ;

call sp_cud_produtos()
select * from produtos
-- exemplos
-- insert (null, 'produto teste', 20.5, 15,'c')
-- update (1, 'update produto teste', 10.25, 10, 'u')
-- update (1, 'nome aleatorio', 10.00, 5,'d')

-- 2 - aumentar o valor do produto em valor ou em porcentagem
DELIMITER //
CREATE PROCEDURE atualizar_preco_produto(
    produto_id INT,
    valor DECIMAL(10, 2),
    percentual DECIMAL(10, 2),
    operacao CHAR(1) -- '+' para aumentar, '-' para diminuir
)
BEGIN
    DECLARE preco_atual DECIMAL(10, 2);
    SELECT preco INTO preco_atual FROM produtos WHERE id = produto_id;
    
    IF percentual IS NOT NULL THEN
        IF operacao = '+' THEN
            SET valor = preco_atual * percentual / 100;
        ELSEIF operacao = '-' THEN
            SET valor = preco_atual *  (1 - percentual/100);
        END IF;
    END IF;
    
    IF valor IS NOT NULL THEN
        IF operacao = '+' THEN
            SET preco_atual = preco_atual + valor;
        ELSEIF operacao = '-' THEN
            SET preco_atual = preco_atual - valor;
        END IF;
    END IF;
    
    UPDATE produtos SET preco = preco_atual WHERE id = produto_id;
END //
DELIMITER ;

call atualizar_preco_produto()
select * from produtos;
-- exemplos
-- percentual + (5, null, 100, "+")
-- percentual - (5, null, 50, "-")
-- valor + (5, 50, null, "+")
-- valor - (5, 10, null, "+")

-- 3 - cud vendedores
DELIMITER $$
CREATE PROCEDURE sp_cud_vendedores(
    p_id INT,
    p_nome VARCHAR(100), 
    p_cpf VARCHAR(14), 
    p_op CHAR(1))
BEGIN
    IF p_op = 'C' THEN
        INSERT INTO vendedores(nome, cpf) VALUES (p_nome, p_cpf);
    ELSEIF p_op = 'U' THEN
        UPDATE vendedores SET nome = p_nome, cpf = p_cpf WHERE id = p_id;
    ELSEIF p_op = 'D' THEN
        DELETE FROM vendedores WHERE id = p_id;
    END IF;
END $$
DELIMITER ;

call sp_cud_vendedores() 
select * from vendedores;
-- exemplos
-- insert (null, 'nome teste', '999.999.999-99','c')
-- update (1, 'update nome teste', '123.456.789-10','u')
-- delete (1, null, '109.876.543-21','d')

-- 4 - cud fornecedores
DELIMITER $$
CREATE PROCEDURE sp_cud_fornecedores(
    p_id INT,
    p_nome VARCHAR(100), 
    p_op CHAR(1))
BEGIN
    IF p_op = 'C' THEN
        INSERT INTO fornecedores(nome) VALUES (p_nome);
    ELSEIF p_op = 'U' THEN
        UPDATE fornecedores SET nome = p_nome WHERE id = p_id;
    ELSEIF p_op = 'D' THEN
        DELETE FROM fornecedores WHERE id = p_id;
    END IF;
END $$
DELIMITER ;

call sp_cud_fornecedores(null, 'lorenzo',"c")
select * from fornecedores
-- exemplos
-- insert (null, 'teste',"c")
-- update (3, 'lorenzo',"u")
-- delete (1, null,"d")

-- 5 - vincular produto a um fornecedor
DELIMITER $$
CREATE PROCEDURE sp_vincular_produto_fornecedor(
    p_id_produto int, 
    p_id_fornecedor int)
BEGIN
    INSERT INTO produtos_fornecedores(id_produto, id_fornecedor)
    VALUES(p_id_produto, p_id_fornecedor);
END $$
DELIMITER ;

call sp_vincular_produto_fornecedor();
select * from produtos_fornecedores
-- exemplos
-- (5,1)