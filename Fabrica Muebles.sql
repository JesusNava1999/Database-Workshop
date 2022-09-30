CREATE DATABASE muebleria;

USE muebleria;

CREATE TABLE aserraderos (
  ID_Proveedor INT NOT NULL UNIQUE,
  Nombre VARCHAR(50),
  Direccion VARCHAR(50),
  ID_Materia_Prima INT NOT NULL,
  PRIMARY KEY (ID_Proveedor),
  FOREIGN KEY (ID_Materia_Prima) REFERENCES materias_primas (ID_Madera)
);

CREATE TABLE clientes (
  ID_Cliente INT NOT NULL UNIQUE,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Domicilio VARCHAR(50),
  PRIMARY KEY (ID_Cliente)
);

CREATE TABLE facturas (
  ID_Factura INT NOT NULL UNIQUE,
  ID_Cliente INT NOT NULL,
  Fecha_Pago DATE,
  Importe FLOAT,
  PRIMARY KEY (ID_Factura),
  FOREIGN KEY (ID_Cliente) REFERENCES clientes (ID_Cliente)
);

CREATE TABLE materias_primas (
  ID_Madera INT NOT NULL UNIQUE,
  Tipo_Madera VARCHAR(50),
  Largo FLOAT,
  Ancho FLOAT,
  Alto FLOAT,
  Costo FLOAT,
  Origen_Madera VARCHAR(50),
  PRIMARY KEY (ID_Madera)
);

CREATE TABLE materias_secundarias (
  ID_MS INT NOT NULL UNIQUE,
  Nombre VARCHAR(50),
  Costo FLOAT,
  Cantidad INT,
  PRIMARY KEY (ID_MS)
);

CREATE TABLE pedidos (
  ID_Pedido INT NOT NULL UNIQUE,
  Fecha_Solicitud DATE,
  Fecha_Entrega DATE,
  ID_Cliente INT NOT NULL,
  ID_Producto INT NOT NULL,
  ID_Factura INT NOT NULL,
  PRIMARY KEY (ID_Pedido),
  FOREIGN KEY (ID_Cliente) REFERENCES clientes (ID_Cliente),
  FOREIGN KEY (ID_Producto) REFERENCES productos (ID_Producto),
  FOREIGN KEY (ID_Factura) REFERENCES facturas (ID_Factura)
);

CREATE TABLE productos (
  ID_Producto INT NOT NULL UNIQUE,
  Nombre VARCHAR(50),
  Estilo VARCHAR(50),
  Materia_Prima INT NOT NULL,
  Fabricante INT NOT NULL,
  Materiales_Adicionales INT NOT NULL,
  Costo_Elaboracion FLOAT,
  Unidades_Vendidas INT,
  PRIMARY KEY (ID_Producto),
  FOREIGN KEY (Materia_Prima) REFERENCES materias_primas (ID_Madera),
  FOREIGN KEY (Fabricante) REFERENCES aserraderos (ID_Proveedor),
  FOREIGN KEY (Materiales_Adicionales) REFERENCES materias_secundarias (ID_MS)
);

"Consulta 1"
SELECT productos.Nombre, productos.Estilo, materias_primas.Tipo_Madera, aserraderos.Nombre
FROM productos INNER JOIN materias_primas ON productos.Materia_Prima=materias_primas.ID_Madera
INNER JOIN aserraderos ON aserraderos.ID_Proveedor=productos.Fabricante WHERE Tipo_Madera = 'Pino';

"Consulta 2"
SELECT aserraderos.Nombre, aserraderos.Direccion, materias_primas.Tipo_Madera, materias_primas.Largo,
materias_primas.Ancho, materias_primas.Alto FROM aserraderos INNER JOIN materias_primas ON
aserraderos.ID_Madera=materias_primas.ID_Madera;

"Consulta 3"
SELECT Nombre, Costo FROM materias_secundarias;

"Consulta 4"
SELECT productos.Nombre, productos.Estilo, productos.Costo_Elaboracion, materias_primas.Tipo_Madera
FROM productos INNER JOIN materias_primas ON productos.Materia_Prima=materias_primas.ID_Madera;

"Consulta 5"
SELECT Nombre, Unidades_Vendidas FROM productos WHERE Unidades_Vendidas >= 1;

"Consulta 6"
SELECT Tipo_Madera, Costo FROM materias_primas WHERE Costo >= 100;
