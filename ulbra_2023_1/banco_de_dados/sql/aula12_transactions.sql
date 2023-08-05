-- 1
CREATE TABLE pessoas(
  num_pessoa INT NOT NULL,
  nome_email VARCHAR(100) NOT NULL,
  PRIMARY KEY (num_pessoa)
);

INSERT INTO pessoas
(num_pessoa, nome_email)
VALUES
(78360, 'rst.marcondes@smail.com'),
(78361, 'jcc.meirelles@jmail.com'),
(78362, 'mjk.amadeus@imail.com');

-- 2
select * from pessoas;

-- 3
CREATE TABLE PESSOA_FISICA (
  num_pessoa_pf INT NOT NULL,
  nom_pessoa VARCHAR(100) NOT NULL,
  num_CPF VARCHAR(11) NOT NULL,
  num_documento_identidade VARCHAR(20) NOT NULL,
  nom_orgao_emissor_doc_ident VARCHAR(50) NOT NULL,
  dat_nascimento DATE NOT NULL,
  idt_sexo CHAR(1) NOT NULL,
  cod_estado_civil INT NOT NULL,
  PRIMARY KEY (num_pessoa_pf)
);

INSERT INTO PESSOA_FISICA
(num_pessoa_pf, nom_pessoa, num_CPF, num_documento_identidade, nom_orgao_emissor_doc_ident, dat_nascimento, idt_sexo, cod_estado_civil)
VALUES
(78360, 'Roberto Marcondes', '99911122233', '19999888', 'SSP', '1988-03-15', 'M', 1),
(78361, 'Julio Meirellies', '99811233134', '18888999', 'SSP', '1975-02-17', 'M', 1),
(78362, 'Maria Rita Amadeu', '99711333235', '17777888', 'SSP', '1980-12-23', 'F', 1);

-- 4
select * from PESSOA_FISICA;

-- 5
UPDATE pessoa_fisica SET nom_pessoa = 'Júlio Meirelles', cod_estado_civil = '2' WHERE num_pessoa_pf = '78361';

-- 6
select * from PESSOA_FISICA;

-- 7
rollback;

-- 8
select * from PESSOA_FISICA WHERE num_pessoa_pf = '78361';

-- 9
-- 