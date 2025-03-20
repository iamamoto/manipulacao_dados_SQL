use restaurante;

-- produtos e info_produtos
select p.id_produto, p.nome, p.descricao, ip.ingredientes
from produtos p
inner join info_produtos ip on p.id_produto = ip.id_produto;

-- pedidos e clientes
select pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome, c.email 
from pedidos pe
inner join clientes c on pe.id_cliente = c.id_cliente;

-- pedidos, clientes e funcionarios
select pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome as cliente, c.email, f.nome as funcionario
from pedidos pe
left join clientes c on pe.id_cliente = c.id_cliente
left join funcionarios f on pe.id_funcionario = f.id_funcionario;

-- pedidos, clientes, funcionarios e produtos
select pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome as cliente, c.email, f.nome as funcionario, p.nome as produto, p.preco
from pedidos pe
left join clientes c on pe.id_cliente = c.id_cliente
left join funcionarios f on pe.id_funcionario = f.id_funcionario
left join produtos p on pe.id_produto = p.id_produto;

-- clientes de pedidos com status 'Pendente'
select c.nome 
from clientes c
inner join ( 
	select id_cliente
    from pedidos
    where status = 'PENDENTE'
    order by id_pedido desc) pe on pe.id_cliente = c.id_cliente
group by c.nome;

-- clientes sem pedidos
select c.*
from clientes c
left join pedidos pe on pe.id_cliente = c.id_cliente
where pe.id_pedido is null;

-- nome do cliente e o total de pedidos cada cliente
select c.nome, COUNT(pe.id_pedido) AS total_pedidos
from clientes c
left join pedidos pe on pe.id_cliente = c.id_cliente
group by c.nome;

-- preço total de cada pedido
select id_pedido, (pe.quantidade * p.preco) as preco_total
from pedidos pe
left join produtos p on pe.id_produto = p.id_produto;