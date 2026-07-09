-- EXEMPLOS ########################################################################

-- (Exemplo 1) Contagem agrupada de uma coluna
-- Calcule o nº de clientes da tabela customers por estado
SELECT 
	STATE,
	COUNT(*) AS CONTAGEM
FROM SALES.CUSTOMERS
GROUP BY STATE
ORDER BY CONTAGEM DESC;

-- (Exemplo 2) Contagem agrupada de várias colunas
-- Calcule o nº de clientes por estado e status profissional 
SELECT 
	STATE,
	PROFESSIONAL_STATUS,
	COUNT(*) AS CONTAGEM
FROM SALES.CUSTOMERS
GROUP BY STATE, PROFESSIONAL_STATUS
ORDER BY STATE, CONTAGEM DESC;

/*
	Agora temos a quantidade de pessoas de cada estado divididas 
	pelo tipo de trabalho que exercem
*/

SELECT *
FROM SALES.CUSTOMERS
LIMIT 1;

-- (Exemplo 3) Seleção de valores distintos
-- Selecione os estados distintos na tabela customers utilizando o group by
EXPLAIN ANALYZE 
SELECT DISTINCT STATE
FROM SALES.CUSTOMERS;

EXPLAIN ANALYZE
SELECT STATE
FROM SALES.CUSTOMERS
GROUP BY STATE;
/*
	O GROUP BY pode funcionar como um distinct e a instrução é processada da
	mesma forma pelo banco, obtendo a mesma performance. Porém, se quiser apenas excluir 
 	linhas iguais, opte pelo distinct pq né, a função serve pra isso e não está aí
 	à toa. Se envolver cálculos e operações de agregação, use o group by
*/


-- RESUMO ##########################################################################
-- (1) Serve para agrupar registros semelhantes de uma coluna, 
-- (2) Normalmente utilizado em conjunto com as Funções de agregação
-- (3) Pode-se referenciar a coluna a ser agrupada pela sua posição ordinal 
-- (ex: GROUP BY 1,2,3 irá agrupar pelas 3 primeiras colunas da tabela) 
-- (4) O GROUP BY sozinho funciona como um DISTINCT, eliminando linhas duplicadas