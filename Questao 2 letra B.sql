SELECT 
    p.produto_nome AS nome_produto, 
    dp.quantidade_produto AS quantidade_consumida,
    m.mesa_num AS numero_mesa
FROM 
    RestauranteMesa m
JOIN 
    MesaPedido mp ON m.mesa_num = mp.mesa_num
JOIN 
    DetalhePedido dp ON mp.pedido_id = dp.pedido_id
JOIN 
    ItemProduto p ON dp.produto_id = p.produto_id
WHERE 
    m.mesa_num = 1;

