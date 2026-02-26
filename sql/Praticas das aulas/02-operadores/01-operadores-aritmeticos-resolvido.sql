select *
from sales.customers 
limit 10;

-- (Exemplo 1) Criação de coluna calculada
-- Traga informações que identifiquem o cliente, como nome e email;
-- Crie uma coluna que contenha a idade dos clientes.
select 
	first_name,
	email,
	(current_date - birth_date) / 360 as idade
from sales.customers
order by idade asc;


-- (Exemplo 2) Criação de coluna calculada com strings 
-- Crie a coluna "nome_completo" contendo o nome completo do cliente
select 
	first_name, 
	last_name, 
	(first_name||' '||last_name) as "nome completo"  
from sales.customers
order by "nome completo" asc;
-- Colocando as apas duplas para identificar nomes de colunas,
-- podemos adicionar espaços (nome_completo -> "nome completo")