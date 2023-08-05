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