create table clientes(
    id int auto_increment primary key,
    nome varchar(100) not null,
    cpf int(11) not null,
    telefone varchar(13) not null,
    endereco varchar(175)
);

create table carros(
    id int auto_increment primary key,
    placa_carro char(7) not null,
    modelo varchar(50) not null,
    cod_marca int not null,
    ano int not null,
    valor decimal(12,2) not null
);

create table alugueis(
    id int auto_increment primary key,
    registro_aluguel int not null,
    data_devolucao date not null,
    data_aluguel date not null,
    valor_total decimal(12,2),
    id_cliente int,
    constraint clientes_fk_alugueis
    foreign key(id_cliente) references clientes(id)
        on delete RESTRICT
        on update CASCADE
);

create table aluguel_carros(
    id_aluguel int,
    id_carro int,
    constraint alugueis_fk_aluguel_carros
    foreign key(id_aluguel) references alugueis(id)
        on delete CASCADE
        on update CASCADE,
    constraint carros_fk_aluguel_carros
    foreign key(id_carro) references carros(id)
        on delete RESTRICT
        on update RESTRICT
);

INSERT INTO clientes(nome, cpf, telefone, endereco)
	VALUES
    	('Lorenzo da Cunha Cardoso', '1234567891', '5551997853569', 'Arroio do Sal'),
        ('Vitor da Silva Peixouto', '354041240', '55519996980', 'Peixaria Peixouto'),
        ('Bernardo da Silva Silvão', '123456780', '555199995635', 'Capão da Canoa');
        
INSERT INTO carros(placa_carro, modelo, cod_marca, ano, valor)
	VALUES
    	('ABCD123', 'Golf 2.0 TSI GTI', 1, 2021, 122698.00),
        ('XYZA123', 'New Fit LX 1.4 (flex)', 1, 2010, 38029.00);
        
insert into alugueis(registro_aluguel, data_devolucao, data_aluguel, id_cliente)
	values
    	(1234567891, '2022-09-10', '2022-09-20', 1),
        (1234567231, '2022-02-10', '2022-03-10', 2);
        
insert into aluguel_carros(id_aluguel, id_carro)
	VALUES
    	(1, 1),
        (1, 2),
        (2, 1);

-- Quais clientes que tem silva no nome   
select nome from clientes 
	where nome like '%silva%'
    or nome like '%Silva%';

-- Quais carros foram locados no mês de setembro de 2021.
select * from alugueis where MONTH(data_aluguel) = 09;

-- Faça uma atualização para acrescentar 20% nos valores dos aluguéis.
select modelo, valor*1.2 as valor_acrescido from carros;