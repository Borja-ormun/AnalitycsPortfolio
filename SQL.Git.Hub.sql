#############################################
# Ejercicio 1 - Clases Online - SQL
#############################################

##############################
# Comentarios iniciales
##############################

-- Bienvenidos! esto es un comentario

## vamos a aprender SQL, y esto tambien es un comentario

/* 
cualquier duda estoy a vuestra disposición, y de esta forma
podemos escribir un comentario
en varias lineas :)
*/

##############################
# Ejecución 
##############################

# Para ejecutar UNA query, situarse sobre ella (linea en gris) y pulsar: Ctr + Enter, Command + Enter
# rayo amarillo: ejecuta tooodo el script
# rayo amarillo con cursor: ejecuta query sobre la que estemos situados

########################################################################################################################
########################################################################################################################
# PARTE 1
########################################################################################################################
########################################################################################################################

##############################
# Crear base de datos
##############################

-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS streaming;

-- Crear la base de datos llamada streaming
CREATE DATABASE streaming;

-- Seleccionar la base de datos streaming para trabajar con ella
USE streaming;


##############################
# Crear tablas
##############################

-- Eliminamos las tablas en caso de existir
DROP TABLE IF EXISTS calificaciones;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS contenidos;

-- Crear tabla usuarios
CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100),
    fecha_registro DATE,
    fecha_nacimiento DATE
);

-- Crear tabla contenidos
CREATE TABLE contenidos (
    contenido_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    tipo_contenido VARCHAR(50),  -- Ejemplo: 'pelicula' o 'serie'
    año_lanzamiento INT,
    duracion INT,                -- En minutos
    genero VARCHAR(50)
);

-- Crear tabla calificaciones
CREATE TABLE calificaciones (
    calificacion_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    contenido_id INT,
    calificacion INT,            -- Valor de 1 a 10
    comentario VARCHAR(255),
    CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    CONSTRAINT fk_contenido FOREIGN KEY (contenido_id) REFERENCES contenidos(contenido_id)
);

-- Crear tabla planes
CREATE TABLE planes (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_plan VARCHAR(50),
    precio DECIMAL(5, 2),  -- Precio en formato decimal
    duracion_meses INT,    -- Duración en meses
    max_dispositivos INT    -- Número máximo de dispositivos permitidos
);


##############################
# Insertar datos en tablas
##############################

-- Insertar registros en la tabla usuarios
INSERT INTO usuarios (nombre, email, fecha_registro, fecha_nacimiento) VALUES
('carlos lopez', 'carlos.lopez@gmail.com', '2023-01-15', '1990-05-10'),
('ana perez', 'ana.perez@yahoo.com', '2023-02-10', '1988-03-22'),
('luis garcia', 'luis.garcia@hotmail.com', '2023-03-12', '1992-07-15'),
('marta sanchez', 'marta.sanchez@gmail.com', '2023-04-09', '1985-12-05'),
('david romero', 'david.romero@gmail.com', '2023-05-01', '1995-09-11'),
('sofia gomez', 'sofia.gomez@hotmail.com', '2023-06-18', '1993-06-17'),
('pablo torres', 'pablo.torres@yahoo.com', '2023-07-22', '1989-01-23'),
('laura diaz', 'laura.diaz@gmail.com', '2023-08-03', '1994-02-18'),
('javier ruiz', 'javier.ruiz@hotmail.com', '2023-09-14', '1991-04-09'),
('elena martin', 'elena.martin@yahoo.com', '2023-10-10', '1986-11-13'),
('andres fernandez', 'andres.fernandez@gmail.com', '2023-01-05', '1990-05-29'),
('patricia castro', 'patricia.castro@hotmail.com', '2023-02-17', '1987-08-30'),
('sergio ramirez', 'sergio.ramirez@yahoo.com', '2023-03-29', '1992-03-14'),
('carmen alvarez', 'carmen.alvarez@gmail.com', '2023-04-25', '1995-10-21'),
('juan castillo', 'juan.castillo@hotmail.com', '2023-05-08', '1991-06-07'),
('isabel ortiz', 'isabel.ortiz@yahoo.com', '2023-06-14', '1990-07-31'),
('roberto flores', 'roberto.flores@gmail.com', '2023-07-26', '1993-12-19'),
('clara herrera', 'clara.herrera@hotmail.com', '2023-08-11', '1988-09-02'),
('raul morales', 'raul.morales@gmail.com', '2023-09-28', '1985-05-16'),
('eva mendoza', 'eva.mendoza@yahoo.com', '2023-10-06', '1989-11-27'),
('carla espinoza', 'carla_espinoza@hotmail.com', '2023-07-14', '1992-08-19'),
('mario suarez', 'mario.suarez@yahoo.com', '2023-06-20', '1987-05-05'),
('luisa martinez', 'luisa.martinez@gmail.com', '2023-08-10', '1995-12-30'),
('rodrigo perez', 'rod.perez@hotmail.com', '2023-05-22', '1990-03-15'),
('isabel lopez', 'isabel.lopez@gmail.com', '2023-09-12', '1985-11-07'),
('isabel lopez', 'isabel.lopez2@gmail.com', '2024-01-12', '1985-11-13');

