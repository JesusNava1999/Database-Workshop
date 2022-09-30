CREATE DATABASE tecmm_social;

USE tecmm_social;

CREATE TABLE Usuario (
  id_usuario INT NOT NULL UNIQUE,
  id_administrativo INT UNIQUE,
  id_estudiante INT UNIQUE,
  id_docente INT UNIQUE,
  correoinstitucional VARCHAR(50),
  alias VARCHAR(15),
  nombre VARCHAR(50),
  apellidopaterno VARCHAR(30),
  apellidomaterno VARCHAR(30),
  contraseña VARCHAR(20),
  imagen_perfil MEDIUMBLOB,
  PRIMARY KEY (id_usuario)
);

CREATE TABLE Administrativo (
  id_administrativo INT NOT NULL UNIQUE,
  departamento VARCHAR(50),
  PRIMARY KEY (id_administrativo)
);

CREATE TABLE Estudiante (
  id_estudiante INT NOT NULL UNIQUE,
  id_semestre INT NOT NULL,
  id_grupo INT UNIQUE,
  id_carrera INT UNIQUE,
  numerodecontrol INT(8),
  PRIMARY KEY(id_estudiante)
);

CREATE TABLE Docente (
  id_docente INT NOT NULL UNIQUE,
  id_grupo INT,
  id_carrera INT,
  numerodecontrol INT UNIQUE,
  PRIMARY KEY(id_docente)
);

CREATE TABLE Evento (
  id_evento INT NOT NULL UNIQUE,
  id_administrativo INT NOT NULL,
  fecha DATE,
  lugar VARCHAR(50),
  descripcion VARCHAR(50),
  PRIMARY KEY (id_evento)
);

CREATE TABLE Semestre (
  id_semestre INT NOT NULL UNIQUE,
  numero INT,
  PRIMARY KEY (id_semestre)
);

CREATE TABLE Nota (
  id_nota INT NOT NULL UNIQUE,
  id_usuario_autor INT NOT NULL,
  contenido VARCHAR(30),
  PRIMARY KEY (id_nota)
);

CREATE TABLE Carrera (
  id_carrera INT NOT NULL UNIQUE,
  nombrecarrera VARCHAR(100),
  codigo VARCHAR(15),
  PRIMARY KEY (id_carrera)
);

CREATE TABLE Publicacion (
  id_publicacion INT NOT NULL UNIQUE,
  id_usuario INT NOT NULL,
  id_grupo INT NOT NULL,
  contenido VARCHAR(144),
  contador_vistas INT,
  PRIMARY KEY (id_publicacion)
);

CREATE TABLE Grupo (
  id_grupo INT NOT NULL UNIQUE,
  id_materia INT NOT NULL,
  id_docente INT NOT NULL,
  id_estudiante INT NOT NULL,
  tipo VARCHAR(2),
  codigo VARCHAR(8),
  PRIMARY KEY (id_grupo)
);

CREATE TABLE Comentario (
  id_comentario INT NOT NULL UNIQUE,
  id_publicacion INT NOT NULL,
  id_usuario_autor INT NOT NULL,
  contenido VARCHAR(144),
  PRIMARY KEY (id_comentario)
);

CREATE TABLE Materia (
  id_materia INT NOT NULL UNIQUE,
  id_semestre INT NOT NULL,
  id_docente INT NOT NULL,
  nombre VARCHAR(50),
  PRIMARY KEY (id_materia)
);

INSERT INTO Usuario VALUES (
  1,
  1,
  NULL,
  NULL,
  "admin1@zapopan.tecmm.edu.mx",
  "admin1",
  "Juanito",
  "Lopez",
  "Perez",
  "1234",
  NULL
);

INSERT INTO Administrativo VALUES (
  1,
  "Control Escolar"
);

INSERT INTO Usuario VALUES (
  2,
  NULL,
  1,
  NULL,
  "za18011108@zapopan.tecmm.edu.mx",
  "NavaRQ",
  "Jose de Jesus",
  "Nava",
  "Cuellar",
  "1234",
  NULL
);

INSERT INTO Estudiante VALUES (
  1,
  2021,
  1,
  1,
  18011108
);

