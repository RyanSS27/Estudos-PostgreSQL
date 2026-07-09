-- PARA QUE SERVE ##################################################################
-- Serve para filtrar linhas da seleção por uma coluna agrupada


-- EXEMPLOS ########################################################################

-- (Exemplo 1) seleção com filtro no HAVING 
-- Calcule o nº de clientes por estado filtrando apenas estados acima de 100 clientes
select 
    state, 
    count(*)
from sales.customers
where state <> 'SP' -- usado em colunas normais
group by state
HAVING count(*) > 100 -- diferente do where, ele pode ser usado em funções agregadas

-- Produz o mesmo efeito sem o WHERE:

select 
    state, 
    count(*)
from sales.customers
group by state
HAVING count(*) > -- Como funciona exatamente como o where, podemos adicionar mais filtros
	and state <> 'SP'

-- RESUMO ##########################################################################
-- (1) Tem a mesma função do WHERE mas pode ser usado para filtrar os resultados 
-- das funções agregadas enquanto o WHERE possui essa limitação
-- (2) A função HAVING também pode filtrar colunas não agregadas







