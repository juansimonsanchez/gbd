DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

-- 🔹 TABLA AUTOR
CREATE TABLE autor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  nacionalidad VARCHAR(100)
);

-- 🔹 TABLA EDITORIAL
CREATE TABLE editorial (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150),
  pais VARCHAR(100)
);

-- 🔹 TABLA USUARIO
CREATE TABLE usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  email VARCHAR(150),
  telefono VARCHAR(20)
);

-- 🔹 TABLA LIBRO
CREATE TABLE libro (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200),
  id_autor INT,
  id_editorial INT,
  año_publicacion INT,
  genero VARCHAR(100),
  FOREIGN KEY (id_autor) REFERENCES autor(id),
  FOREIGN KEY (id_editorial) REFERENCES editorial(id)
);

-- 🔹 TABLA PRESTAMO
CREATE TABLE prestamo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  id_libro INT,
  fecha_prestamo DATE,
  fecha_devolucion DATE,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id),
  FOREIGN KEY (id_libro) REFERENCES libro(id)
);

-- 🔹 TABLA CATEGORIA
CREATE TABLE categoria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100)
);

-- 🔹 RELACIÓN LIBRO-CATEGORIA
CREATE TABLE libro_categoria (
  id_libro INT,
  id_categoria INT,
  PRIMARY KEY (id_libro, id_categoria),
  FOREIGN KEY (id_libro) REFERENCES libro(id),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

-- 🔹 TABLA MULTA
CREATE TABLE multa (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_prestamo INT,
  dias_retraso INT,
  importe DECIMAL(6,2),
  pagada BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (id_prestamo) REFERENCES prestamo(id)
);

---------------------------------------------------
-- 📚 DATOS
---------------------------------------------------

-- AUTORES (20)
INSERT INTO autor (nombre, nacionalidad) VALUES
('Gabriel García Márquez','Colombia'),
('Isabel Allende','Chile'),
('Julio Cortázar','Argentina'),
('Pablo Neruda','Chile'),
('Jorge Luis Borges','Argentina'),
('Mario Benedetti','Uruguay'),
('Miguel de Unamuno','España'),
('Federico García Lorca','España'),
('Octavio Paz','México'),
('Carlos Ruiz Zafón','España'),
('Arturo Pérez-Reverte','España'),
('Laura Gallego','España'),
('Stephen King','EEUU'),
('J.K. Rowling','Reino Unido'),
('George Orwell','Reino Unido'),
('Jane Austen','Reino Unido'),
('Mark Twain','EEUU'),
('Ernest Hemingway','EEUU'),
('Fiódor Dostoyevski','Rusia'),
('Leo Tolstoy','Rusia');

-- EDITORIALES
INSERT INTO editorial (nombre, pais) VALUES
('Planeta','España'),
('Penguin Random House','EEUU'),
('Alfaguara','España'),
('Anagrama','España'),
('HarperCollins','EEUU');

-- USUARIOS (20)
INSERT INTO usuario (nombre, email, telefono) VALUES
('Antonio García López', 'antonio.garcia.lopez@gmail.com', '612345678'),
('María Fernández Ruiz', 'maria.fernandez@outlook.es', '623456789'),
('José Martínez Sánchez', 'jose.martinez@yahoo.es', '634567890'),
('Carmen Rodríguez Gómez', 'carmen.rodriguez@gmail.com', '645678901'),
('Francisco López Pérez', 'fran.lopez@hotmail.com', '656789012'),
('Ana Sánchez Torres', 'ana.sanchez@gmail.com', '667890123'),
('David Pérez Moreno', 'david.perez@outlook.es', '678901234'),
('Laura Gómez Navarro', 'laura.gomez@gmail.com', '689012345'),
('Javier Díaz Romero', 'javier.diaz@yahoo.es', '690123456'),
('Lucía Martín Ortega', 'lucia.martin@gmail.com', '601234567'),
('Daniel Jiménez Castro', 'daniel.jimenez@gmail.com', '602345678'),
('Elena Ruiz Delgado', 'elena.ruiz@outlook.es', '613456789'),
('Alejandro Morales Vega', 'alex.morales@gmail.com', '624567890'),
('Sara Ortiz Cano', 'sara.ortiz@yahoo.es', '635678901'),
('Pablo Herrera Molina', 'pablo.herrera@gmail.com', '646789012'),
('Cristina Castro León', 'cristina.castro@hotmail.com', '657890123'),
('Miguel Ángel Núñez Gil', 'miguel.nunez@gmail.com', '668901234'),
('Raquel Medina Vidal', 'raquel.medina@outlook.es', '679012345'),
('Álvaro Iglesias Ramos', 'alvaro.iglesias@gmail.com', '680123456'),
('Beatriz Serrano Cruz', 'beatriz.serrano@yahoo.es', '691234567');

-- LIBROS (30)
INSERT INTO libro (titulo, id_autor, id_editorial, año_publicacion, genero) VALUES
('Cien años de soledad',1,1,1967,'Novela'),
('La casa de los espíritus',2,2,1982,'Novela'),
('Rayuela',3,3,1963,'Novela'),
('Ficciones',5,4,1944,'Cuento'),
('La tregua',6,1,1960,'Novela'),
('Niebla',7,2,1914,'Novela'),
('Romancero gitano',8,3,1928,'Poesía'),
('El laberinto de la soledad',9,4,1950,'Ensayo'),
('La sombra del viento',10,1,2001,'Novela'),
('El capitán Alatriste',11,2,1996,'Novela'),
('Harry Potter 1',14,5,1997,'Fantasía'),
('Harry Potter 2',14,5,1998,'Fantasía'),
('1984',15,2,1949,'Distopía'),
('Orgullo y prejuicio',16,3,1813,'Novela'),
('Tom Sawyer',17,4,1876,'Aventura'),
('El viejo y el mar',18,5,1952,'Novela'),
('Crimen y castigo',19,1,1866,'Novela'),
('Guerra y paz',20,2,1869,'Novela'),
('It',13,5,1986,'Terror'),
('Carrie',13,5,1974,'Terror'),
('El juego del ángel',10,1,2008,'Novela'),
('Los pilares de la Tierra',13,2,1989,'Histórica'),
('El código Da Vinci',13,3,2003,'Misterio'),
('Inferno',13,4,2013,'Misterio'),
('El alquimista',13,1,1988,'Novela'),
('Ensayo sobre la ceguera',13,2,1995,'Novela'),
('Drácula',13,3,1897,'Terror'),
('Frankenstein',13,4,1818,'Terror'),
('El Hobbit',13,5,1937,'Fantasía'),
('El Señor de los Anillos',13,5,1954,'Fantasía');

-- CATEGORIAS
INSERT INTO categoria (nombre) VALUES
('Novela'),('Poesía'),('Ensayo'),('Fantasía'),('Terror');

-- RELACIONES LIBRO-CATEGORIA
INSERT INTO libro_categoria VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),
(6,1),(7,2),(8,3),(9,1),(10,1),
(11,4),(12,4),(19,5),(20,5),
(29,4),(30,4);

