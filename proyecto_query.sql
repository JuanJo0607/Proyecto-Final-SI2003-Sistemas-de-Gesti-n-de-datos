-- ENTREGA 2 SISTEMAS DE GESTIÓN DE DATOS PROYECTO FINAL
-- INTEGRANTES
--  Isabel Acevedo Acosta
-- Cristian David Cabezas Jimenes
-- Juan José Restrepo Cardona

CREATE DATABASE IF NOT EXISTS NODO_Data_Base;
USE NODO_Data_Base;


-- TABLA USUARIO
CREATE TABLE IF NOT EXISTS Usuario ( 
	id_usuario INT NOT NULL PRIMARY KEY,
    documento_identidad VARCHAR(20),
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    email VARCHAR(50),
    genero VARCHAR(30),
    contrasena VARCHAR(100),
    id_nodo INT
);

-- REFERENCIA BANCARIA
CREATE TABLE IF NOT EXISTS Referencia_Bancaria ( 
	id_referencia INT NOT NULL PRIMARY KEY,
    id_usuario INT UNIQUE,
    referencia_bancaria VARCHAR(50),
    FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario)
);

-- PROFESOR
CREATE TABLE IF NOT EXISTS Profesor ( 
	id_profesor INT NOT NULL PRIMARY KEY,
    id_usuario INT UNIQUE,
    telefono VARCHAR(20),
    FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS Area_Conocimiento (
	id_area_conocimiento INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Estudiante ( 
	id_estudiante INT NOT NULL PRIMARY KEY,
    id_usuario INT UNIQUE,
    id_area_conocimiento INT,
    FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY(id_area_conocimiento) REFERENCES Area_Conocimiento(id_area_conocimiento)
);

-- ADMINISTRADOR
CREATE TABLE IF NOT EXISTS Administrador ( 
	id_admin INT NOT NULL PRIMARY KEY,
    id_usuario INT UNIQUE,
    FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario)
);

-- CURSO
CREATE TABLE IF NOT EXISTS Curso ( 
	id_curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    url_contenido VARCHAR(2048),
    fecha_inicio DATE,
    fecha_fin DATE,
    año INT,
    semestre INT,
    precio DECIMAL(10,2),
    id_profesor INT,
    FOREIGN KEY(id_profesor) REFERENCES Profesor(id_profesor)
);

-- AREA PROFESOR
CREATE TABLE IF NOT EXISTS Area_Profesor ( 
	id_profesor INT,
    area VARCHAR(50),
    PRIMARY KEY(area, id_profesor),
    FOREIGN KEY(id_profesor) REFERENCES Profesor(id_profesor)
);

-- MATERIAL
CREATE TABLE IF NOT EXISTS Material ( 
	id_material INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion TEXT,
    id_curso INT,
    FOREIGN KEY(id_curso) REFERENCES Curso(id_curso)
);

-- ARCHIVO MATERIAL
CREATE TABLE IF NOT EXISTS Archivo_Material ( 
	id_archivo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_archivo VARCHAR(100),
    id_material INT,
    FOREIGN KEY(id_material) REFERENCES Material(id_material)
);

-- MATRICULA (N:M)
CREATE TABLE IF NOT EXISTS Matricula ( 
	id_matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_matricula DATE,
    contrasena_acceso VARCHAR(50),
    id_estudiante INT,
    id_curso INT,
    FOREIGN KEY(id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY(id_curso) REFERENCES Curso(id_curso)
);

-- TAREA
CREATE TABLE IF NOT EXISTS Tarea ( 
	id_tarea INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    fecha_creacion DATE,
    fecha_entrega DATE,
    puntaje DECIMAL(5,2),
    nombre_archivo VARCHAR(100),
    id_curso INT,
    FOREIGN KEY(id_curso) REFERENCES Curso(id_curso)
);


-- ENTREGA TAREA
CREATE TABLE IF NOT EXISTS Entrega_Tarea ( 
	id_entrega INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_archivo_entregado VARCHAR(100),
    fecha_entrega DATE,
    id_tarea INT,
    id_estudiante INT,
    FOREIGN KEY(id_tarea) REFERENCES Tarea(id_tarea),
    FOREIGN KEY(id_estudiante) REFERENCES Estudiante(id_estudiante)
);

-- FORO
CREATE TABLE IF NOT EXISTS Foro ( 
	id_foro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    fecha_creacion DATE,
    fecha_terminacion DATE,
    id_curso INT,
    FOREIGN KEY(id_curso) REFERENCES Curso(id_curso)
);

-- MENSAJE
CREATE TABLE IF NOT EXISTS Mensaje ( 
	id_mensaje INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    id_foro INT,
    id_usuario INT,
    id_mensaje_replicado INT,
    FOREIGN KEY(id_foro) REFERENCES Foro(id_foro),
    FOREIGN KEY(id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY(id_mensaje_replicado) REFERENCES Mensaje(id_mensaje)
);

-- 1. Usuario
INSERT INTO Usuario (
  id_usuario,
  documento_identidad,
  nombre,
  apellido,
  email,
  genero,
  contrasena,
  id_nodo
) VALUES
(1, '123456789', 'Ana', 'García', 'ana.garcia@correo.com', 'Femenino', 'passAna123', 1001), -- Profesor
(2, '987654321', 'Carlos', 'López', 'carlos.lopez@correo.com', 'Masculino', 'passCarlos456', 1002), -- Profesor
(3, '456789123', 'Laura', 'Mejía', 'laura.mejia@correo.com', 'Femenino', 'passLaura789', 1003), -- Profesor
(4, '654123987', 'Diego', 'Martínez', 'diego.martinez@correo.com', 'Masculino', 'passDiego321', 1004), -- Profesor
(5, '789456123', 'Juliana', 'Toro', 'juliana.toro@correo.com', 'Femenino', 'passJuliana852', 1005), -- Profesor
(6, '1122334455', 'Camila', 'Restrepo', 'camila.restrepo@correo.com', 'Femenino', 'claveCamila123', 1006), -- Estudiante
(7, '3344556677', 'Andrés', 'Zapata', 'andres.zapata@correo.com', 'Masculino', 'claveAndres456', 1007), -- Estudiante
(8, '7788990011', 'Valentina', 'Gómez', 'valentina.gomez@correo.com', 'Femenino', 'passValen789', 1008), -- Estudiante
(9, '9900112233', 'Esteban', 'Ríos', 'esteban.rios@correo.com', 'Masculino', 'passEsteban321', 1009); -- Admin

-- 2. Referencia Bancaria
INSERT INTO Referencia_Bancaria (
  id_referencia,
  id_usuario,
  referencia_bancaria
) VALUES
(896, 4, 'REF001-A'),
(753, 5, 'REF002-B'),
(412, 6, 'REF003-C');

-- 3. Profesor
INSERT INTO Profesor (
  id_profesor,
  id_usuario,
  telefono
) VALUES
(1, 1, '3001234567'),
(2, 2, '3019876543'),
(3, 3, '3024567890'),
(4, 4, '3036543210'),
(5, 5, '3041239876');

-- 4. Área de Conocimiento
INSERT INTO Area_Conocimiento (
  id_area_conocimiento,
  nombre
) VALUES
(1, 'Sistemas'),
(2, 'Finanzas'),
(3, 'Mecánica'),
(4, 'Música'),
(5, 'Matemáticas');

-- 5. Estudiante
INSERT INTO Estudiante (
  id_estudiante,
  id_usuario,
  id_area_conocimiento
) VALUES
(369, 6, 1),
(002, 7, 3),
(003, 8, 5);

-- 6. Administrador
INSERT INTO Administrador (
  id_admin,
  id_usuario
) VALUES
(123, 9);

-- 7. Área Profesor
INSERT INTO Area_Profesor (
  id_profesor,
  area
) VALUES
(1, 'Sistemas'),
(2, 'Finanzas'),
(3, 'Mecánica'),
(4, 'Música'),
(5, 'Matemáticas');

-- 8. Curso
INSERT INTO Curso (
  id_curso,
  nombre,
  categoria,
  url_contenido,
  fecha_inicio,
  fecha_fin,
  año,
  semestre,
  precio,
  id_profesor
) VALUES
(1, 'Curso de Python', 'Sistemas', 'http://contenido.com/python', '2025-08-01', '2025-12-01', 2025, 2, 100000.00, 1),
(2, 'Fundamentos de Finanzas', 'Finanzas', 'http://contenido.com/finanzas', '2025-08-10', '2025-12-10', 2025, 2, 120000.00, 2),
(3, 'Taller de Mecánica', 'Mecánica', 'http://contenido.com/mecanica', '2025-08-15', '2025-12-15', 2025, 2, 550000.00, 3),
(4, 'Historia de la Música', 'Música', 'http://contenido.com/musica', '2025-09-01', '2025-12-20', 2025, 2, 90000.00, 4),
(5, 'Álgebra Lineal', 'Matemáticas', 'http://contenido.com/algebra', '2025-08-20', '2025-12-05', 2025, 2, 150000.00, 5);

-- USE NODO_data_base;
-- SELECT * FROM Curso;

-- 9. Material
INSERT INTO Material (
  id_material,
  titulo,
  descripcion,
  id_curso
) VALUES
(9764, 'Guía de Python', 'Material introductorio sobre Python', 1),
(4613, 'Resumen de Finanzas', 'Contiene temas clave de fundamentos', 2),
(9854, 'Prácticas Mecánicas', 'Actividades básicas de laboratorio', 3),
(2839, 'Historia de la Música', 'Notas y lecturas sobre música clásica', 4),
(8217, 'Matrices y Vectores', 'Material de estudio para álgebra', 5);


-- 10. Archivo Material
INSERT INTO Archivo_Material (
id_archivo,
nombre_archivo,
id_material
) VALUES
(1, 'guia_python.pdf', 9764),
(2, 'finanzas_resumen.docx', 4613),
(3, 'practicas_mecanica.xlsx', 9854),
(4, 'musica_historia.pdf', 2839),
(5, 'algebra_matrices.pdf', 8217);

-- 11. Matrícula
INSERT INTO Matricula (
  id_matricula,
  fecha_matricula,
  contrasena_acceso,
  id_estudiante,
  id_curso
) VALUES
(368, '2025-08-05', 'claveA1', 369, 1),
(257, '2025-08-10', 'claveB2', 002, 2),
(149, '2025-08-12', 'claveC3', 003, 3);

-- 12. Tarea
INSERT INTO Tarea (
  id_tarea,
  nombre,
  descripcion,
  fecha_creacion,
  fecha_entrega,
  puntaje,
  nombre_archivo,
  id_curso
) VALUES
(1, 'Tarea 1 - Python', 'Variables y tipos de datos', '2025-08-06', '2025-08-13', 10.0, 'tarea_python1.pdf', 1),
(2, 'Ejercicio Finanzas', 'Cálculo de intereses', '2025-08-11', '2025-08-18', 15.0, 'tarea_finanzas.docx', 2),
(3, 'Informe Mecánica', 'Experimento de poleas', '2025-08-13', '2025-08-20', 12.0, 'tarea_mecanica.zip', 3);

-- CONSULTAS --

-- 1.Listar todos los estudiantes (nombre completo, matrícula) para un año y semestre concreto ordenados alfabéticamente por nombre
SELECT 
  CONCAT(u.nombre, ' ', u.apellido) AS nombre_completo,
  m.id_matricula
FROM Matricula m
JOIN Estudiante e ON m.id_estudiante = e.id_estudiante
JOIN Usuario u ON e.id_usuario = u.id_usuario
JOIN Curso c ON m.id_curso = c.id_curso
WHERE c.año = 2025 AND c.semestre = 2 
ORDER BY u.nombre;

-- 2. Listar todos los estudiantes (nombre completo) de un curso determinado para un año y semestre concreto 
SELECT U.nombre, U.apellido, M.id_matricula
FROM Usuario U
JOIN Estudiante E ON U.id_usuario = E.id_usuario
JOIN Matricula M ON E.id_estudiante = M.id_estudiante
JOIN Curso C ON M.id_curso = C.id_curso
WHERE C.año = 2025 AND C.semestre = 2 AND C.id_curso = 1  -- cualquier otro ID como ejemplo
ORDER BY U.nombre;

-- 3. Listar todos los cursos que un estudiante ha tenido entre un rango de fechas
SELECT DISTINCT c.nombre, c.fecha_inicio, c.fecha_fin
FROM Matricula m
JOIN Curso c ON m.id_curso = c.id_curso
WHERE m.id_estudiante = 1
AND c.fecha_inicio >= '2025-08-01'
AND c.fecha_fin <= '2025-12-31';

-- 4. Listar profesores (id, nombre completo) y cursos que tiene asignados actualmente
SELECT p.id_profesor, CONCAT(u.nombre, ' ', u.apellido) AS nombre_completo, c.nombre AS curso
FROM Profesor p
JOIN Usuario u ON p.id_usuario = u.id_usuario
LEFT JOIN Curso c ON p.id_profesor = c.id_profesor
WHERE c.fecha_fin >= CURDATE() OR c.fecha_fin IS NULL
ORDER BY p.id_profesor;

-- 5. Listar todos los cursos ordenados por categoría. (nombre del curso, categoría).  
SELECT nombre, categoria
FROM Curso
ORDER BY categoria;

-- 6. Listar los cursos con un rango de precio entre val_minimo y val_máximo (a modo de ejemplo del query coloque 100.000 y 500.000) 
SELECT nombre, precio
FROM Curso
WHERE precio BETWEEN 100000 AND 500000;

-- 7. Listar los usuarios que están registrados, pero no están matriculados en ningún curso para un año y semestre específico. 
SELECT u.nombre, u.apellido
FROM Usuario u
JOIN Estudiante e ON u.id_usuario = e.id_usuario
WHERE e.id_estudiante NOT IN (
  SELECT id_estudiante FROM Matricula m
  JOIN Curso c ON m.id_curso = c.id_curso
  WHERE c.año = 2025 AND c.semestre = 2
);

-- 8. Listar los cursos que se encuentran en una categoría (a modo de ejemplo: la categoría Computación.  
SELECT nombre, categoria
FROM Curso
WHERE categoria = 'Sistemas';

-- 9. Listar las tareas que los estudiantes deben realizar en el curso dado con identificador x 
SELECT nombre, descripcion, fecha_entrega
FROM Tarea
WHERE id_curso = 1;

-- 10. Listar los materiales que el profesor ha publicado en un curso dado 
SELECT m.titulo, m.descripcion
FROM Material m
JOIN Curso c ON m.id_curso = c.id_curso
WHERE c.id_curso = 1;

-- 11. Listar todos los mensajes de un foro en un curso, listando el id y nombre del que envió en mensaje (a modo de ejemplo especifique id de curso/foro o solo id de foro) 
SELECT ms.id_mensaje, u.nombre, u.apellido, ms.descripcion
FROM Mensaje ms
JOIN Usuario u ON ms.id_usuario = u.id_usuario
JOIN Foro f ON ms.id_foro = f.id_foro
WHERE f.id_foro = 1;

-- 12. Especifique una consulta que consideraría muy importante en este sistema, y la realiza (Consultar Cursos y Estudiantes por profesor).
SELECT 
  CONCAT(u.nombre, ' ', u.apellido) AS profesor,
  COUNT(DISTINCT c.id_curso) AS cantidad_cursos,
  COUNT(DISTINCT m.id_estudiante) AS cantidad_estudiantes
FROM Profesor p
JOIN Usuario u ON p.id_usuario = u.id_usuario
LEFT JOIN Curso c ON p.id_profesor = c.id_profesor
LEFT JOIN Matricula m ON c.id_curso = m.id_curso
GROUP BY p.id_profesor
ORDER BY cantidad_cursos DESC;
