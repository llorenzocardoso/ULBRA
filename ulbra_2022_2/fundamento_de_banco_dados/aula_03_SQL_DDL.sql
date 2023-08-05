create table categorias(
    id int auto_increment primary key,
    nome varchar(100) not null
);

create table produtos(
    id int primary key,
    descricao varchar(200) not null,
    data_cadastro date not null,
    valor_unitario decimal(12,2) not null,
    id_categoria int not null,
    constraint categorias_fk_produtos
    foreign key(id_categoria) references categorias(id)  
        on delete restrict
        on update cascade
);

create table fornecedores(
    id int auto_increment primary key,
    nome varchar(100) not null
);

create table pedidos(
    id int auto_increment primary key,
    data_pedido date not null, 
    id_fornecedor int not null, 
    constraint fornecedores_fk_pedidos
        foreign key(id_fornecedor) references fornecedores(id)
            on update cascade
            on delete restrict

);

create table pedidos_produtos(
    id_pedido int not null,
    id_produto int not null,
    quantidade decimal(8,3) not null ,
    valor_unitario decimal(12,2) not null,
    constraint pedidos_fk_pedidos_produtos
        foreign key(id_pedido) references pedidos(id)  
        on delete restrict
        on update cascade,
    constraint produtos_fk_pedidos_produtos
        foreign key(id_produto) references produtos(id)
        on delete restrict
        on update cascade
);

-- 3) Faça um comando (FUC) para adicionar o campo data_ultima_compra na tabela fornecedor.
alter table fornecedores add column data_ultima_compra date not null;

-- 4)FUC para alterar o nome do atributo data em PEDE para data_pedido.
alter table pede change column data data_pedido datetime;

-- 5)FUC para deletar o campo data_cadastro em produtos.
alter table produtos drop data_cadastro;

-- 6) FUC para adicionar na relação categoria e produto para o delete ser em cascata e o update ser restrict.
alter table produtos drop constraint produtos_fk_categorias
alter table produtos
add constraint produtos_fk_categorias
    foreign key(id_categoria) references categorias(id)
        on delete cascade
        on update restrict;

-- 7) FUC para aumentar o tamanho do domínio do campo nome do fornecedor para mais 30 caracteres.
alter table fornecedores modify nome varchar(30);

-- 8) FUC para apagar a tabela fornecedor. Explique o que vai acontecer com o seu esquema e as consequências disso.
drop table fornecedores;
--O SGBD vai verificar se existe algum pedido com o fornecedor, caso tenha, ele não permitirá a remoção da tabela fornecedores.

-- 9) FUC para adicionar o número do pedido em PEDE. Este número deve aceitar caracteres.
alter table pede modify quantidade varchar(50);

-- 10) Popule as tabelas utilizando comandos insert. 
insert into fornecedores(nome,data_ultima_compra) 
    values('Lorenzo da Cunha Cardoso','2022-10-16');

insert into categorias(nome)
    values('Salgados');

insert into produtos(id,descricao, data_cadastro, valor_unitario, id_categoria)
    values(2,'Pastel de frango com requeijão','2022-10-16 20:37:41','8.00',1);

insert into pede(quantidade, valor_unitario, data_pedido,id_produto,id_fornecedor)
    values('Dois','8.00','2022-10-16 20:38:41',2,1);

-- 11)Exclua um produto, ilustre o comando e explique a restrição de integridade.
delete from produtos
where id = 2;

-- O SGBD verifica se o valor que será deletado está sendo usado em outra linha da tabela produtos, se estiver sendo usado, o ID não poderá ser deletado.

-- 12) Atualize a chave primária de um produto, ilustre o comando e explique a restrição de integridade.
UPDATE produtos
set id = 1
where id = 2;
-- O SGBD verifica se o valor que será atualizado não está sendo usado em outra linha da tabela produtos, se estiver sendo usado, o novo ID não será atribuido ao produto.