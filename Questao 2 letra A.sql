SELECT 
    f.funcionario_nome AS nome_funcionario, 
    m.mesa_num AS numero_mesa, 
    SUM(v.venda_valor_total) AS total_gasto
FROM 
    FuncionarioInfo f
JOIN 
    RegistroAtendimento a ON f.funcionario_id = a.funcionario_id
JOIN 
    RestauranteMesa m ON a.mesa_num = m.mesa_num
JOIN 
    VendaRegistro v ON m.mesa_num = v.mesa_num
GROUP BY 
    f.funcionario_nome, m.mesa_num
ORDER BY 
    f.funcionario_nome, m.mesa_num;
