-- 1. Atente as tabelas abaixo.
-- Pode-se afirmar que os relacionamentos entre as tabelas Cliente e Pedido e entre as tabelas Pedido e Item são, respectivamente:

            -- 1:1 e 1:N - um cliente pode fazer mais ded um pedido
                1:N e 1:N - (resposta certa)
            -- 1:N e 1:1 - um pedido pode ter mais de um item
            -- 1:N e N:N - um pedido não necessariamente precisas de muitos itens
            -- N:N e 1:N - um cliente não necessiariamente precisa de muitos pedidos

-- Marque a resposta certa e explique por que as outras estão erradas.

-- Para a resolução dos exercícios subsequentes considere o esquema de banco de dados, nomeado “Acadêmico“, descrito abaixo: 
-- Professor (idprof, nome, email, endereço, cpf,     idcid)
-- idcid referencia cidade(idcid)
-- Aluno (idaluno, nome, endereço, telefone, idcid)
--               idcid referencia cidade(idcid)
-- Cidade(idcid, nome, UF)
-- Turma(idturma, idprof,  sala, capacidade, idcurso)
-- idcurso referencia Curso (idcurso) 
--     idprof referencia Professor (idprof)
-- Disciplina(iddidisc, nome)
-- Turdisc(idturma, iddisc)
-- idturma referencia Turma(idturma)
-- iddisc referencia Disciplina(iddisc)
-- Matricula(idaluno, idturma)
-- idaluno referencia Aluno (idaluno)
-- idturma referencia turma (idturma) 
-- Curso (idcurso, nomecurso, valorcredito)

-- 2.  Com base no esquema “Acadêmico“, analise as seguintes afirmações;

-- I -  A tabela Aluno precisa ser criada antes da tabela Disciplina, - (não precisa necessariamente ser criada antes)
-- II - Antes de criar a tabela Turdisc, as tabelas Turma e Disciplina devem estar criadas. - (Resposta correta)
-- III -  A tabela Curso pode ser a última a ser criada, - (não pois o id do curso aparece na tabela Turma)

-- É correto somente o que se afirma em:
  II (resposta correta)
--Explique por que as outras estão erradas.

-- 3. Marque a sentença que permite listar todas os nomes dos alunos juntamente com o nome da cidade onde moram, ordenado pelo nome do aluno.
-- (X)  Select aluno.nome, cidade.nome from cidade, aluno 
-- ()  Select aluno.nome, cidade.nome from aluno,cidade where cidade.id_cid=aluno.id_aluno order by aluno.nome
-- ()  Select aluno.nome, cidade.nome from cidade, aluno where cidade.nome=aluno.nome order by aluno.nome
-- ()  Select aluno.nome, cidade.nome from cidade, aluno where cidade.id_cid=aluno.id_cid 
-- ()  Select aluno.nome, cidade.nome from cidade, aluno where cidade.id_cid=aluno.id_cid order by   aluno.nome

-- Da resposta que você selecionou correta, refatore-a utilizando joins.

select aluno.nome, cidade.nome
from cidade
    inner join aluno
        on cidade.id_cid = aluno.id_cid
order by aluno.nome;

-- 4. Faça um SQL que permite atualizar o valor do crédito do curso de nome “ADS” com o acréscimo de 10%.
select valorcredito
from curso
where nomecurso = 'ADS';

update valor
set valorcredito = valorcredito * 1.10
where nomecurso = 'ADS';

-- 5. Marque a sentença que permite listar os códigos(id) das turmas com o nome da disciplina e a sala. 
-- (X)  Select id_turma, nome, sala from turma, tur_disc, disciplina where turma.id_turma=tur_disc.id_turma and disciplina.id_disc=tur_disc.id_disc
-- ()  Select id_turma, nome, sala from turma 
-- ()  Select id_turma, nome, sala from turma, disciplina where turma.id_turma=disciplina.id_disc
-- ()  Select id_turma, nome, sala from turma, disciplina where disciplina.id_disc=tur_disc.id_disc
-- ()  Select codturma, nome, sala from turma, disciplina, tur_disc

-- refatore a resposta escolhida como certa, para utilizar JOINS.

select turma.idturma, disciplina.nome, turma.sala
from turma
    inner join turdisc
        on turma.idturma = turdisc.idturma
    inner join disciplina
        on turdisc.iddisc = disciplica.iddisc;

-- 6. Defina o comando SQL para listar o nome do curso e valor do crédito para o curso que tem o valor mais baixo de crédito(valorcredito).

-- (X) Select nomecurso, min(valorcredito) from curso 
-- () Select nomecurso, valorcredito from curso where valorcredito=(select min(valorcredito) from curso)
-- () Select nomecurso, max(valorcredito) from curso
-- () Select nomecurso, valorcredito  from curso where min(curso)
-- ()Select nomecurso, min(valorcredito) from aluno where min(valorcredito) 

-- refatore a resposta escolhida como certa, para utilizar JOINS.

select nome_curso, min(valor_credito)
from curso as c1
    inner join curso as c2
        on c1.nome_curso = c2.nome_curso

-- 7. Explique o conceito Integridade Referencial. 
--De um exemplo SQL DDL para ilustrar melhor a sua explicação, 
--usando a modelagem relacional (“Academico”).
Integridade referencial garante que uma chave primaria de uma tabela e a 
chave estrangeira de uma outra tabela não tenham divergencia de dados.

create table Cidade(
    idcid int primary key auto_increment, 
    nome varchar(50), 
    UF varchar(2)
);

create table Aluno(
    idaluno int primary key auto_increment,
    nome varchar(100),
    endereço varchar(250), 
    telefone int(9),     
    idcid int
        constraint aluno_fk_cidade
            foreign key(idcid) references cidade(idcid)
        on update cascade
        on delete restrict
);

Neste exemplo, caso o ID da tabela cidade seja modificado ele também será modificado como chave estrangeira na tabela Aluno, porém, não será possível excluir uma tupla na tabela cidade na qual seu id seja uma chave estrangeira na tabela Aluno.

-- 8. Faça um SQL para adicionar a coluna data_entrada na tabela matricula.

ALTER TABLE matricula ADD data_entrada date;

-- 9. Faça um SQL para selecionar os alunos que não moram na cidade onde estudam. 
--Considerando que a cidade onde estudam é Torres. 
--Exibir o código, o nome do aluno e a cidade onde ele mora.

select aluno.idaluno, aluno.nome, cidade.nome
from aluno
    inner join cidade
        on aluno.idcid = cidade.idcid
where cidade.nome <> 'torres';
-- 10. Faça um SQL para exibir o nome do aluno, o código do curso, 
--o nome do curso e o nome do Aluno da turma e a data que ele se matriculou. 
--Apresentar somente para alunos que tenham se matriculado entre semestre 1 de 2022, 
--considere que as matrículas iniciam em janeiro.

select aluno.nome, curso.idcurso, curso.nome, Aluno.nome, matricula.data_entrada
from aluno
    inner join matricula
        on aluno.idaluno = matricula.idaluno
    inner join turma
        on matricula.idturma = turma.idturma
    inner join curso
        on turma.idcurso = curso.idcurso
    inner join Aluno
        on turma.idprof = Aluno.idprof
where 
    matricula.data_entrada between '2022-01-01' and '2022-07-01';

-- 11. Faça um SQL que liste os 2 professores que mais turmas já atenderam.
-- Importante mostrar o nome do Aluno.

select Aluno.nome, count(turma.idprof) as quantidade_turmas
from turmas
    inner join Aluno
        on turma.idprof = Alunoe.idprof
group by turma.idprof
order by quantidade_turmas desc
limit 2;