-- Insertar registros en la tabla contenidos
INSERT INTO contenidos (titulo, tipo_contenido, año_lanzamiento, duracion, genero) VALUES
('la casa de papel', 'serie', 2017, 70, 'accion'),
('stranger things', 'serie', 2016, 55, 'ciencia ficcion'),
('breaking bad', 'serie', 2008, 47, 'drama'),
('the crown', 'serie', 2016, 60, 'historia'),
('the mandalorian', 'serie', 2019, 45, 'ciencia ficcion'),
('friends', 'serie', 1994, 22, 'comedia'),
('the office', 'serie', 2005, 21, 'comedia'),
('game of thrones', 'serie', 2011, 60, 'fantasia'),
('the witcher', 'serie', 2019, 59, 'fantasia'),
('narcos', 'serie', 2015, 50, 'crimen'),
('dark', 'serie', 2017, 53, 'ciencia ficcion'),
('mindhunter', 'serie', 2017, 58, 'thriller'),
('the boys', 'serie', 2019, 60, 'accion'),
('chernobyl', 'serie', 2019, 60, 'historia'),
('el camino', 'pelicula', 2019, 122, 'drama'),
('black mirror', 'serie', 2011, 55, 'ciencia ficcion'),
('sherlock', 'serie', 2010, 90, 'crimen'),
('vikingos', 'serie', 2013, 44, 'historia'),
('westworld', 'serie', 2016, 57, 'ciencia ficcion'),
('los simpson', 'serie', 1989, 22, 'comedia');


