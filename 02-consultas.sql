USE loja_tech;

-- Exercicio 1
SELECT nome, email
FROM clientes;

-- Exercicio 2
SELECT nome, preco
FROM produtos
WHERE preco < 500.00;

-- Exercicio 3
SELECT *
FROM pedidos
WHERE status = 'pendente';

-- Exercicio 4
SELECT nome, preco
FROM produtos
ORDER BY preco DESC;

-- Exercicio 5
SELECT id_produto, nome, preco
FROM produtos
WHERE nome LIKE '%Monitor%';

-- Exercicio 6
SELECT nome, estoque
FROM produtos
WHERE id_categoria = 3 AND estoque > 40;

-- Exercicio 7
SELECT COUNT(*) AS total_clientes
FROM clientes;

-- Exercicio 8
SELECT SUM(valor_total) AS faturamento_bruto
FROM pedidos;

-- Exercicio 9
SELECT p.nome AS produto, c.nome AS categoria
FROM produtos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria;

-- Exercicio 10
SELECT p.id_pedido, p.status, p.valor_total
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE c.nome = 'Ana Silva';
