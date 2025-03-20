use restaurante;

-- crição da view chamada resumo_pedido
create view resumo_pedido as
select pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome as cliente, c.email, f.nome as funcionario, p.nome as produto, p.preco
from pedidos pe
left join clientes c on pe.id_cliente = c.id_cliente
left join funcionarios f on pe.id_funcionario = f.id_funcionario
left join produtos p on pe.id_produto = p.id_produto;

-- seleção da view resumo_pedido
select id_pedido, cliente, (quantidade * preco) as total 
from resumo_pedido;

-- atualização da view resumo_pedido, adicionando campo total
create or replace view resumo_pedido as
select pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome as cliente, c.email, f.nome as funcionario, p.nome as produto, p.preco, (pe.quantidade * p.preco) as total
from pedidos pe
left join clientes c on pe.id_cliente = c.id_cliente
left join funcionarios f on pe.id_funcionario = f.id_funcionario
left join produtos p on pe.id_produto = p.id_produto;

-- seleção da view resumo_pedido
select id_pedido, cliente, total 
from resumo_pedido;

-- seleção da view resumo_pedido com explain
explain
select id_pedido, cliente, total 
from resumo_pedido;

-- função que irá retornar os ingredientes da tabela info_produtos, quando passar o id de produto 
DELIMITER //
create function BuscaIngredientesProdutos(produto_id INT) 
returns varchar(255)
reads sql data
begin
    declare ingredientesProduto varchar(255);
    select ingredientes into ingredientesProduto FROM info_produtos WHERE id_produto = produto_id;
    return ingredientesProduto;
end; //
DELIMITER ;

-- execução da função BuscaIngredientesProdutos()
select BuscaIngredientesProdutos(10);

-- função que irá retornar uma mensagem dizendo que o total do pedido é acima, abaixo ou igual a média de todos os pedidos, quando passar o id do pedido
DELIMITER //
create function mediaPedido(pedido_id INT) 
returns varchar(6)
reads sql data
begin
    declare statusMedia varchar(6);
    declare mediaGlobal decimal(10, 2);
    
    select avg(pe.quantidade * p.preco) into mediaGlobal from pedidos pe INNER JOIN produtos p ON pe.id_produto = p.id_produto;
    select 
		case 
			when (pe.quantidade * p.preco) > mediaGlobal then 'Acima'
			when (pe.quantidade * p.preco) < mediaGlobal then 'Abaixo'
            else 'Igual'
        end into statusMedia 
	FROM pedidos pe 
    left join produtos p on pe.id_produto = p.id_produto WHERE pe.id_pedido = pedido_id;
    return statusMedia;
end; //
DELIMITER ;

-- execução da função mediaPedido()
select mediaPedido(5) as total_pedido_sobre_media;
select mediaPedido(6) as total_pedido_sobre_media;