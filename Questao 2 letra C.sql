DELIMITER //

CREATE PROCEDURE RedefinirStatusMesaLivre (IN numero_mesa INT)
BEGIN
    UPDATE RestauranteMesa
    SET mesa_status = 'Livre'
    WHERE mesa_num = numero_mesa;
END //

DELIMITER ;
CALL RedefinirStatusMesaLivre(2);
