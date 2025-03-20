use restaurante;

-- produtos que tem o preço superior a 30
select nome, categoria from produtos where preco > 30;     

-- clientes que nasceram antes do ano de 1985
select nome, telefone, data_nascimento from clientes where year(data_nascimento) < 1985;

-- produtos onde os ingredientes contem a palavra â€œcarneâ€
select id_produto, ingredientes from info_produtos where ingredientes like '%carne%';

-- produtos ordenados em ordem alfabética por categoria, para cada categoria produto ordenado pelo nome
select nome, categoria from produtos order by categoria, nome; 

-- 5 produtos mais caros do restaurante
select * from produtos order by preco desc limit 5;
 
 -- 2 produtos da categoria 'Prato Principal' pulando 6 registros
 select * from produtos where categoria = 'Prato Principal' limit 2 offset 5;
 
 -- backup dos dados da tabela pedidos
 create table backup_pedidos as select * from pedidos;
 
 select * from backup_pedidos;