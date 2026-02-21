-- (Exemplo 1) Uso de operadores como flag
-- Gere o mesmo resultado da query abaixo, mas crie uma coluna que retorne 
-- TRUE sempre que um cliente for um profissional clt:
select
    customer_id,
    first_name,
    professional_status
from sales.customers;

-- FLAG são Colunas que retornam apenas verdadeiro ou falso):
select 
	customer_id,
	(first_name || ' ' || last_name) as nome,
	professional_status,
	(professional_status = 'clt') as flag
from sales.customers
order by customer_id asc;
