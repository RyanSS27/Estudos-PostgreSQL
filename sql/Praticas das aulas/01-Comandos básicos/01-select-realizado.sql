-- (Exemplo 1) Seleção de uma coluna de uma tabela
-- Liste os e-mails dos clientes da tabela sales.customers
select email
from sales.customers 

-- (Exemplo 2) Seleção de mais de uma coluna de uma tabela
-- Liste os emails e nomes dos clientes da tabela sales.customers
select email, first_name 
from sales.customers

-- (Exemplo 3) Seleção de todas as colunas de uma tabela
-- Liste todos as informações dos clientes da tabela sales.customers
select * 
from sales.customers 