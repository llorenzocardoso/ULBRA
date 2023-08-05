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