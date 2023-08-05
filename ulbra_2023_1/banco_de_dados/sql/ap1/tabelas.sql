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