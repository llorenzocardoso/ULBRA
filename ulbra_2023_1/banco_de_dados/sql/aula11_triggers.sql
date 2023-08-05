-- tabelas
create table produtos(
    prd_codigo INT PRIMARY KEY auto_increment,
    prd_descricao VARCHAR(200) NOT NULL,
    prd_valor DECIMAL(10,2),
    prd_qtd_estoque INT NOT NULL,
    prd_falta INT NOT NULL,
    prd_status INT NOT NULL
);

create table orcamentos(
    orc_codigo INT PRIMARY KEY auto_increment,
    orc_data DATE NOT NULL,
    orc_status BOOLEAN NOT NULL
);

create table orcamentos_produtos(
    prd_codigo INT NOT NULL,
    orc_codigo INT NOT NULL,
    orp_qtd INT NOT NULL,
    orp_valor DECIMAL(10,2) NOT NULL,
    orp_status INT NOT NULL,
    PRIMARY KEY(prd_codigo, orc_codigo),
        FOREIGN KEY(prd_codigo) REFERENCES produtos(prd_codigo),
        FOREIGN KEY(orc_codigo) REFERENCES orcamentos(orc_codigo)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
);

-- triggers

-- Faça um trigger para alterar o estoque de um produto quando ocorrer quaisquer alterações na tabela orçamentos_produtos. Também irá alterar o estoque, quando um ítem na tabela orçamentos_Produtos for cancelado. Isso ocorre quando o campo Orp_Status recebe o valor 2.
DELIMITER //
CREATE TRIGGER atualizar_estoque AFTER INSERT ON orcamentos_produtos
FOR EACH ROW
BEGIN
  UPDATE produtos
  SET prd_qtd_estoque = prd_qtd_estoque - NEW.orp_qtd
  WHERE prd_codigo = NEW.prd_codigo;
END//
DELIMITER ;
-- ---------------------------------
DELIMITER //
CREATE TRIGGER cancelar_item AFTER UPDATE ON orcamentos_produtos
FOR EACH ROW
BEGIN
  IF NEW.orp_status = 2 THEN
    UPDATE produtos SET prd_qtd_estoque = prd_qtd_estoque + OLD.orp_qtd WHERE prd_codigo = OLD.prd_codigo;

  ELSE NEW.orp_status <> OLD.orp_status THEN
    UPDATE produtos SET prd_qtd_estoque = prd_qtd_estoque - NEW.orp_qtd + OLD.orp_qtd WHERE prd_codigo = NEW.prd_codigo;

  END IF;
END//
DELIMITER ;

-- Faça um trigger para armazenar em uma tabela chamada produtos_atualizados (prd_codigo, prd_qtd_anterior, prd_qtd_atualizada, prd_valor) quando ocorrer quaisquer alterações nos atributos da tabela produtos. No entanto, caso a alteração atribua o valor zero para o atributo prd_qtd_estoque, a tabela produtos_em_falta deverá ser alimentada com as mesmas informações da tabela produto, exceto o atributo prd_valor. Além disso, o atributo prd_status do produto atualizado deve ser modificado para NULL e o atributo orp_status de todos os orcamentos_produtos desse produto deverá ser modificado também para NULL. 
DELIMITER //
CREATE TRIGGER produtos_trigger
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
    DECLARE qtd_anterior INT;
    DECLARE qtd_atualizada INT;
    SET qtd_anterior = OLD.prd_qtd_estoque;
    SET qtd_atualizada = NEW.prd_qtd_estoque;
    
    INSERT INTO produtos_atualizados (prd_codigo, prd_qtd_anterior, prd_qtd_atualizada, prd_valor)
    VALUES (NEW.prd_codigo, qtd_anterior, qtd_atualizada, NEW.prd_valor);
    
    IF qtd_atualizada = 0 THEN
        INSERT INTO produtos_em_falta (prd_codigo, prd_descricao, prd_status)
        SELECT prd_codigo, prd_descricao, NULL FROM produtos WHERE prd_codigo = NEW.prd_codigo;
        
        UPDATE produtos SET prd_status = NULL WHERE prd_codigo = NEW.prd_codigo;
        UPDATE orcamentos_produtos SET orp_status = NULL WHERE prd_codigo = NEW.prd_codigo;
    END IF;
END//
DELIMITER ;