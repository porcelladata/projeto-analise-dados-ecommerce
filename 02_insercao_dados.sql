USE loja_analise_dados;

-- Inserir Clientes
INSERT INTO Clientes (Nome, Email, Cidade, DataCadastro) VALUES
('Ana Silva', 'ana.silva@email.com', 'Porto Alegre', '2023-01-15'),
('Bruno Costa', 'bruno.c@email.com', 'São Paulo', '2023-02-20'),
('Carla Dias', 'carla.d@email.com', 'Porto Alegre', '2023-03-10'),
('Daniel Rocha', 'daniel.r@email.com', 'Rio de Janeiro', '2023-04-05'),
('Eva Lima', 'eva.l@email.com', 'Porto Alegre', '2023-05-01');

-- Inserir Produtos
INSERT INTO Produtos (NomeProduto, Categoria, PrecoCusto, PrecoVenda, Estoque) VALUES
('Smartphone X', 'Eletrônicos', 1500.00, 2500.00, 50),
('Notebook Gamer', 'Eletrônicos', 4000.00, 6500.00, 20),
('Camiseta Casual', 'Vestuário', 30.00, 70.00, 200),
('Calça Jeans', 'Vestuário', 80.00, 180.00, 150),
('Livro de SQL', 'Livros', 40.00, 90.00, 80),
('Mouse Sem Fio', 'Periféricos', 50.00, 120.00, 100);

-- Inserir Pedidos
INSERT INTO Pedidos (IDCliente, DataPedido, Status, ValorTotal) VALUES
(1, '2024-01-20 10:00:00', 'Concluído', 2500.00), -- Pedido 1 (Ana: Smartphone X)
(2, '2024-01-21 11:30:00', 'Concluído', 6500.00), -- Pedido 2 (Bruno: Notebook Gamer)
(1, '2024-02-01 14:00:00', 'Concluído', 180.00),  -- Pedido 3 (Ana: Calça Jeans)
(3, '2024-02-05 09:15:00', 'Pendente', 70.00),   -- Pedido 4 (Carla: Camiseta Casual)
(4, '2024-03-10 16:45:00', 'Concluído', 90.00),  -- Pedido 5 (Daniel: Livro de SQL)
(5, '2024-03-15 13:00:00', 'Concluído', 2620.00); -- Pedido 6 (Eva: Smartphone X + Mouse Sem Fio)

-- Inserir ItensPedido
-- Pedido 1: Ana - Smartphone X
INSERT INTO ItensPedido (IDPedido, IDProduto, Quantidade, PrecoUnitario) VALUES (1, 1, 1, 2500.00);
-- Pedido 2: Bruno - Notebook Gamer
INSERT INTO ItensPedido (IDPedido, IDProduto, Quantidade, PrecoUnitario) VALUES (2, 2, 1, 6500.00);
-- Pedido 3: Ana - Calça Jeans
INSERT INTO ItensPedido (IDPedido, IDProduto, Quantidade, PrecoUnitario) VALUES (3, 4, 1, 180.00);
-- Pedido 4: Carla - Camiseta Casual
INSERT INTO ItensPedido (IDPedido, IDProduto, Quantidade, PrecoUnitario) VALUES (4, 3, 1, 70.00);
-- Pedido 5: Daniel - Livro de SQL
INSERT INTO ItensPedido (IDPedido, IDProduto, Quantidade, PrecoUnitario) VALUES (5, 5, 1, 90.00);
-- Pedido 6: Eva - Smartphone X + Mouse Sem Fio
INSERT INTO ItensPedido (IDPedido, IDProduto, Quantidade, PrecoUnitario) VALUES (6, 1, 1, 2500.00);
INSERT INTO ItensPedido (IDPedido, IDProduto, Quantidade, PrecoUnitario) VALUES (6, 6, 1, 120.00);

-- Opcional: Atualizar estoque após os pedidos (isto seria feito por um sistema, mas podemos simular)
-- Para cada item inserido, você decrementaria o estoque do produto.
-- Exemplo para o Pedido 1 (Smartphone X):
-- UPDATE Produtos SET Estoque = Estoque - 1 WHERE ID = 1;
-- Você faria isso para cada item de cada pedido.
-- Para simplicidade no projeto, podemos assumir que o estoque já está atualizado.