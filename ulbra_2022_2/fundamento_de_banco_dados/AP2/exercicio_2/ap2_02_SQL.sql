create table pesquisadores(
    id int auto_increment primary key,
    nome varchar(50)
);

create table artigos(
    id int auto_increment primary key,
    titulo varchar(100) not null,
    pag_inicial int,
    pag_final int,
    cod_periodico varchar(14) not null,
    titulo_periodico varchar(100),
    editora varchar(30)
);

create table artigos_tem_pesquisadores(
    id_artigo int,
    id_pesquisador int,
    constraint artigos_fk_artigos_tem_pesquisadores
    foreign key(id_artigo) REFERENCES artigos(id)
        on delete cascade
        on update cascade,
    constraint pesquisadores_fk_artigos_tem_pesquisadores
    foreign key(id_pesquisador) references pesquisadores(id)
        on delete restrict
        on update cascade
);

insert into pesquisadores(nome)
    VALUES
        ('Lorenzo Cardoso'),
        ('João Gomes'),
        ('Vitor Bernardino'),
        ('Maikel Peixouto'),
        ('João Mingibaba'),
        ('João Vitor'),
        ('Mateus João'),
        ('Bernardo Alves');

insert into artigos(id, titulo, pag_inicial, pag_final, cod_periodico, titulo_periodico, editora)
    values
        (1234, 'Disband da LOUD', 1, 2, 'ABCDE123456789', 'Time da LOUD da Disband e fãs ficam preocupados', 'Saraiva'),
        (1, 'Dia do gaucho', 1, 10, 'ABCDEFG3456789', 'História da revolução farroupilha', 'Saraiva'),
        (2, 'Armas com cadastro vencido', 1, 20, 'ABCDEDFG456789', 'Nos primeiros 6 meses do ano, mais de 117 mil novas armas foram registradas', 'darkside'),
        (3, 'Eleições dia 30', 13, 22, 'ABCDESF123456', 'Tudo que você precisa saber sobre as eleições', 'CBN');
        

insert into artigos_tem_pesquisadores(id_pesquisador, id_artigo)
    VALUES
        (1, 1234),
        (1, 2),
        (2, 1),
        (3, 3),
        (4, 1234),
        (5, 1),
        (6, 3);
        
-- Listar o artigo com código 1234
select id, titulo from artigos where id = 1234;

-- Listar os artigos da editora Saraiva.
select titulo, editora from artigos where editora like '%saraiva%';

-- Listar os pesquisadores onde o nome inicia com João.
Select nome from pesquisadores where nome like 'joão%';