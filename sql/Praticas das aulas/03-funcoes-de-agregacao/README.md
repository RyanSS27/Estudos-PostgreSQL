# Funções Agregadas no PostgreSQL

Guia de consulta rápida com as principais funções agregadas utilizadas para análise de dados.

---

## Conceitos gerais

- Funções agregadas realizam **operações sobre conjuntos de dados**
- São usadas para **resumir informações** de uma coluna
- Valores `NULL` **não são considerados** nos cálculos
- `COUNT(*)` conta todas as linhas, incluindo valores nulos
- `COUNT(coluna)` ignora valores `NULL`
- `COUNT(DISTINCT coluna)` considera apenas valores únicos

---

## COUNT()

Utilizada para contar registros.

### Exemplo 1: Contar todas as linhas

```sql
SELECT COUNT(*)
FROM sales.funnel;
```

---

### Exemplo 2: Contar valores não nulos

```sql
SELECT COUNT(paid_date)
FROM sales.funnel;
```

> Apenas registros com `paid_date` preenchido serão contabilizados.

---

### Exemplo 3: Contar valores distintos

```sql
SELECT COUNT(DISTINCT product_id)
FROM sales.funnel
WHERE visit_page_date BETWEEN '2021-01-01' AND '2021-01-31';
```

> Conta apenas produtos únicos visitados no período.

---

## Funções adicionais

### MAX(), MIN() e AVG()

- **MAX()** → Retorna o maior valor  
- **MIN()** → Retorna o menor valor  
- **AVG()** → Calcula a média  

---

### Exemplo 4: Estatísticas de preço

```sql
SELECT
    MAX(price) AS max_price,
    MIN(price) AS min_price,
    AVG(price) AS avg_price
FROM sales.products;
```

---

### Verificando o maior valor diretamente

```sql
SELECT *
FROM sales.products
ORDER BY price DESC
LIMIT 1;
```

---

## Subquery com função agregada

### Exemplo 5: Produto mais caro

```sql
SELECT *
FROM sales.products
WHERE price = (
    SELECT MAX(price)
    FROM sales.products
);
```

> Retorna todas as informações do produto com maior preço.

---

## Boas práticas

- Utilize `COUNT(*)` para contagem total de registros
- Prefira `COUNT(coluna)` quando quiser ignorar valores nulos
- Use `DISTINCT` para evitar duplicidade de dados
- Combine funções agregadas com `WHERE` para análises específicas
- Utilize **subqueries** para comparar valores agregados

---

## Observações

- Funções agregadas são frequentemente usadas com:
  - `GROUP BY`
  - `HAVING`
- São essenciais para **análise de dados e geração de métricas**

---
