USE loja_analise_dados;

-- 1. Top 5 produtos mais vendidos por Receita
SELECT
    p.NomeProduto,
    SUM(ip.Quantidade * ip.PrecoUnitario) AS ReceitaTotal
FROM Produtos p
JOIN ItensPedido ip ON p.ID = ip.IDProduto
GROUP BY p.NomeProduto
ORDER BY ReceitaTotal DESC
LIMIT 5;

-- 2. Total de Vendas por Categoria de Produto
SELECT
    p.Categoria,
    SUM(ip.Quantidade * ip.PrecoUnitario) AS ReceitaPorCategoria
FROM Produtos p
JOIN ItensPedido ip ON p.ID = ip.IDProduto
GROUP BY p.Categoria
ORDER BY ReceitaPorCategoria DESC;

-- 3. Número de Pedidos e Valor Total por Dia (apenas pedidos concluídos)
SELECT
    DATE(DataPedido) AS Data,
    COUNT(ID) AS TotalPedidos,
    SUM(ValorTotal) AS ReceitaDiaria
FROM Pedidos
WHERE Status = 'Concluído'
GROUP BY DATE(DataPedido)
ORDER BY Data;

-- 4. Clientes que mais compraram (por valor total, apenas pedidos concluídos)
SELECT
    c.Nome AS NomeCliente,
    c.Email,
    SUM(p.ValorTotal) AS GastoTotalCliente
FROM Clientes c
JOIN Pedidos p ON c.ID = p.IDCliente
WHERE p.Status = 'Concluído'
GROUP BY c.ID, c.Nome, c.Email
ORDER BY GastoTotalCliente DESC
LIMIT 5;

-- 5. Produtos com Estoque Baixo (ex: abaixo de 30 unidades)
SELECT
    NomeProduto,
    Estoque,
    Categoria
FROM Produtos
WHERE Estoque < 30
ORDER BY Estoque ASC;

-- 6. Média de Itens por Pedido (considerando todos os itens em todos os pedidos)
SELECT
    AVG(Quantidade) AS MediaItensPorPedido
FROM ItensPedido;

-- 7. Receita Mensal ao longo do tempo (considerando apenas pedidos concluídos)
SELECT
    DATE_FORMAT(DataPedido, '%Y-%m') AS AnoMes,
    SUM(ValorTotal) AS ReceitaMensal
FROM Pedidos
WHERE Status = 'Concluído'
GROUP BY AnoMes
ORDER BY AnoMes;

-- 8. Produtos que nunca foram vendidos
SELECT
    p.NomeProduto,
    p.Categoria
FROM Produtos p
LEFT JOIN ItensPedido ip ON p.ID = ip.IDProduto
WHERE ip.IDPedido IS NULL;