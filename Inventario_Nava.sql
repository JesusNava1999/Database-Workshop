CREATE DATABASE Ferreteria;

USE Ferreteria;

CREATE TABLE Producto (
  ID_Producto INT NOT NULL UNIQUE,
  Nombre VARCHAR(50),
  Unidades INT NOT NULL,
  Precio_unitario FLOAT(30),
  PRIMARY KEY(ID_Producto));

CREATE TABLE Cliente (
  ID_Cliente INT NOT NULL UNIQUE,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Domicilio VARCHAR(50),
  PRIMARY KEY (ID_Cliente));

CREATE TABLE Proveedor (
  ID_Proveedor INT NOT NULL UNIQUE,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Domicilio VARCHAR(50),
  PRIMARY KEY (ID_Proveedor));

CREATE TABLE Compras (
  ID_Compra INT NOT NULL UNIQUE,
  ID_Proveedor INT NOT NULL UNIQUE,
  Fecha DATE,
  ID_Producto INT NOT NULL UNIQUE,
  Importe_total FLOAT(30),
  PRIMARY KEY(ID_Compra),
  FOREIGN KEY(ID_Proveedor) REFERENCES Proveedor(ID_Proveedor),
  FOREIGN KEY(ID_Producto) REFERENCES producto(ID_Producto));

CREATE TABLE Ventas (
  ID_Venta INT NOT NULL UNIQUE,
  ID_Cliente INT NOT NULL UNIQUE,
  Fecha DATE,
  ID_Producto INT NOT NULL UNIQUE,
  Importe_total FLOAT(30),
  PRIMARY KEY(ID_Venta),
  FOREIGN KEY(ID_Cliente) REFERENCES cliente(ID_Cliente),
  FOREIGN KEY(ID_Producto) REFERENCES producto(ID_Producto));
