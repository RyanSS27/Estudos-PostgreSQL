# Operadores Lógicos e de Filtro no PostgreSQL

Guia de consulta rápida com os principais operadores utilizados para filtragem de dados em consultas SQL no PostgreSQL.

---

## Operadores abordados

```
AND, OR, NOT, BETWEEN, IN, LIKE, ILIKE, IS NULL
```

---

## Conceitos gerais

- **AND** → Retorna verdadeiro quando **todas** as condições são verdadeiras  
- **OR** → Retorna verdadeiro quando **pelo menos uma** condição é verdadeira  
- **NOT** → Inverte o resultado de uma condição  
- **BETWEEN** → Filtra valores dentro de um intervalo (inclusive)  
- **IN** → Equivale a múltiplas condições com OR  
- **LIKE** → Compara padrões de texto (case sensitive)  
- **ILIKE** → Comparação de texto ignorando maiúsculas/minúsculas  
- **IS NULL** → Verifica valores nulos  

---

## BETWEEN

Filtra valores dentro de um intervalo definido (inclusive).

```sql
SELECT *
FROM sales.products
WHERE price BETWEEN 100000 AND 200000;
```

### Negação com NOT

```sql
SELECT *
FROM sales.products
WHERE price NOT BETWEEN 100000 AND 200000
ORDER BY price;
```

---

## IN

Utilizado para comparar um valor com múltiplas opções.

```sql
SELECT *
FROM sales.products
WHERE brand IN ('HONDA', 'TOYOTA', 'RENAULT');
```

### Negação com NOT

```sql
SELECT *
FROM sales.products
WHERE brand NOT IN ('HONDA', 'TOYOTA', 'RENAULT');
```

---

## LIKE

Usado para buscar padrões em texto (**sensível a maiúsculas/minúsculas**).

```sql
SELECT *
FROM sales.customers
WHERE first_name LIKE 'ANA';
```

### Uso com curinga (%)

```sql
SELECT *
FROM sales.customers
WHERE first_name LIKE 'ANA%';
```

- `%` representa **qualquer sequência de caracteres**
- `'ANA%'` → retorna valores que **começam com "ANA"**

---

## ILIKE

Funciona como o LIKE, mas **ignora diferenças entre maiúsculas e minúsculas**.

```sql
SELECT *
FROM sales.customers
WHERE first_name ILIKE 'Ana';
```

---

## IS NULL

Utilizado para verificar valores nulos.

```sql
SELECT *
FROM temp_tables.regions
WHERE population IS NULL;
```

### Forma incorreta (não usar)

```sql
-- ERRADO
WHERE population = NULL;
```

---

## Boas práticas

- Sempre use `IS NULL` em vez de `= NULL`
- Prefira `IN` ao invés de múltiplos `OR`
- Use `ILIKE` quando não quiser se preocupar com case sensitive
- Utilize `BETWEEN` para intervalos ao invés de múltiplas comparações

---

## Observações

- O operador `%` (coringa) pode ser usado em qualquer posição:
  - `'ANA%'` → começa com ANA  
  - `'%ANA'` → termina com ANA  
  - `'%ANA%'` → contém ANA  

---
