-- EXERCÍCIOS ########################################################################

-- (Exemplo 1) Identifique qual é o status profissional mais frequente nos clientes 
-- que compraram automóveis no site

/*
	Essa é minha query original e ela falhou pois, ao utilizar o left join, o banco entende que todas
	as linhas da tabela funnel devem ser mantidas no resultado.

	Como a condição de ligação com a tabela customers exigia que a compra estivesse paga (paid_date is not null), 
	o cruzamento falhou para os milhares de visitantes que não compraram nada.

	Como o left join obriga a manter as linhas do funnel mesmo quando o cruzamento falha, o banco 
	gerou essas linhas vazias de clientes, deixando o professional_status como nulo. O count(*) 
	simplesmente contou todas essas "visitas sem compra" e as agrupou no status [null].

*/
select
	t2.professional_status,
	count(*) as quantidade_compras
from sales.funnel as t1
left join sales.customers as t2 
	on t1.customer_id = t2.customer_id and (t1.paid_date is not null)
group by t2.professional_status
order by quantidade_compras desc

-- solução parecida com a da professora
select
	t2.professional_status,
	count(t1.paid_date) as quantidade_compras
from sales.funnel as t1
left join sales.customers as t2
	on t1.customer_id = t2.customer_id
group by t2.professional_status
order by quantidade_compras desc

-- (Exemplo 2) Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders
select * from temp_tables.ibge_genders limit 10
select * from sales.customers limit 1
select * from sales.funnel limit 1

select
	t2.gender,
	count(distinct t2.customer_id) as quantidade
from sales.funnel as t1
join (
	-- pensei nessa tabela intermediária com os ids, nomes e generos, mas ela carrega por muito tempo mesmo limitando a 20
	select 
		tab_customers.customer_id,
		tab_genders.first_name,
		tab_genders.gender
	from temp_tables.ibge_genders as tab_genders
	join sales.customers as tab_customers
		on tab_genders.first_name = lower(tab_customers.first_name) -- uma guarda maiúsculos outra os minúsculos 
) as t2
	on t1.customer_id = t2.customer_id
where t1.paid_date is not null
group by t2.gender 

-- melhor versão:
select
    t3.gender,
    count(distinct t1.customer_id) as quantidade_clientes
from sales.funnel as t1
join sales.customers as t2
    on t1.customer_id = t2.customer_id
join temp_tables.ibge_genders as t3
    on lower(t2.first_name) = t3.first_name
where t1.paid_date is not null
group by t3.gender
order by quantidade_clientes desc;


-- (Exemplo 3) Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions
select * from sales.customers limit 10
select * from temp_tables.regions limit 10
