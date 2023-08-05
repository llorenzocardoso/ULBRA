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
-- delete (1, null, null, null,'d')

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

-- 3 - cud fornecedores
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

-- 4 - vincular produto a um fornecedor
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

-- 5 - pesquisar vendas em um periodo especifico;
DELIMITER //

CREATE PROCEDURE buscar_vendas_mes(
    mes int, 
    ano int)
BEGIN
  DECLARE data_inicio DATE;
  DECLARE data_fim DATE;

  SET data_inicio = DATE(CONCAT(ano, '-', mes, '-01'));
  SET data_fim = LAST_DAY(data_inicio);

  SELECT *
  FROM vendas
  WHERE data BETWEEN data_inicio AND data_fim;
END //

DELIMITER ;

call buscar_vendas_mes();