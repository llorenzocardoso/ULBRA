DELIMITER //
create procedure insere_postagem(
p_desc varchar(50), 
p_foto_principal varchar(50),
p_data_postagem date,
p_id_usuario int
)
BEGIN
if (p_data_postagem is null) then
INSERT INTO Postagens (descricao, foto_principal, data_postagem, id_usuario) VALUES (p_desc, p_foto_principal, curdate(), p_id_usuario);
else
INSERT INTO Postagens (descricao, foto_principal, data_postagem, id_usuario) VALUES (p_desc, p_foto_principal, p_data_postagem, p_id_usuario);
end if;

END //
DELIMITER ;

