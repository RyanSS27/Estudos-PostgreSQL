-- (Exemplo 1) Uso do comando BETWEEN 
-- Selecione veículos que custam entre 100k e 200k na tabela products
select *
from sales.products
where price between 100000 and 200000;

-- (Exemplo 2)  Uso do comando NOT
-- Selecione veículos que custam abaixo de 100k ou acima 200k 
select *
from sales.products
where price not between 100000 and 200000
order by price;


-- (Exemplo 3) Uso do comando IN
-- Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT
select *
from sales.products
where brand in ('HONDA', 'TOYOTA', 'RENAULT');


-- (Exemplo 4) Uso do comando LIKE (matchs imperfeitos)
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA
select distinct first_name
from sales.customers 
where first_name like 'ANA%';

-- (Exemplo 5) Uso do comando ILIKE (ignora letras maiúsculas e minúsculas)
-- Selecione os primeiros nomes distintos com iniciais 'ana'
select distinct first_name
from sales.customers
where first_name ilike 'ana%';


-- (Exemplo 6) Uso do comando IS NULL
-- Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions
select *
from temp_tables.regions
where population is null;
