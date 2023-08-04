-- Criação da tabela amazon_pedidos
CREATE TABLE amazon_pedidos (
    id_livro INT PRIMARY KEY,
    nome_do_livro VARCHAR(100),
    valor DECIMAL(10, 2)
);

-- Inserção de dados na tabela amazon_pedidos
INSERT INTO amazon_pedidos (id_livro, nome_do_livro, valor)
VALUES
    (1, 'a arte da guerra', 50.00),
    (2, 'a revolução dos bichos', 23.50),
    (3, 'o livro negro do comunismo', 60.00);

-- Criação da tabela amazon_numpedidos
CREATE TABLE amazon_numpedidos (
    id_pedido INT PRIMARY KEY,
    numero_do_pedido VARCHAR(100),
    data_da_compra DATE,
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES amazon_pedidos(id_livro)
);

-- Inserção de dados na tabela amazon_numpedidos
INSERT INTO amazon_numpedidos (id_pedido, numero_do_pedido, data_da_compra, id_livro)
VALUES
    (1, '482', '2014-11-10', 1),
    (2, '785', '2001-05-02', 2),
    (3, '666', '2006-06-06', 3);

-- Consulta que junta as informações de ambas as tabelas
SELECT np.*, p.nome_do_livro, p.valor
FROM amazon_numpedidos np
JOIN amazon_pedidos p ON np.id_livro = p.id_livro;
