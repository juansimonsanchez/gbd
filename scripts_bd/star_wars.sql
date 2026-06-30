-- Crear base de datos
DROP DATABASE IF EXISTS star_wars;
CREATE DATABASE star_wars;
USE star_wars;

-- Crear tabla de planetas
CREATE TABLE planetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    clima VARCHAR(50),
    terreno VARCHAR(50)
    );
    
-- Crear tabla de personajes
CREATE TABLE personajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(50),
    genero VARCHAR(10),
    planeta_origen INT,
    FOREIGN KEY (planeta_origen) REFERENCES planetas(id)
);


-- Crear tabla de naves espaciales
CREATE TABLE naves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    modelo VARCHAR(100),
    fabricante VARCHAR(100),
    capacidad_pasajeros INT,
    capacidad_carga INT
);

-- Crear tabla de películas
CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(100),
    productor VARCHAR(100),
    fecha_estreno DATE
);

-- Crear tabla de personajes en películas
CREATE TABLE personajes_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    personaje_id INT,
    pelicula_id INT,
    FOREIGN KEY (personaje_id) REFERENCES personajes(id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id)
);

-- Crear tabla de naves en películas
CREATE TABLE naves_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nave_id INT,
    pelicula_id INT,
    FOREIGN KEY (nave_id) REFERENCES naves(id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id)
);

-- Insertar más datos en la tabla de planetas
INSERT INTO planetas (nombre, clima, terreno) VALUES
('Hoth', 'Helado', 'Desértico de hielo'),
('Dagobah', 'Húmedo', 'Pantanos'),
('Coruscant', 'Variado', 'Urbano'),
('Mustafar', 'Volcánico', 'Montañas y ríos de lava'),
('Naboo', 'Templado', 'Lagos y bosques'),
('Tatooine', 'Arido', 'Desértico'),
('Alderaan', 'Templado', 'Montañas'),
('Endor', 'Tropical', 'Bosque');

-- Insertar más datos en la tabla de personajes
INSERT INTO personajes (id,nombre, especie, genero, planeta_origen) VALUES
(1,'Darth Vader', 'Humano', 'Masculino', 4),
(2,'Yoda', 'Desconocido', 'Masculino', NULL),
(3,'Obi-Wan Kenobi', 'Humano', 'Masculino', 1),
(4,'Padmé Amidala', 'Humano', 'Femenino', 5),
(5,'Chewbacca', 'Wookiee', 'Masculino', NULL),
(6,'Palpatine', 'Humano', 'Masculino', NULL),
(7,'Luke Skywalker', 'Humano', 'Masculino', 1),
(8,'Leia Organa', 'Humano', 'Femenino', 2),
(9,'Han Solo', 'Humano', 'Masculino', 1);

-- Insertar más datos en la tabla de naves espaciales
INSERT INTO naves (nombre, modelo, fabricante, capacidad_pasajeros, capacidad_carga) VALUES
('TIE Fighter', 'TIE/LN', 'Sienar Fleet Systems', 1, 65),
('Star Destroyer', 'Imperial I-class', 'Kuat Drive Yards', 47060, 36000),
('Slave I', 'Firespray-31', 'Kuat Systems Engineering', 6, 10000),
('Death Star', 'DS-1 Orbital Battle Station', 'Imperial Department of Military Research', 843342, 10000),
('Millennium Falcon', 'YT-1300', 'Corellian Engineering Corporation', 6, 100000),
('X-Wing', 'T-65', 'Incom Corporation', 1, 110);

-- Insertar más datos en la tabla de películas
INSERT INTO peliculas (titulo, director, productor, fecha_estreno) VALUES
('Star Wars: Episode VI - Return of the Jedi', 'Richard Marquand', 'Howard Kazanjian', '1983-05-25'),
('Star Wars: Episode I - The Phantom Menace', 'George Lucas', 'Rick McCallum', '1999-05-19'),
('Star Wars: Episode II - Attack of the Clones', 'George Lucas', 'Rick McCallum', '2002-05-16'),
('Star Wars: Episode III - Revenge of the Sith', 'George Lucas', 'Rick McCallum', '2005-05-19'),
('Star Wars: Episode IV - A New Hope', 'George Lucas', 'Gary Kurtz', '1977-05-25'),
('Star Wars: Episode V - The Empire Strikes Back', 'Irvin Kershner', 'Gary Kurtz', '1980-05-21'),
('Star Wars: Episode VII - The Force Awakens', 'J.J. Abrams', 'Kathleen Kennedy', '2015-12-18');

-- Insertar datos en la tabla de personajes en películas
INSERT INTO personajes_peliculas (personaje_id, pelicula_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3);

-- Insertar datos en la tabla de naves en películas
INSERT INTO naves_peliculas (nave_id, pelicula_id) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5);


