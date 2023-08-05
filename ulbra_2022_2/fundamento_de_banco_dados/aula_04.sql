-- criando as tables
create table categorias(
    id int primary key auto_increment,
    nome varchar(100) not null
);

create table produtos(
    id int primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(12,2) not null,
    data_cad date not null,
    id_categoria int not null,
    constraint produtos_fk_categorias
        foreign key(id_categoria) references categorias(id)
);

create table vendas(
    id int primary key auto_increment,
    data_venda date not null,
    id_cliente not null
);

create table vendas_itens(
    id int primary key auto_increment,
    qtd int not null,
    valor_unit int not null,
    id_venda int not null,
    constraint vendas_itens_fk_vendas
        foreign key(id_venda) references vendas(id)
    id_produtos int not null
        foreign key(id_produtos) references produtos(id)
);

-- inserindo a coluna na table acessorios
insert into categorias(nome)
    values('acessorios');

-- atualizando o preço
UPDATE produtos
set preco = 9.90
where id = 202;

-- deletando a coluna com o id 204
delete from produtos
where id = 204;

-- faça uma query que liste todos os produtos que custam mais de 1000 reais.
select id, nome, preco
from produtos
where preco >= 1000;

-- na consulta anterior, crie uma nova coluna acrescentando 10% ao preço
select id, nome, preco (preco.1.10) as novo_preco
from produtos
where preco >= 1000;

-- produtos que custam mais de 1000, cadastrados em novembro
select id, nome, preco (preco.1.10) as novo_preco
from produtos
where preco >= 1000 
and data_cad >= '2022-11-01'
and data_cad <= '2022-11-30' /*data_cad between '2022-11-01' and '2022-11-30'*/

-- liste a soma dos produtos cadastrados no mês de setembro e outubro
/*
agregacao
max - maximo
min - minimo
sum - soma
count - contagem // retorna o numero de linhas retornadas por uma consulta
avg - media
*/
select sum(preco) as soma
from produtos
where data_cad >= '2022-09-01'
and data_cad <= '2022-10-31';

-- mostrar na consulta o nome das categorias junto aos produtos
select p.id, p.nome, c.nome, as categorias
from produtos p, categorias c
where p.id_categoria = c.id;

-- mostrar na consulta as vendas, os produtos e os clientes
select p.id,p.nome,vi.qtd
from vendas p, vendas_itens vi, produtos p
where v.id = vi.id_venda
and p.id = vi.id_produtos

-- mostrar os produtos que começam com celular
p.nome like 'celular%';

-- mostrar os produtos que terminam com celular
p.nome like '%celular';

-- mostrar os produtos que tem celular
p.nome like '%celular%';

-- mostre os produtos vendidos no mês de outubro e o valor total de cada produto vendido

select p.id, p.nome, vi.qtd, vi.id, vi.valor_unit as total
from produtos p, vendas vi, vendas v
where v.id = vi.vendas
and vi.id_produtos=p.id
and data_venda >= '2022-10-01'
and data_venda <= '2022-10-31'

/*
        salas
         num
         316
         317
         326
         327

        alunos
id       sala       nome
1        316        joao
2        316        alice
3        316        ana
4        317        aa
5        317        xx
6        326        bb
7        326        ccc
8        326        dd
9        326        ee
10       327        bbb
*/

-- somar os alunos das salas 326 e 327
select sala, count(id) as num
from alunos
where sala = 326 and sala = 327
group by sala;

-- preco mais alto dos produtos por categoria

select c.nomes as categoria, max(p.preco) as val_alto
from categorias c, produtos p
where c.id = p.id_categoria
group by c.nome;
/*
    order by

    select *
    from produtos
    order by preco desc | desc = decrecente
    order by preco asc | asc = crescente

*/