-- Insertar registros en la tabla calificaciones
INSERT INTO calificaciones (usuario_id, contenido_id, calificacion, comentario) VALUES
(1, 1, 8, 'excelente trama, personajes interesantes'),
(1, 2, 7, 'algo predecible en algunos puntos'),
(2, 2, 9, 'gran serie de ciencia ficcion, me encanto'),
(2, 3, 10, 'una obra maestra, gran actuacion y direccion'),
(3, 3, 10, 'simplemente perfecto'),
(3, 5, 9, 'me encanto la historia y los efectos especiales'),
(3, 4, 8, 'interesante, pero un poco lenta en algunos episodios'),
(4, 5, 7, 'buena visualmente, pero la historia me parecio confusa'),
(4, 6, 9, 'muy entretenida, ideal para pasar el rato'),
(5, 7, 8, 'una serie graciosa, aunque algunas bromas son repetitivas'),
(5, 1, 7, 'buena trama, pero no me engancho completamente'),
(6, 9, 8, 'buena historia, pero demasiado enredada hacia el final'),
(6, 10, 9, 'excelente serie, aunque sobrevalorada para algunos'),
(7, 11, 9, 'perfecta combinacion de drama y ciencia ficcion'),
(7, 12, 7, 'bien desarrollada, aunque algo lenta'),
(7, 1, 8, 'gran comienzo, aunque luego se hace repetitiva'),
(8, 13, 10, 'accion espectacular y personajes muy interesantes'),
(8, 14, 10, 'un drama historico absolutamente impresionante'),
(8, 9, 9, 'compleja, pero vale la pena el esfuerzo'),
(9, 6, 8, 'divertida, pero no tanto como esperaba'),
(9, 10, 7, 'me gusto, pero no es tan espectacular como dicen'),
(9, 15, 8, 'drama interesante, aunque algo oscuro'),
(10, 3, 9, 'increible actuacion, una trama muy bien desarrollada'),
(10, 16, 8, 'critica social inteligente, aunque un poco pesada'),
(10, 17, 9, 'impresionantes escenas de accion y efectos visuales'),
(11, 18, 7, 'fantasia entretenida, pero demasiado larga a veces'),
(12, 19, 9, 'gran interpretacion y direccion, una obra maestra'),
(13, 7, 9, 'una comedia ligera, perfecta para relajarse'),
(13, 12, 8, 'suspenso bien llevado, pero algunas partes son lentas'),
(13, 14, 10, 'un drama historico poderoso y emotivo'),
(14, 4, 6, 'algo aburrida en algunos puntos'),
(14, 13, 9, 'llena de accion, excelente ritmo'),
(15, 18, 7, 'fantasia decente, pero pudo ser mejor'),
(15, 17, 9, 'muy buenos efectos especiales, la accion no para'),
(16, 11, 8, 'interesante, aunque un poco lenta en algunos puntos'),
(17, 2, 9, 'una trama intrigante, mantiene el interes alto'),
(17, 8, 10, 'epica y llena de sorpresas, me dejo impactado'),
(18, 5, 7, 'visualmente buena, pero la historia no me engancho'),
(18, 6, 9, 'divertida, ideal para pasar un buen rato'),
(19, 15, 8, 'drama interesante, aunque oscuro en algunos momentos'),
(20, 3, 10, 'simplemente perfecto, lo mejor que he visto'),
(20, 16, 8, 'muy buena critica social, aunque algo pesada'),
(20, 19, 9, 'excelente historia y actuaciones brillantes'),
(4, 12, 7, 'interesante, pero a veces es muy lenta'),
(5, 13, 8, 'llena de accion, personajes increibles'),
(9, 18, 7, 'fantasia entretenida, pero se alarga innecesariamente'),
(10, 14, 10, 'drama impresionante, gran ambientacion historica'),
(13, 7, 9, 'muy divertida, aunque algunas temporadas son repetitivas');

-- Insertar algunos planes
INSERT INTO planes (nombre_plan, precio, duracion_meses, max_dispositivos) VALUES
('basico', 9.99, 1, 1),
('estandar', 14.99, 1, 2),
('premium', 19.99, 1, 4),
('anual basico', 99.99, 12, 1),
('anual estandar', 149.99, 12, 2),
('anual premium', 199.99, 12, 4);


##############################
# Actualizar datos
##############################

-- Agregar la columna plan_id en la tabla usuarios
ALTER TABLE usuarios ADD plan_id INT;

-- Crear la clave foránea para relacionar usuarios con planes
ALTER TABLE usuarios
ADD CONSTRAINT fk_plan FOREIGN KEY (plan_id) REFERENCES planes(plan_id);

-- Asignar planes a los usuarios (algunos usuarios no tendrán plan asignado, lo que generará valores nulos)
UPDATE usuarios SET plan_id = 1 WHERE usuario_id IN (1, 2, 3, 4);
UPDATE usuarios SET plan_id = 2 WHERE usuario_id IN (5, 6, 7);
UPDATE usuarios SET plan_id = 3 WHERE usuario_id IN (8, 9);
UPDATE usuarios SET plan_id = 4 WHERE usuario_id = 10;
UPDATE usuarios SET plan_id = 5 WHERE usuario_id = 11;
UPDATE usuarios SET plan_id = 6 WHERE usuario_id = 12;
UPDATE usuarios SET plan_id = NULL WHERE usuario_id IN (13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25);


