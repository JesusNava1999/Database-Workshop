CREATE USER 'Insertor'@'localhost' IDENTIFIED BY 'insertor';

CREATE USER 'Modificador'@'localhost' IDENTIFIED BY 'modificador';

CREATE USER 'Eliminador'@'localhost' IDENTIFIED BY 'eliminador';

USE mysql;
SELECT USER FROM USER;

GRANT SELECT, INSERT ON muebleria.* TO 'Insertor'@'localhost';

GRANT SELECT, UPDATE ON muebleria.* TO 'Modificador'@'localhost';

GRANT SELECT, DELETE ON muebleria.* TO 'Eliminador'@'localhost';

exit

"CMD--------------------------------------------------------"
C:\wamp\bin\mysql\mysql5.5.24\bin\mysql -u root -p


C:\wamp\bin\mysql\mysql5.5.24\bin\mysql -u Insertor -p
insertor

C:\wamp\bin\mysql\mysql5.5.24\bin\mysql -u Modificador -p
modificador

C:\wamp\bin\mysql\mysql5.5.24\bin\mysql -u Eliminador -p
eliminador
