--------------CREACION DE TABLAS-----------------------

CREATE TABLE empleados (
  ID_Empleado INT NOT NULL UNIQUE,
  Nombre VARCHAR(50),
  Direccion VARCHAR(50),
  Modificado DATETIME,
  Proceso VARCHAR(50),
  Salario FLOAT,
  PRIMARY KEY (ID_Empleado));

CREATE TABLE Monitoreo (
  ID_Empleado_Anterior INT NOT NULL,
  Nombre_Anterior VARCHAR(50),
  Direccion_Anterior VARCHAR(50),
  Modificado_Anterior DATETIME,
  Proceso_Anterior VARCHAR(50),
  Salario_Anterior FLOAT,
  ID_Empleado_Actual INT NOT NULL,
  Nombre_Actual VARCHAR(50),
  Direccion_Actual VARCHAR(50),
  Modificado_Actual DATETIME,
  Proceso_Actual VARCHAR(50),
  Salario_Actual FLOAT);

  ------------------CREACION TRIGGER INSERT------------------------------------

CREATE TRIGGER Insersion_Empleado AFTER INSERT ON empleados
FOR EACH ROW INSERT INTO Monitoreo (
ID_Empleado_Actual,
Nombre_Actual,
Direccion_Actual,
Modificado_Actual,
Proceso_Actual,
Salario_Actual) VALUES (NEW.ID_Empleado,
  NEW.Nombre,
  NEW.Direccion,
  NOW(),
  'Insersión',
  NEW.Salario);

INSERT INTO empleados VALUES (1, 'Juanito Banana', 'Donita #1', NOW(), 'Insersión 1', 1299.59);

------------------CREACION TRIGGER UPDATE------------------------------------

CREATE TRIGGER Actualizacion_Empleado BEFORE UPDATE ON empleados
FOR EACH ROW INSERT INTO Monitoreo (
ID_Empleado_Anterior,
Nombre_Anterior,
Direccion_Anterior,
Modificado_Anterior,
Proceso_Anterior,
Salario_Anterior,
ID_Empleado_Actual,
Nombre_Actual,
Direccion_Actual,
Modificado_Actual,
Proceso_Actual,
Salario_Actual) VALUES (
  OLD.ID_Empleado,
  OLD.Nombre,
  OLD.Direccion,
  OLD.Modificado,
  OLD.Proceso,
  OLD.Salario,
  NEW.ID_Empleado,
  NEW.Nombre,
  NEW.Direccion,
  NOW(),
  'Actualizacion',
  NEW.Salario);

  UPDATE empleados SET ID_Empleado = 1, Nombre = 'Juanito Banana', Direccion = 'Donita #1', Modificado = NOW(), Proceso = 'Actualizacion', Salario = 1399.59 WHERE ID_Empleado = 1;

------------------CREACION TRIGGER DELETE------------------------------------

CREATE TRIGGER Eliminacion_Empleado AFTER DELETE ON empleados
FOR EACH ROW INSERT INTO Monitoreo (
ID_Empleado_Anterior,
Nombre_Anterior,
Direccion_Anterior,
Modificado_Anterior,
Proceso_Anterior,
Salario_Anterior) VALUES (
  OLD.ID_Empleado,
  OLD.Nombre,
  OLD.Direccion,
  OLD.Modificado,
  OLD.Proceso,
  OLD.Salario);

  DELETE FROM empleados WHERE ID_Empleado = 1;
