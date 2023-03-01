--Criação do banco
```sql
create database ecommerce;

--Coloca o banco em uso

use ecommerce;

create table cliente (
    id int not null auto_increment,
    nome varchar(60) not null,
    identificacao varchar(14) not null comment 'Deve ter o CPF ou CNPJ do cliente',
    tipo_cliente char(2) not null comment 'Deve conter PF para pessoa física, e PJ para pessoa juridica',
    constraint primary key (id),
    constraint check (tipo_cliente = 'PF' or tipo_cliente = 'PJ')
);

create table endereco (
    id int not null auto_increment,
    rua varchar(30) not null,
    numero int,
    complemento varchar(30),
    bairro varchar(30) not null,
    cidade varchar(30) not null,
    estado char(2) not null,
    cep varchar(8) not null,
    fone varchar(11),
    cliente_id int not null,
    constraint primary key (id),
    constraint foreign key (cliente_id) references cliente(id) on delete cascade
);

create table entrega (
    id int not null auto_increment,
    empresa varchar(45) not null,
    data_prevista date not null,
    data_entrega date,
    status_entrega smallint not null comment '0: Aguardando Postagem, 1: Postado, 2: Em transito, 3: Entregue, 4: Cancelado, 5: Devolvido, 6: Extraviado, 7: Furtado/Roubado',
    valor_frete float not null,
    codigo_rastreio varchar(30),
    constraint primary key (id),
    constraint check (status_entrega in (0,1,2,3,4,5,6,7))
);

create table pagamento (
    id int not null auto_increment,
    tipo_pagamento char(1) not null comment 'C: Crédito, D: Débito, P: Pix, B: Boleto bancário',
    pix_copia_cola varchar(255),
    numero_cartao varchar(20),
    data_validade char(6),
    bandeira_cartao varchar(20),
    nome_portador varchar(45),
    identificao varchar(14) not null comment 'Deve receber o CNPJ ou CPF do pagador',
    codigo_barras varchar(48),
    emissao_boleto date,
    vencimento_boleto date,
    data_recebimento date default null,
    status_pagamento smallint not null comment '0: Pendente, 1: Negado, 2: Aprovado, 3: Estornado, 4: Chargeback. 5: Cancelado risco, 6: Cancelado outros',
    data_status timestamp comment 'Recebe a data corrente sempre que o status atualizar',
    valor float,
    constraint primary key (id),
    constraint check (tipo_pagamento in ('CRE','DEB','PIX','BOL')),
    constraint check (status_pagamento in (0,1,2,3,4,5,6))
);

create table pedido (
    id int not null auto_increment,
    status_pedido smallint not null comment '0: Pendente, 1: Aprovado, 2: Cancelado',
    tipo_cancelamento char(1) comment 'X: para situações que o cliente pede cancelamento, C: Situações de chargeback, R: Cancelamento de risco',
    cliente_id int not null,
    entrega_id int not null,
    pagamento_id int not null,
    constraint primary key (id),
    constraint foreign key (cliente_id) references cliente(id),
    constraint foreign key (entrega_id) references entrega(id),
    constraint foreign key (pagamento_id) references pagamento(id)
);

create table estoque (
    id int not null auto_increment,
    cidade varchar(30),
    constraint primary key (id)
);

create table produto (
    id int not null auto_increment,
    nome varchar(30) not null,
    descricacao text not null,
    valor float,
    constraint primary key (id)
);

create table estoque_produto (
    estoque_id int not null,
    produto_id int not null,
    quantidade int,
    constraint primary key (estoque_id, produto_id),
    constraint check (quantidade >= 0),
    constraint foreign key (estoque_id) references estoque(id),
    constraint foreign key (produto_id) references produto(id)
);

create table pedido_produto (
    pedido_id int not null,
    produto_id int not null,
    quantidade int not null,
    constraint primary key (pedido_id, produto_id),
    constraint foreign key (pedido_id) references pedido(id),
    constraint foreign key (produto_id) references produto(id)
);

create table fornecedor (
    id int not null auto_increment,
    razao_social varchar(45),
    cnpj char(14) not null,
    constraint primary key (id)
);

create table fornecedor_produto (
    fornecedor_id int not null,
    produto_id int not null,
    constraint primary key (fornecedor_id, produto_id),
    constraint foreign key (fornecedor_id) references fornecedor(id),
    constraint foreign key (produto_id) references produto(id)
);
```
-- TODO: fazer os inserts

-- TODO: fazer os selects
--select * from entrega;
