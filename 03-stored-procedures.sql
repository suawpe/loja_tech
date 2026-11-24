USE loja_tech;

-- Exercicio 1
DROP PROCEDURE IF EXISTS listar_categorias_ativas;
DELIMITER //
CREATE PROCEDURE listar_categorias_ativas()
BEGIN
    SELECT id_categoria, nome, descricao
    FROM categorias
    WHERE ativo = TRUE
    ORDER BY nome;
END //
DELIMITER ;

CALL listar_categorias_ativas();

-- Exercicio 2
DROP PROCEDURE IF EXISTS buscar_pedidos_por_status;
DELIMITER //
CREATE PROCEDURE buscar_pedidos_por_status(
    IN p_status VARCHAR(20)
)
BEGIN
    SELECT id_pedido, id_cliente, data_pedido, valor_total
    FROM pedidos
    WHERE status = p_status;
END //
DELIMITER ;

CALL buscar_pedidos_por_status('pendente');

-- Exercicio 3
DROP PROCEDURE IF EXISTS inserir_categoria;
DELIMITER //
CREATE PROCEDURE inserir_categoria(
    IN p_nome VARCHAR(100),
    IN p_descricao TEXT
)
BEGIN
    INSERT INTO categorias (nome, descricao)
    VALUES (p_nome, p_descricao);
END //
DELIMITER ;

CALL inserir_categoria('Acessórios', 'Cabos e adaptadores');
SELECT id_categoria, nome, descricao
FROM categorias
WHERE id_categoria = LAST_INSERT_ID();

-- Exercicio 4
DROP PROCEDURE IF EXISTS atualizar_telefone_cliente;
DELIMITER //
CREATE PROCEDURE atualizar_telefone_cliente(
    IN p_id_cliente INT,
    IN p_telefone VARCHAR(15)
)
BEGIN
    UPDATE clientes
    SET telefone = p_telefone
    WHERE id_cliente = p_id_cliente;
END //
DELIMITER ;

SELECT id_cliente, nome, telefone
FROM clientes
WHERE id_cliente = 1;

CALL atualizar_telefone_cliente(1, '11999990000');
SELECT id_cliente, nome, telefone
FROM clientes
WHERE id_cliente = 1;

-- Exercicio 5
DROP PROCEDURE IF EXISTS contar_produtos_categoria;
DELIMITER //
CREATE PROCEDURE contar_produtos_categoria(
    IN p_id_categoria INT,
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*) INTO p_total
    FROM produtos
    WHERE id_categoria = p_id_categoria;
END //
DELIMITER ;

CALL contar_produtos_categoria(3, @total);
SELECT @total AS total_produtos;
