use restaurante;

-- quantidade de pedidos
select count(*) from pedidos;

-- quantidade de clientes únicos que realizaram pedidos
select count(distinct id_cliente) from pedidos;

-- média de preço dos produtos
select avg(preco) from produtos;

-- mÃ­nimo e máximo do preço dos produtos
select min(preco) from produtos;
select max(preco) from produtos;

-- rank dos 5 produtos mais caros
select nome, preco, row_number() over (order by preco desc) as ranking_preco from produtos limit 5;

-- média dos preços dos produtos agrupados por categoria
select categoria, avg(preco) as media_preco from produtos group by categoria;

-- produtos por fornecedor
select fornecedor, count(id_produto) as quantidade_produto from info_produtos group by fornecedor;

-- fornecedores que possuem mais de um produto cadastrado
select fornecedor, count(id_produto) as quantidade_produto from info_produtos group by fornecedor having count(id_produto) > 1;

-- clientes que realizaram apenas 1 pedido
select id_cliente, count(id_pedido) as quantidade_pedidos from pedidos group by id_cliente having count(id_pedido) = 1;
