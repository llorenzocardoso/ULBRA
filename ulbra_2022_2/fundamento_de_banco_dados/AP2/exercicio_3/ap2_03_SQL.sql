create table socios(
    id int auto_increment primary key,
    nome varchar(75) not null,
    endereco varchar(150) not null,
    numero int not null,
    cod_tipo_socio int not null,
    descr_tipo_socio text
);

create table servicos(
    id int auto_increment primary key,
    descricao text,
    mes_referencia date not null,
    valor_pago decimal(12,2)
);

create table socios_pedem_servicos(
    id_socio int,
    id_servico int,
    constraint socios_fk_socios_pedem_servicos
    foreign key(id_socio) references socios(id)
        on delete restrict
        on update cascade,
    constraint servicos_fk_socios_pedem_servicos
    foreign key(id_servico) references servicos(id)
        on delete restrict
        on update cascade
);

insert into socios(nome, endereco, numero, cod_tipo_socio, descr_tipo_socio)
    values 
        ('João Mingibaba', 'Barão do Rio Branco, 936', 997843569, 21, 'Socio muito legal'),
        ('Lorenzo Cardoso', 'Barão do Rio Branco, 831', 997686935, 10, 'Socio não tão legal'),
        ('Natan Huggentobler', 'Jardim Raiante, 234', 998132456, 21, 'Socio muito legal');

insert into servicos(descricao, mes_referencia, valor_pago)
    VALUES
        ('Limpeza de piscina', '2020-01-10', 100.00),
        ('Limpeza de jardim', '2020-01-10', 150.00),
        ('Conserto elétrico', '2021-02-15', 150.00),
        ('Limpeza Quântica', '2022-10-26', 550.00);

insert into socios_pedem_servicos(id_socio, id_servico)
    values
        (1, 2),
        (2, 1),
        (3, 3),
        (3, 2),
        (3, 1);

-- Listar os serviços onde o valor pago é maior que 500.
select * from servicos where valor_pago > 500;

-- Listar os pedidos onde o mês de referência é janeiro de 2020.
select * from servicos where month(mes_referencia) = 1;

-- Listar os sócios que moram na rua que tem o nome Barão do Rio Branco.
select * from socios where endereco like 'Barão do Rio Branco%';