-- criando as tabelas
create table livros(
    id int primary key auto_increment,
    titulo varchar(100) not null,
    valor_unit decimal(10,2) default 0,
    data date,
    id_editora int not null,
    constraint livros_fk_editora
        foreign key(id_editora) references editoras(id)
);

create table editoras(
    id int primary key auto_increment,
    nome varchar(100) not null
);

-- populando as tabelas
INSERT INTO editoras (nome) VALUES
    ('Editora A'),
    ('Editora B'),
    ('Editora C'),
    ('Editora D'),
    ('Editora E');

INSERT INTO livros (titulo, valor_unit, data, id_editora) VALUES
    ('Livro 1', 19.99, '2022-03-31', 1),
    ('Livro 2', 25.99, '2022-04-01', 2),
    ('Livro 3', 15.99, '2022-04-02', 3),
    ('Livro 4', 9.99, '2022-04-03', 4),
    ('Livro 5', 29.99, '2022-04-04', 5);

-- Escreva uma SP que receba, como parâmetro, o CPF de um autor e retorne a quantidade de livros escrito pelo mesmo.
DELIMITER $$
CREATE PROCEDURE sp_quantidade_livros_autor (p.cpf VARCHAR(11))
BEGIN
    SELECT COUNT(*) AS quantidade_livros
    FROM livros
    WHERE cpf = p.cpf;
END $$
DELIMITER ;

CALL sp_quantidade_livros_autor ('999.999.999-99') -- cpf

-- Crie uma SP que receba, como um parâmetro, a data de publicação de um livro e seu código. O procedimento deve atualizar a tabela de livros, especificando a data de lançamento para o livro em questão.
DELIMITER $$
CREATE PROCEDURE sp_data_publicacao_livros(p_data_publi date,p_id int)
BEGIN
    UPDATE livros SET data = p_data_publi WHERE id = p_id;
END $$
DELIMITER ;

CALL sp_data_publicacao_livros(); -- data e id do livro

-- Em algumas situações, SPs são utilizados para a manutenção da segurança do banco de dados. Nestes casos, realizamos inclusões, alterações e exclusões de dados, através de SPs. Crie SPs que recebem os parâmetros adequados e realizam as seguintes operações:
-- a) Inserir uma linha na tabela de livros
-- b) Excluir uma linha da tabela de livros
-- c) Atualizar valores na tabela de livros

DELIMITER $$
CREATE PROCEDURE sp_cud_produtos(p_id int, p_nome varchar(100), op char(1))
BEGIN
    IF(op = '1') THEN
        INSERT INTO produtos(nome) VALUES(p_nome);
    ELSEIF(op = '2') THEN
        DELETE FROM produtos WHERE id = p_id;
    ELSEIF(op = '3') THEN
        UPDATE produtos SET nome = p_nome WHERE id = p_id;
    END IF;
END $$
DELIMITER ;

CALL sp_cud_livros(); -- id do livro, titulo, operacao

-- Crie uma SP que aumente ou diminua o valor dos preços dos livros de uma editora específica. O aumento pode ser em percentual ou em valor.

DELIMITER $$
CREATE PROCEDURE sp_alterar_precos_editora(
    p_id_editora int,
    p_valor decimal(10,2),
    p_percentual decimal(5,2),
    op varchar(2))
BEGIN
    -- Verificar a operação
    IF op = '%+' THEN
        UPDATE livros SET valor_unit = valor_unit * (1 + p_percentual/100) WHERE id_editora = p_id_editora;
    ELSEIF op = '%-' THEN
        UPDATE livros SET valor_unit = valor_unit * (1 - p_percentual/100) WHERE id_editora = p_id_editora;
    ELSEIF op = '+' THEN
        UPDATE livros SET valor_unit = valor_unit + p_valor WHERE id_editora = p_id_editora;
    ELSEIF op = '-' THEN
        UPDATE livros SET valor_unit = valor_unit - p_valor WHERE id_editora = p_id_editora;
    END IF;
END$$
DELIMITER ;

call sp_alterar_precos_editora(); --id da editora, preco, percentual, operacao

SELECT * FROM livros;