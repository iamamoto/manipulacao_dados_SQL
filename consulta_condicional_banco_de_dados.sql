use restaurante;

-- pedidos que o id funcionário é 4 e status é 'Pendente'
select * from pedidos where id_funcionario = 4 and status = 'Pendente';

-- pedidos que o status não é 'Concluódo'
select * from pedidos where status <> 'ConcluÃ­do';

-- pedidos que contem os id produtos: 1, 3, 5, 7 ou 8
select * from pedidos where id_produto in (1, 3, 5, 7, 8);

-- clientes que começam com a letra c
select * from clientes where nome like 'c%';

-- informações de produtos que contem nos ingredientes 'carne' ou 'frango'
select * from info_produtos where ingredientes like '%carne%' or ingredientes like '%frango%';

-- produtos com o preço entre 20 a 30
select * from produtos where preco between 20 and 30;

-- atualizar id pedido 6 da tabela pedidos para status = NULL
update pedidos set status = null where id_pedido = 6;

-- pedidos com status nulos
select * from pedidos where status is null;

-- status nulos, mostrar 'Cancelado'
select id_pedido, ifnull(status, 'Cancelado') as status from pedidos; 

-- media_salario 
select nome, cargo, salario, if(salario > 3000, 'Acima da mÃ©dia', 'Abaixo da mÃ©dia') as media_salario from funcionarios;