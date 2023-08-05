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