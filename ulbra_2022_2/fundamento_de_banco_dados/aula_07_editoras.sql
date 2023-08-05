create database fdb;

create table editoras(
    id int auto_increment primary key,
    nome varchar(40) not null
);

create table assuntos(
    id char(1) primary key,
    descricao varchar(40)
);

create table autores(
    matricula int primary key,
    nome varchar(40),
    cpf varchar(11),
    endereco varchar(50),
    data_nascimento date,
    nacionalidade varchar(30)
);

create table livros(
    id int auto_increment primary key,
    titulo varchar(80),
    preco double,
    lancamento date,
    id_assunto char(1),
    id_editora int,
    constraint livros_fkindex1
    foreign key (id_editora) references editoras(id)
        on update cascade
        on delete restrict,
    constraint livros_fkindex2
    foreign key (id_assunto) references assuntos(id)
        on update cascade
        on delete restrict
);

create table autores_livros(
    matricula int,
    id_livro int,
    constraint autores_has_livros_fkindex1
    foreign key (matricula) references autores(matricula)
        on update cascade
        on delete restrict,
    constraint autores_has_livros_fkindex2
    foreign key (id_livro) references livros(id)
);

insert into editoras(id, nome)
    values
        (1, 'Mirandela Editora')
        (2, 'Editora Via-Norte')
        (3, 'Editora Ilhas Tijucas')
        (4, 'Maria José Editora');

insert into assuntos(id, descricao)
    values
        (b, 'BANCO DE DADOS')
        (p, 'PROGRAMAÇÃO')
        (r, 'REDES')
        (s, 'SISTEMAS OPERACIONAIS');

insert into livros(id, titulo, preco, lancamento, idAssunto, idEditora)
    values
        (1, 'BANCO DE DADOS PARA A WEB', 31.20, '1999-01-10', 'B', 1),
        (2, 'PROGRAMANDO EM LINGUAGEM C', 30.00, '1997-10-10', 'P', 1),
        (3, 'PROGRAMANDO EM LINGUAGEM C++', 111.50, '1998-11-01', 'P', 3),
        (4, 'BANCO DE DADOS NA BIOINFORMATICA', 48.00, null, 'B', 2),
        (5, 'REDES DE COMPUTADORES', 42.00, '1996-09-01', 'R', 2),
        (6, 'BANCO DE DADOS DISTRIBUÍDO', 200, '2029-01-01', 'B', 2);


insert into autores(matricula, nome, CPF, endereco, data_nascimento, nacionalidade)
    VALUES
        (1, 'Ana da Silva', '52036883389', 'Tangará da Serra, MT', '1965-05-08', 'Brasileiro'),
        (2, 'Matias Delipetro', '35318381057', 'Teresina, PI', '1970-02-03', 'Brasileiro'),
        (3, 'Thiago Elias', '53405707706', 'Uberlândia, MG', '2000-10-11', 'Brasileiro'),
        (4, 'Mark Oda', '', 'Colombus, OH', '1960-10-11', 'Americano'),
        (5, 'Marcos Marrocos', '', 'RIO DE JANEIRO, OH', '1960-10-11', 'Americano'),
        (6, 'Rick Ryordan', '', '', NULL, 'Brasileiro');


insert into autores_livros(matricula, idLivro)
    VALUES
        (1, 1), (1, 4), (1, 6),
        (5, 1), 
        (2, 2), (2, 3),
        (4, 5);
        
-- 3A Monte um comando para excluir da tabela livros aqueles que possuem o código maior ou igual a 2, que possuem o preço maior que R$ 50,00 e que já foram lançados.ss
delete from livros where id >= 2 && preco > 50 && lancamento < CURRENT_DATE;

-- 3BEscreva o comando que seleciona as colunas NOME, CPF e ENDERECO, da tabela AUTOR, para aqueles que possuem a palavra ‘joão’ no nome.
select nome, CPF, endereco
from autores
where nome like '%joão%';

-- 3C Excluir o livro cujo título é ‘BANCO DE DADOS DISTRIBUÍDO’ ou ‘BANCOS DE DADOS DISTRIBUÍDOS’. Somente essas duas opções devem ser consideradas.
delete from livros where titulo like 'BANCO DE DADOS DISTRIBUÍDO%';

-- 3D Selecione o nome e o CPF de todos os autores que nasceram após 01 de janeiro de 1990.
select nome, CPF
from autores
where data_nascimento > '1990-01-01';

-- 3E Selecione a matrícula e o nome dos autores que possuem RIO DE JANEIRO no seu endereço.
select nome, matricula
from autores
where endereco like '%rio de janeiro%';

-- 3F Atualize para zero o preço de todos os livros onde a data de lançamento for nula ou onde seu preço atual for inferior a R$ 55,00.
update livros
set preco = 0
where lancamento = null || preco < 55.00;

-- 3G Exclua todos os livros ondo o assunto for difrente de 'S', 'P' ou 'B'
delete from livros where idAssunto != 'S' && idAssunto != 'P' && idAssunto != 'B';

