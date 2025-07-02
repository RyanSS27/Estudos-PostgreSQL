-- (Exemplo 1) Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa 
-- Query de confirmação:
select email, state
from sales.customers
where state = 'SC';

-- Query final:
select email
from sales.customers
where state = 'SC';


-- (Exemplo 2) Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul
-- Query de confirmação:
select email, state
from sales.customers 
where (state = 'SC' or state = 'MS');

-- Query final:
select email
from sales.customers 
where (state = 'SC' or state = 'MS');


-- (Exemplo 3) Filtro de condição com data
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos
-- Query de confirmação:
select email, state, birth_date
from sales.customers
where (state = 'SC' or state = 'MS') and (birth_date < '1995-07-02');

-- Query final:
select email
from sales.customers
where (state = 'SC' or state = 'MS') and (birth_date < '1995-07-02');