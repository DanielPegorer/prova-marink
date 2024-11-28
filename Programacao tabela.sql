CREATE TABLE ClienteInfo (
    cliente_id INT PRIMARY KEY,
    cliente_nome VARCHAR(100)
);
CREATE TABLE RestauranteMesa (
    mesa_num INT PRIMARY KEY,
    mesa_status VARCHAR(20) CHECK (mesa_status IN ('Livre', 'Ocupada', 'Sobremesa', 'Ocupada-Ociosa')),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES ClienteInfo(cliente_id)
);
CREATE TABLE ItemProduto (
    produto_id INT PRIMARY KEY,
    produto_nome VARCHAR(100),
    produto_preco DECIMAL(10, 2),
    produto_estoque INT,
    produto_estoque_min INT,
    produto_marca VARCHAR(50)
);
CREATE TABLE MesaPedido (
    pedido_id INT PRIMARY KEY,
    mesa_num INT,
    cliente_id INT,
    FOREIGN KEY (mesa_num) REFERENCES RestauranteMesa(mesa_num),
    FOREIGN KEY (cliente_id) REFERENCES ClienteInfo(cliente_id)
);
CREATE TABLE DetalhePedido (
    pedido_id INT,
    produto_id INT,
    quantidade_produto INT,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES MesaPedido(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES ItemProduto(produto_id)
);
CREATE TABLE MetodoPagamento (
    pagamento_id INT PRIMARY KEY,
    pagamento_desc VARCHAR(50)
);
CREATE TABLE VendaRegistro (
    venda_id INT PRIMARY KEY,
    mesa_num INT,
    cliente_id INT, -- Nullable para mesas sem identificação de cliente
    venda_valor_total DECIMAL(10, 2),
    pagamento_id INT,
    FOREIGN KEY (mesa_num) REFERENCES RestauranteMesa(mesa_num),
    FOREIGN KEY (cliente_id) REFERENCES ClienteInfo(cliente_id),
    FOREIGN KEY (pagamento_id) REFERENCES MetodoPagamento(pagamento_id)
);
CREATE TABLE FuncionarioDados (
    funcionario_id INT PRIMARY KEY,
    funcionario_nome VARCHAR(100)
);
CREATE TABLE RegistroAtendimento (
    atendimento_id INT PRIMARY KEY,
    funcionario_id INT,
    mesa_num INT,
    FOREIGN KEY (funcionario_id) REFERENCES FuncionarioDados(funcionario_id),
    FOREIGN KEY (mesa_num) REFERENCES RestauranteMesa(mesa_num)
);
CREATE TABLE FuncionarioInfo (
    funcionario_id INT PRIMARY KEY,
    funcionario_nome VARCHAR(100)
);