-- 3H Escreva o comando para contar quantos sao os autores cadastrados na tabela autores
select COUNT(matricula) as quantidade
from autores;

-- 3I Escreva o comando que apresenta qual o número médio de autores de cada livro. Você deve utilizar, novamente, a tabela AUTOR_LIVRO.
select count(matricula) as autorPorLivro
from autores_livros
group by matricula;

-- 3J Apresente o comando SQL para gerar uma listagem dos códigos dos livros que possuem a menos dois autores.
select idLivro, count(matricula) as quantidade_autores, livros.titulo
from autores_livros
    inner join livros
        on livros.id = autores_livros.idLivro
group by idLivro
having quantidade_autores >= 2;

-- 3K Escreva o comando para apresentar o preço médio dos livros por código de editora. Considere somente aqueles que custam mais de R$ 45,00.
select avg(preco) as media_preco, idEditora
from livros
where preco > 45
group by idEditora;

-- 3L Apresente o preço máximo, o preço mínimo e o preço médio dos livros cujos assuntos são ‘S’ ou ‘P’ ou ‘B’, para cada código de editora.
select max(preco) as preco_maximo, min(preco) as preco_minimo, avg(preco), idEditora
from livros
where idAssunto = 'S' or idAssunto = 'P' or idAssunto = 'B'
group by idEditora;

-- 3M Altere o comando do exercício anterior para só considerar os livros que já foram lançados (data de lançamento inferior a data atual) e cujo o preço máximo é inferior a R$ 100,00.
select max(preco) as preco_maximo, min(preco) as preco_minimo, avg(preco), idEditora
from livros
where (idAssunto = 'S' or idAssunto = 'P' or idAssunto = 'B') and lancamento < CURRENT_DATE
group by idEditora
having preco_maximo < 100;

-- 4A Estão sendo estudados aumentos nos preços dos livros. Escreva o comando SQL que retorna uma listagem contendo o titulo dos livros, e mais três colunas: uma contendo os preços dos livros acrescidos de 10% (deve ser chamada de ‘Opção_1’), a segunda contendo os preços acrescidos de 15% (deve ser chamada de ‘Opção_2’) e a terceira contendo os preços dos livros acrescidos de 20% (deve ser chamada de ‘Opção_3’). Somente devem ser considerados livros que já tenham sido lançados.
select titulo, preco + (preco * 10 / 100) as Opção_1, preco + (preco * 15 / 100) as Opção_2, preco + (preco * 20 / 100) as Opção_3
from livros
where lancamento < CURRENT_DATE;

-- 4B Escreva o comando SQL que apresenta uma listagem contendo o código da editora, o nome da editora, a sigla do assunto e o titulo dos livros que já foram lançados. Os dados devem estar em ordem decrescente de preço, e ascendente de código da editora e de título do livro.
select E.id, E.nome, L.idAssunto, L.titulo, L.preco
from livros L
    inner join editoras E
        on L.idEditora = E.id && L.lancamento < CURRENT_DATE
order by L.preco DESC, L.idEditora ASC, L.titulo ASC;

-- 4C Escreva o comando que apresente uma listagem dos nomes dos autores e do seu ano e mês de nascimento, para os autores brasileiros e que tem livros ainda não lançados. A listagem deve estar ordenada em ordem crescente de nome.
select A.nome, CONCAT(month(data_nascimento), '/', year(data_nascimento)) as nascimento, L.titulo, L.lancamento
from autores_livros AL
    inner join autores A
        on AL.matricula = A.matricula
    inner join livros L
        on AL.idLivro = L.id
where L.lancamento > CURRENT_DATE
order by A.nome DESC;

-- 4D Escreva o comando que retorna o nome dos autores e o título dos livros de sua autoria. A listagem deve estar ordenada pelo nome do autor, mostrar somente os livros já lançados.
select A.nome, L.titulo
from autores_livros AL
    right join autores A
        on A.matricula = AL.matricula
    inner join livros L
        on AL.idLivro = L.id
where L.lancamento <= CURRENT_DATE
ORDER BY A.nome;


-- 4E Monte a consulta SQL que retorna as editoras que publicaram livros escritos pela autora 'Ana da Silva'
select E.nome, L.titulo, A.nome
from autores_livros AL
    inner join livros L
        on L.id = AL.idLivro
    inner join autores A
        on A.matricula = AL.matricula
    inner join editoras E
        on E.id = L.idEditora
having A.nome = 'Ana da Silva';

-- 4F FUS (faça um SQL) que apresente o título do livro e o nome da editora que o publica para todos os livros que custam menos que 50 reais.
select L.titulo, E.nome, L.preco
from livros L
    inner join editoras E
        on L.idEditora = E.id
having L.preco < 50;

-- 4G FUS que apresente o CPF, nome do autor e o preço máximo dos livros de sua autoria. Apresente somente as informações para os autores cujo preço máximo for superior a 50.
select A.CPF, A.nome, max(L.preco) as max_preço
from autores_livros AL
    inner join autores A
        on A.matricula = AL.matricula
    inner join livros L
        on L.id = AL.idLivro
group by AL.matricula
having max_preço > 50;