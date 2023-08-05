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