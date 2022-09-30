CREATE DATABASE inventario_ferreteria;

USE inventario_ferreteria;

CREATE TABLE Producto(
  id_producto INT NOT NULL,
  nombre_producto VARCHAR(64),
  descripcion_producto VARCHAR(128),
  precio_entrada DOUBLE(10, 2),
  precio_salida DOUBLE(10, 2),
  PRIMARY KEY(id_producto)
);

CREATE TABLE Entrada(
  id_entrada INT NOT NULL,
  id_producto INT NOT NULL,
  costo_total DOUBLE(10, 2),
  fecha_entrada DATE,
  PRIMARY KEY(id_entrada),
  FOREIGN KEY(id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Salida(
  id_salida INT NOT NULL,
  id_producto INT NOT NULL,
  pago_total DOUBLE(10,2),
  fecha_salida DATE,
  PRIMARY KEY(id_salida),
  FOREIGN KEY(id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Proveedor(
  id_proveedor INT NOT NULL,
  id_entrada INT NOT NULL,
  nombre_proveedor VARCHAR(64),
  direccion_proveedor VARCHAR(128),
  PRIMARY KEY(id_proveedor),
  FOREIGN KEY(id_entrada) REFERENCES Entrada(id_entrada)
);

CREATE TABLE Cliente(
  id_cliente INT NOT NULL,
  id_salida INT NOT NULL,
  nombre_cliente VARCHAR(64),
  PRIMARY KEY(id_cliente),
  FOREIGN KEY(id_salida) REFERENCES Salida(id_salida)
);
