CREATE TABLE categorias
(
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  nome CHAR(50) NOT NULL UNIQUE
);

CREATE TABLE produtos
(
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  descricao varchar(100),
  data_cadastro DATE NOT NULL,
  valor_unitario decimal(18,2) NOT NULL,
  codigo_categoria INT NOT NULL,
  CONSTRAINT categorias_fk_produtos
    FOREIGN KEY(codigo_categoria) REFERENCES categorias(codigo)
    ON DELETE restrict
    ON UPDATE cascade
);

CREATE TABLE fornecedores
(
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  nome CHAR(50) NOT NULL UNIQUE
);

CREATE TABLE pedidos
(
  codigo int auto_increment PRIMARY KEY,
  data_pedido DATE NOT NULL,
  codigo_fornecedor INT NOT NULL,
  CONSTRAINT pedido_por_fornecedor
    FOREIGN KEY(codigo_fornecedor) REFERENCES fornecedores(codigo)
    ON DELETE restrict
    ON UPDATE cascade
);

CREATE TABLE pedido_itens
(
  id int auto_increment primary key,
  codigo_pedido INT NOT NULL,
  codigo_produto INT NOT NULL,
  quantidade decimal(12,3) default 0,
  valor_unitario decimal(18,2) NOT NULL default 0,
  
  CONSTRAINT pedidos_itens_fk_pedidos
    FOREIGN KEY(codigo_pedido) REFERENCES pedidos(codigo)
    ON DELETE restrict
    ON UPDATE cascade,

  CONSTRAINT produtos_fk_pedidos_itens
    FOREIGN KEY(codigo_produto) REFERENCES produtos(codigo)
    ON DELETE restrict
    ON UPDATE cascade
);

insert into categorias(nome)
values
    ('Detergente'),
    ('Achocolatado'),
    ('Frios');

insert into fornecedores(nome)
VALUES
    ('Oleak'),
    ('Nestle'),
    ('Frios Rezende');

insert into produtos(descricao, data_cadastro, valor_unitario, codigo_categoria)
VALUES
    ('Nescau', '2022-11-15', 7.50, 2),
    ('Toddy', '2022-11-15', 6.00, 2),
    ('Ypê Neutro', '2021-05-10', 2.99, 1),
    ('Limpol Neutro', '2021-05-10', 3.99, 1),
    ('Queijo Prato Lanche Tirolez', '2021-06-02', 18.00, 3),
    ('Presunto Cozido Tradicional Seara', '2021-06-2', 33.99, 3);

insert into pedidos(data_pedido, codigo_fornecedor)
values
  ('2022-11-01', 1),
  ('2021-04-28', 2),
  ('2021-05-15', 3);

insert into pedido_itens(codigo_pedido, codigo_produto, quantidade, valor_unitario)
VALUES
  (2, 1, 12, 5),
  (2, 2, 10, 4),
  (1, 3, 24, 1.5),
  (1, 4, 24, 2),
  (3, 5, 7, 14),
  (3, 6, 7, 25);

select descricao
from produtos
order by descricao ASC;

-- lista os produtos que foram pedidos e o nome do fornecedor de cada pedido.

select descricao, nome
from pedido_itens PI, produtos P, fornecedores F, pedidos PE
where PI.codigo_pedido = PE.codigo && PE.codigo = F.codigo && PI.codigo_produto = P.codigo;
... (9 linhas)