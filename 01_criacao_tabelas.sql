-- Criar o Banco de Dados (se ainda não tiver um específico para o projeto)
CREATE DATABASE IF NOT EXISTS loja_analise_dados;

-- Usar o Banco de Dados
USE loja_analise_dados;

-- Tabela Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Cidade VARCHAR(50),
    DataCadastro DATE
);

-- Tabela Produtos
CREATE TABLE IF NOT EXISTS Produtos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NomeProduto VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50),
    PrecoCusto DECIMAL(10, 2) NOT NULL,
    PrecoVenda DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL DEFAULT 0
);

-- Tabela Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    IDCliente INT NOT NULL,
    DataPedido DATETIME NOT NULL,
    Status ENUM('Pendente', 'Concluído', 'Cancelado') NOT NULL DEFAULT 'Pendente',
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Clientes(ID)
);

-- Tabela ItensPedido (tabela de ligação entre Pedidos e Produtos)
CREATE TABLE IF NOT EXISTS ItensPedido (
    IDPedido INT NOT NULL,
    IDProduto INT NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL, -- Preço do produto no momento da compra
    PRIMARY KEY (IDPedido, IDProduto), -- Chave primária composta
    FOREIGN KEY (IDPedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (IDProduto) REFERENCES Produtos(ID)
);

-- Opcional: Adicionar índices para otimização de consultas comuns
CREATE INDEX idx_data_pedido ON Pedidos(DataPedido);
CREATE INDEX idx_categoria_produto ON Produtos(Categoria);