########################################################################################################################
########################################################################################################################
# PARTE 2
########################################################################################################################
########################################################################################################################


##############################
# Seleccionar datos
##############################

SELECT * FROM usuarios;
SELECT * FROM contenidos;
SELECT * FROM calificaciones;
SELECT * FROM planes;

SELECT COUNT(*) FROM usuarios;
SELECT COUNT(*) FROM contenidos;
SELECT COUNT(*) FROM calificaciones;
SELECT COUNT(*) FROM planes;

# SELECT * FROM * WHERE * HAVING * ORDER BY * LIMIT * ;

##############################
# Ejercicios consultas básicas
##############################

# 1. Seleccionar todos los usuarios que nacieron después del 1 de enero de 1990
SELECT nombre, email, fecha_nacimiento 
FROM usuarios 
WHERE fecha_nacimiento > '1990-01-01';

# 2. Encontrar todos los contenidos cuyo título empiezan por la palabra 'the'
SELECT titulo, genero 
FROM contenidos
WHERE titulo LIKE 'the%';

# 3. Contar cuántos contenidos son de tipo 'serie'
SELECT COUNT(*) AS total_series 
FROM contenidos 
WHERE tipo_contenido = 'serie';

# 4. Obtener los usuarios que se registraron en marzo de 2023
SELECT nombre, email 
FROM usuarios 
WHERE fecha_registro BETWEEN '2023-03-01' AND '2023-03-31';

SELECT nombre, email 
FROM usuarios 
WHERE fecha_registro LIKE '2023-03%';

# 5. Calcular el total y la media de calificaciones que tienen una puntuación de 7 o más

SELECT COUNT(*) AS num_calificaciones, AVG(calificacion) AS avg_calificacion 
FROM calificaciones 
WHERE calificacion >= 7;

# 6. Listar los contenidos que fueron lanzados antes del año 2000
SELECT titulo, año_lanzamiento 
FROM contenidos 
WHERE año_lanzamiento < 2000;

# 7. Seleccionar los usuarios cuyos nombres comienzan con la letra 'A'
SELECT nombre, email 
FROM usuarios 
WHERE nombre LIKE 'A%';


# 8. Calcular la suma total, el maximo y el minimo de las calificaciones dadas a un contenido específico (por ejemplo, `contenido_id = 4`)

SELECT SUM(calificacion) AS suma_calificaciones , 
	   MAX(calificacion) AS max_calificaciones, 
       MIN(calificacion) AS min_calificaciones,
       COUNT(calificacion) AS num_calificaciones
FROM calificaciones 
WHERE contenido_id = 4;

# 9. Listar los contenidos cuyo género sea 'acción' o 'drama'
SELECT titulo, año_lanzamiento 
FROM contenidos 
WHERE genero IN ('acción', 'drama');


##############################
# Ejercicios GROUP BY
##############################

# 1. Calcular la calificación máxima dada a cada contenido 
SELECT contenido_id, MAX(calificacion) AS calificacion_maxima 
FROM calificaciones
GROUP BY contenido_id;

# 2. Contar cuántos contenidos hay por género
SELECT genero, COUNT(contenido_id) AS total_contenidos 
FROM contenidos
GROUP BY genero
ORDER BY total_contenidos;

# 3. Calcular el promedio de duración de contenidos agrupados por tipo (pelicula, serie)
SELECT tipo_contenido, 
		AVG(duracion) AS promedio_duracion 
FROM contenidos
GROUP BY tipo_contenido;

