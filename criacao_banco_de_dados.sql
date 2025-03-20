create database restaurante;

use restaurante;

create table if not exists funcionarios(
	id_funcionario int auto_increment primary key,
    nome varchar(255) not null,
    cpf varchar(14) unique,
    data_nascimento date,
    endereco varchar(255),
    telefone varchar(15),
    email varchar(100) unique,
    cargo varchar(100),
    salario decimal(10,2),
    data_admissao date
);

create table if not exists clientes(
	id_cliente int auto_increment primary key,
    nome varchar(255) not null,
    cpf varchar(14) unique,
    data_nascimento date,
    endereco varchar(255),
    telefone varchar(15),
    email varchar(100) unique,
    data_cadastro date
);

create table if not exists produtos(
	id_produto int auto_increment primary key,
    nome varchar(255) not null,
    descricao text,
    preco decimal(10,2),
    categoria varchar(100)
);

create table if not exists pedidos(
	id_pedido int auto_increment primary key,
    id_cliente int,
    id_funcionario int,
    id_produto int,
    quantidade int,
    preco decimal(10,2),
    data_pedido date,
    status varchar(50) comment'Ex: pendente, concluído e cancelado',
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_funcionario) references funcionarios(id_funcionario),
    foreign key (id_produto) references produtos(id_produto)
);

create table if not exists info_produtos(
	id_info int auto_increment primary key,
    id_produto int, 
    ingredientes text,
    fornecedor varchar(255),
    foreign key (id_produto) references produtos(id_produto)
);