INSERT INTO Usuario VALUES (
  3,
  NULL,
  NULL,
  1,
  "marina.dobrova@zapopan.tecmm.edu.mx",
  "MARDOB",
  "Marina",
  "Dobrova",
  "----",
  "1234",
  NULL
);

INSERT INTO Docente VALUES (
  1,
  1,
  1,
  18011114
);

INSERT INTO Evento VALUES (
  1,
  1,
  NULL,
  "Domo",
  "Acto Academico"
);

INSERT INTO Semestre VALUES (
  2021,
  1
);

INSERT INTO Nota VALUES (
  1,
  2,
  "Crear Base de Datos"
);

INSERT INTO Carrera VALUES (
  1,
  "Ingenieria en Sistemas Computacionales",
  "ISC"
);

INSERT INTO Publicacion VALUES (
  1,
  2,
  1,
  "Crear Base de Datos: Saludos",
  1
);

INSERT INTO Grupo VALUES (
  1,
  1,
  1,
  1,
  "A",
  "COD-1214"
);

INSERT INTO Comentario VALUES (
  1,
  1,
  3,
  "Gracias"
);

INSERT INTO Materia VALUES (
  1,
  2021,
  1,
  "Adminsitracion de Bases de Datos"
);

ALTER TABLE Usuario ADD COLUMN (
  FOREIGN KEY(id_administrativo) REFERENCES Administrativo(id_administrativo),
  FOREIGN KEY(id_estudiante) REFERENCES Estudiante(id_estudiante),
  FOREIGN KEY(id_docente) REFERENCES  Docente(id_docente)
);

ALTER TABLE Estudiante ADD COLUMN (
  FOREIGN KEY(id_semestre) REFERENCES Semestre(id_semestre),
  FOREIGN KEY(id_grupo) REFERENCES Grupo(id_grupo),
  FOREIGN KEY(id_carrera) REFERENCES Carrera(id_carrera)
);

ALTER TABLE Docente ADD COLUMN (
  FOREIGN KEY(id_grupo) REFERENCES Grupo(id_grupo),
  FOREIGN KEY(id_carrera) REFERENCES Carrera(id_carrera)
);

ALTER TABLE Nota ADD COLUMN (
  FOREIGN KEY(id_usuario_autor) REFERENCES Usuario(id_usuario)
);

ALTER TABLE Publicacion ADD COLUMN (
  FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY(id_grupo) REFERENCES Grupo(id_grupo)
);

ALTER TABLE Grupo ADD COLUMN (
  FOREIGN KEY(id_materia) REFERENCES Materia(id_materia),
  FOREIGN KEY(id_docente) REFERENCES Docente(id_docente),
  FOREIGN KEY(id_estudiante) REFERENCES Estudiante(id_estudiante)
);

ALTER TABLE Comentario ADD COLUMN (
  FOREIGN KEY(id_publicacion) REFERENCES Publicacion(id_publicacion),
  FOREIGN KEY(id_usuario_autor) REFERENCES Usuario(id_usuario)
);

ALTER TABLE Materia ADD COLUMN (
  FOREIGN KEY(id_semestre) REFERENCES Semestre(id_semestre),
  FOREIGN KEY(id_docente) REFERENCES Docente(id_docente)
);

ALTER TABLE Evento ADD COLUMN (
  FOREIGN KEY(id_administrativo) REFERENCES Administrativo(id_administrativo)
);


DESCRIBE Usuario;
DESCRIBE Administrativo;
DESCRIBE Estudiante;
DESCRIBE Docente;
DESCRIBE Evento;
DESCRIBE Semestre;
DESCRIBE Nota;
DESCRIBE Carrera;
DESCRIBE Publicacion;
DESCRIBE Grupo;
DESCRIBE Comentario;
DESCRIBE Materia;

SELECT * FROM Usuario;
SELECT * FROM Administrativo;
SELECT * FROM Estudiante;
SELECT * FROM Docente;
SELECT * FROM Evento;
SELECT * FROM Semestre;
SELECT * FROM Nota;
SELECT * FROM Carrera;
SELECT * FROM Publicacion;
SELECT * FROM Grupo;
SELECT * FROM Comentario;
SELECT * FROM Materia;