# 4. Mostrar los usuarios que han dado más de 3 calificaciones (más, que NO igual)
SELECT usuario_id, COUNT(calificacion_id) AS total_calificaciones 
FROM calificaciones
GROUP BY usuario_id
HAVING COUNT(calificacion_id) > 3;

########################################################################################################################
########################################################################################################################
# PARTE 3
########################################################################################################################
########################################################################################################################


##############################
# Ejercicios Extra
##############################

# 1. Insertar un nuevo registro en la tabla `contenidos`
# 21, Shogun, serie, 2024, 60, aventura
# 22, Beetlejuice Beetlejuice, pelicula, 2024, 140, ciencia ficcion

INSERT INTO contenidos (contenido_id, titulo, tipo_contenido, año_lanzamiento, duracion, genero)
VALUES (21, 'Shogun', 'serie', 2024, 45, 'aventura'),(22, 'Beetlejuice Beetlejuic', 'pelicula', 2024, 140, 'ciencia ficcion');

# 2. Actualizar el precio del plan con id 3 a 14.99
UPDATE planes
SET precio = 14.99
WHERE plan_id = 3;

# 3. Eliminar todos los contenidos lanzados en el año 2021
SET SQL_SAFE_UPDATES = 0;
DELETE FROM contenidos
WHERE año_lanzamiento = 2021;
SET SQL_SAFE_UPDATES = 1;
# cambiar el safe mode

# 4. Contar el número total de usuarios registrados
SELECT COUNT(*) AS total_usuarios
FROM usuarios;

# 5. Obtener el promedio de duración de los contenidos que son películas
SELECT AVG(duracion) AS promedio_duracion
FROM contenidos
WHERE tipo_contenido = 'pelicula';

# 6. Mostrar la calificación más alta para cada contenido
SELECT contenido_id, MAX(calificacion) AS calificacion_maxima
FROM calificaciones
GROUP BY contenido_id
HAVING MAX(calificacion) IS NOT NULL;

# 7. Obtener todos los usuarios registrados entre el 1 de enero de 2023 y el 31 de diciembre de 2023
SELECT nombre, email
FROM usuarios
WHERE fecha_registro BETWEEN '2023-01-01' AND '2023-12-31';

# 8. Encontrar el mínimo y máximo de calificaciones dadas a cada contenido
SELECT contenido_id, MIN(calificacion) AS calificacion_minima, MAX(calificacion) AS calificacion_maxima
FROM calificaciones
GROUP BY contenido_id;

# 9. Contar cuántos contenidos hay por género y mostrar solo los géneros con más de 2 contenidos
SELECT genero, COUNT(*) AS total_contenidos
FROM contenidos
GROUP BY genero
HAVING COUNT(*) > 2;

########################################################################################################################
########################################################################################################################
# PARTE 4
########################################################################################################################
########################################################################################################################


##############################
# Ejercicios join, union
##############################

# 1. Ver todos los usuarios y sus planes, incluyendo a aquellos que no tienen plan

SELECT u.nombre, u.email, p.nombre_plan
FROM usuarios u
LEFT JOIN planes p 
ON u.plan_id = p.plan_id;

# 2. Ver el nombre de los usuarios que tienen plan, el tipo de plan que tienen y cuanto pagan

SELECT u.nombre, u.email, p.nombre_plan, p.precio, p.duracion_meses
FROM usuarios u
INNER JOIN planes p 
ON u.plan_id = p.plan_id;

# 3. Contar cuántos usuarios tienen cada tipo de plan

# ver diferencias: left, inner, right
SELECT p.nombre_plan, 
	COUNT(u.usuario_id) AS total_usuarios
FROM planes p
LEFT JOIN usuarios u ON p.plan_id = u.plan_id
GROUP BY p.nombre_plan;


########################################################################################################################
########################################################################################################################
# PARTE 5
########################################################################################################################
########################################################################################################################

##############################
# Funciones avanzadas
##############################

# 1. Mostrar el nombre de los usuarios, el nombre del plan que tienen, el precio y 
# un mensaje del descuento que tienen en función del precio:

