-- (Exercício 1) Selecione os nomes de cidade distintas que existem no estado de
-- Minas Gerais em ordem alfabética (dados da tabela sales.customers)
select distinct city 
from sales.customers 
where (state = 'MG') 
order by city;

-- (Exercício 2) Selecione o visit_id das 10 compras mais recentes efetuadas
-- (dados da tabela sales.funnel)
-- Usei para ver as informações e estrutura da tabela: select * from sales.funnel limit 10
select visit_id 
from sales.funnel 
order by visit_page_date desc 
limit 10;

-- (Exercício 3) Selecione todos os dados dos 10 clientes com maior score nascidos
-- após 01/01/2000 (dados da tabela sales.customers)
-- Usei para ver as informações e estrutura da tabela: select * from sales.customers limit 10

select * 
from sales.customers 
where (birth_date > '2000-01-01') 
order by score desc 
limit 10;