DELIMITER $$
DROP PROCEDURE IF EXISTS crear_usuario$$
CREATE PROCEDURE `crear_usuario`(IN nombre_usuario VARCHAR(255))
BEGIN


  -- Crear el usuario con la contraseña igual al nombre
  SET @query_crear_usuario = CONCAT('CREATE USER ', nombre_usuario, '@''%'' IDENTIFIED WITH mysql_native_password BY ''', nombre_usuario, ''';');
  PREPARE stmt_crear_usuario FROM @query_crear_usuario;
  EXECUTE stmt_crear_usuario;
  DEALLOCATE PREPARE stmt_crear_usuario;
   SET @query_crear_usuario = CONCAT('CREATE DATABASE ', nombre_usuario, ';');
  PREPARE stmt_crear_usuario FROM @query_crear_usuario;
  EXECUTE stmt_crear_usuario;
  DEALLOCATE PREPARE stmt_crear_usuario;
  -- Otorgar permisos al usuario sobre la base de datos actual
  SET @query_grant_permisos = CONCAT('GRANT ALL PRIVILEGES ON ',nombre_usuario,'.* TO ''', nombre_usuario, '''@''%'' with grant option;');
  PREPARE stmt_grant_permisos FROM @query_grant_permisos;
  EXECUTE stmt_grant_permisos;
  DEALLOCATE PREPARE stmt_grant_permisos;

  -- Aplicar cambios de permisos
  FLUSH PRIVILEGES;
END$$

DELIMITER ;
select user from mysql.user;
DROP USER 'juan';
call crear_usuario('juan');
set @nombre_usuario='juan';
select CONCAT('CREATE USER ', @nombre_usuario, '@''%'' IDENTIFIED WITH mysql_native_password BY ''', @nombre_usuario, ''';');
select CONCAT('GRANT ALL PRIVILEGES ON ''',@nombre_usuario,'''.* TO ''', @nombre_usuario, '''@''%'' with grant option;');

DELIMITER $$
DROP PROCEDURE IF EXISTS CrearUsuariosDesdeTabla$$
CREATE PROCEDURE CrearUsuariosDesdeTabla(in curs varchar(20))
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE nombre_usuario VARCHAR(255);

  -- Definir el cursor para leer los nombres de usuario de la tabla especificada
  DECLARE cur CURSOR FOR 
    SELECT usuario FROM alumnos.alumnos where curso = curs;

  -- Manejar el fin del cursor
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  -- Abrir el cursor
  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO nombre_usuario;
    IF done THEN
      LEAVE read_loop;
    END IF;

    -- Llamar al procedimiento CrearUsuario para cada nombre de usuario
    CALL CrearUsuario(nombre_usuario);
  END LOOP;

  -- Cerrar el cursor
  CLOSE cur;
END$$

DELIMITER ;