# Si el precio del plan es mayor a 150, se aplica un "20% de descuento".
# Si el precio está entre 100 y 150, se aplica un "10% de descuento".
# Si el precio está entre 15 y 100, se aplica un "5% de descuento".
# Si es menor a 15, no hay descuento.

SELECT
  u.nombre,
  p.nombre_plan,
  p.precio,
  CASE
    WHEN p.precio > 150 THEN '20% de descuento'
    WHEN p.precio BETWEEN 100 AND 150 THEN '10% de descuento'
    WHEN p.precio BETWEEN 15 AND 100 THEN '5% de descuento'
    ELSE 'Sin descuento'
  END AS descuento
FROM usuarios u
LEFT JOIN planes p 
ON u.plan_id = p.plan_id;


# 2. Calcula cuántos años tiene un usuario basado en su fecha de nacimiento

SELECT nombre, 
       YEAR(CURDATE()) - YEAR(fecha_nacimiento) AS edad
FROM usuarios;


# 3. Calcular la cantidad de usuarios registrados por año y mostrar solo los años con más de 5 registros.

SELECT 
    YEAR(u.fecha_registro) AS año_registro,
    COUNT(u.usuario_id) AS total_usuarios
FROM usuarios u
GROUP BY año_registro
HAVING total_usuarios > 5;

########################################################################################################################
########################################################################################################################
# PARTE 6
########################################################################################################################
########################################################################################################################

##############################
# Subconsultas, CTEs, views
##############################

# 1. Obtener los usuarios que han calificado contenidos con la calificación más baja
SELECT nombre 
FROM usuarios 
WHERE usuario_id IN 
	(SELECT usuario_id FROM calificaciones WHERE calificacion = 
		(SELECT MIN(calificacion) FROM calificaciones)
	);


# CTE para Usuarios por Grupo de Edad

# 1. CTE para calcular la edad de los usuarios en base a la fecha de nacimiento
WITH usuarios_edad AS (
    SELECT 
        usuario_id,
        nombre,
        fecha_nacimiento,
        TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
    FROM usuarios
)
SELECT * FROM usuarios_edad;

# 2. Clasificar a los usuarios en grupos de edad y contar cuántos usuarios hay en cada grupo
WITH usuarios_edad AS (
    SELECT 
        usuario_id,
        nombre,
        fecha_nacimiento,
        TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
    FROM usuarios
)
SELECT 
    CASE 
        WHEN edad < 18 THEN 'Menor de Edad'
        WHEN edad BETWEEN 18 AND 35 THEN 'Jóven Adulto'
        WHEN edad BETWEEN 36 AND 60 THEN 'Adulto'
        ELSE 'Mayor'
    END AS grupo_edad,
    COUNT(usuario_id) AS total_usuarios
FROM usuarios_edad
GROUP BY grupo_edad;

# 3. Obtener el promedio de edad de los usuarios que se registraron en 2023
WITH usuarios_edad AS (
    SELECT 
        usuario_id,
        nombre,
        fecha_nacimiento,
        TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad,
        fecha_registro
    FROM usuarios
)
SELECT ROUND(AVG(edad), 2) AS promedio_edad
FROM usuarios_edad
WHERE YEAR(fecha_registro) = 2023;


# Crear una vista que muestra los usuarios con más de 1 calificacion
CREATE VIEW vista_usuarios_activos AS
SELECT u.usuario_id, u.nombre, COUNT(c.calificacion_id) AS total_calificaciones
FROM usuarios u
INNER JOIN calificaciones c ON u.usuario_id = c.usuario_id
GROUP BY u.usuario_id, u.nombre
HAVING total_calificaciones > 1;

# Consultar la vista para ver los usuarios más activos
SELECT * FROM vista_usuarios_activos;

# Eliminar vista
DROP VIEW vista_usuarios_activos;


########################################################################################################################
########################################################################################################################
# FIN
########################################################################################################################
########################################################################################################################


