-- COUNT()
-- Conta todas as linhas de uma tabela

select *
from sales.funnel
where product_id is null
limit 10

/*
	EXEMPLO 1 - contando linhas de uma tabela)
	é bom para se conhecer a tabela e se os filtros aplicados devem ser muito
	descritivos para minimizar os rezultados
*/

select count(*) -- considera todas as colunas
from sales.funnel

/*
	EXEMPLO 2
	Conte todos os pagamentos registrados na tabela sales.funnel
*/

select count(paid_date) -- não conta linhas com dados nulos
from sales.funnel

/*
    EXEMPLO 3 - contagem sem repetição de dados
    conte todos os produtos distintos visitados em jan/21
*/

select count(distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'

/*
================================================
 OUTRAS FUNÇÕES: MAX, MIN AVG (average - média)
================================================
	Exemplo 4 - Calcule o preço máximo, mínimo e o médio dos produtos
*/

select
	max(price) as max_price,
	min(price) as min_price,
	avg(price) as mid_price
from sales.products

select *
from sales.products
order by price desc
limit 1

-- Exemplo 5 - Traga as informações do veículo mais caro da tabela products
select *
from sales.products
where price = (select max(price) from sales.products)

/*
	Lê-se: traga todos os prod. da tabela products onde
	o preco seja igual ao produto de preço máximo da mesma
*/