-- PRESTAMOS (40)
INSERT INTO prestamo (id_usuario, id_libro, fecha_prestamo, fecha_devolucion) VALUES
(1,1,'2025-01-01','2025-01-10'),
(2,2,'2025-01-02','2025-01-12'),
(3,3,'2025-01-03',NULL),
(4,4,'2025-01-04','2025-01-15'),
(5,5,'2025-01-05',NULL),
(6,6,'2025-01-06','2025-01-16'),
(7,7,'2025-01-07',NULL),
(8,8,'2025-01-08','2025-01-18'),
(9,9,'2025-01-09',NULL),
(10,10,'2025-01-10','2025-01-20'),

(11,11,'2025-02-01',NULL),
(12,12,'2025-02-02','2025-02-12'),
(13,13,'2025-02-03',NULL),
(14,14,'2025-02-04','2025-02-14'),
(15,15,'2025-02-05',NULL),
(16,16,'2025-02-06','2025-02-16'),
(17,17,'2025-02-07',NULL),
(18,18,'2025-02-08','2025-02-18'),
(19,19,'2025-02-09',NULL),
(20,20,'2025-02-10','2025-02-20'),

(1,21,'2025-03-01',NULL),
(2,22,'2025-03-02',NULL),
(3,23,'2025-03-03','2025-03-13'),
(4,24,'2025-03-04',NULL),
(5,25,'2025-03-05',NULL),
(6,26,'2025-03-06','2025-03-16'),
(7,27,'2025-03-07',NULL),
(8,28,'2025-03-08',NULL),
(9,29,'2025-03-09',NULL),
(10,30,'2025-03-10',NULL);

-- MULTAS
INSERT INTO multa (id_prestamo, dias_retraso, importe, pagada) VALUES
(3,5,7.5,FALSE),
(7,10,15,FALSE),
(15,3,4.5,TRUE),
(22,7,10.5,FALSE);