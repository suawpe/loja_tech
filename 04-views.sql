USE loja_tech;

-- Exemplo 1
CREATE VIEW vw_catalogo_disponivel AS
SELECT id_produto, nome, preco
FROM produtos
WHERE ativo = TRUE AND estoque > 0;

SELECT * FROM vw_catalogo_disponivel
WHERE preco >= 1000.00
ORDER BY preco DESC;

-- Exemplo 2
CREATE VIEW vw_valor_estoque AS
SELECT id_produto, nome, estoque, preco,
       preco * estoque AS valor_em_estoque
FROM produtos;

SELECT * FROM vw_valor_estoque
ORDER BY valor_em_estoque DESC;

-- Exemplo 3
CREATE VIEW vw_resumo_pedidos_status AS
SELECT status, COUNT(*) AS quantidade_pedidos,
       SUM(valor_total) AS valor_total
FROM pedidos
GROUP BY status;

SELECT * FROM vw_resumo_pedidos_status
ORDER BY status;

-- Exemplo 4
CREATE VIEW vw_clientes_sem_pedidos AS
SELECT c.id_cliente, c.nome
FROM clientes c
LEFT JOIN pedidos p ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL;

SELECT * FROM vw_clientes_sem_pedidos
ORDER BY nome;

-- Exemplo 5
CREATE VIEW vw_conferencia_pedidos AS
SELECT p.id_pedido, p.valor_total AS total_registrado,
       COALESCE(SUM(i.subtotal), 0) AS total_itens,
       p.valor_total - COALESCE(SUM(i.subtotal), 0) AS diferenca
FROM pedidos p
LEFT JOIN itens_pedido i ON i.id_pedido = p.id_pedido
GROUP BY p.id_pedido, p.valor_total;

SELECT * FROM vw_conferencia_pedidos
WHERE diferenca <> 0
ORDER BY id_pedido;
