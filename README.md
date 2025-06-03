# Proyecto-Final-SI2003-Sistemas-de-Gesti-n-de-datos
Diseño e Implementación de una base de datos para un Sistemas de Gestión de Cursos
dame esta informacion en estilo de documentacion README.md
 
# info de la materia: <0701> <Bases de Datos>
#
# Estudiante(s): 
#Juan Jose Restrepo Cardona, jjrestrepc@eafit.edu.co
#Isabel Acevedo Acosta, iacevedoa@eafit.edu.co
#Cristian David Cabezas, cdcabezasj@eafit.edu.co
 
#
# Profesor: Edwin Nelson Montoya, emontoya@eafit.brightspace.com
#
# Plataforma de Gestión del Aprendizaje para Cursos en Línea – Proyecto Final Nodo EAFIT
#
# 1. breve descripción de la actividad
 
# Este proyecto simula un sistema de gestión de aprendizaje similar a Moodle para la plataforma Nodo de la Universidad EAFIT. Permite a estudiantes, profesores y administradores interactuar con cursos en línea, tareas, materiales, foros, usuarios y matrículas mediante una interfaz en consola desarrollada en Python. Toda la información se gestiona a través de una base de datos relacional en MySQL Workbench.
# El sistema está diseñado para ejecutarse desde consola y gestionar completamente el ciclo de vida académico de un curso virtual.
## 1.1. Que aspectos cumplió o desarrolló de la actividad propuesta por el profesor (requerimientos funcionales y no funcionales)
#•	Autenticación y control de sesión para usuario, profesor y administrador.
#•	Asignación de profesores a cursos.
#•	Matriculación de estudiantes por parte del administrador.
#•	Acciones de profesor: subir materiales, crear foros, calificar tareas, enviar y responder mensajes.
#•	Acciones de estudiante: ver tareas, entregar tareas, participar en foros.
#•	Módulo de reportes para el administrador con filtros para cursos y usuarios, y también para ver información de los cursos.
#•	Simulación para subir archivos sin manejo de archivos reales.
#•	Acciones de Administrador: Registrar usuarios a curso, asignar usuarios a curso y reportes.
 

## 1.2. Que aspectos NO cumplió o desarrolló de la actividad propuesta por el profesor (requerimientos funcionales y no funcionales)
  No se implementó interfaz gráfica, solamente menús desde la terminal integrada.
# 2. información general de diseño de alto nivel, arquitectura, patrones, mejores prácticas utilizadas.
#•	 Arquitectura por capas modular: Se realizó la separación lógica de autenticación, menú administrador, menú profesor/estudiante y reportes de administrador.
#•	Uso de funciones específicas por rol (admin, profesor, estudiante).
#•	Manejo de la conexión a la base de datos centralizado (db.py).
#•	Diseño relacional de base de datos siguiendo buenas prácticas (PK, FK, N:M).
 
# 3. Descripción del ambiente de desarrollo y técnico: lenguaje de programación, librerias, paquetes, etc, con sus numeros de versiones.
##Lenguaje:
#•	Python 3.13.2
##Librerías:
#•	mysql-connector-python 8.0.33
#•	datetime
##Base de Datos:
#•	MySQL Workbench 8.0
##Sistema operativo usado en pruebas:
#•	Windows 11
##Base de datos:
#•	Nombre: NODO_Data_Base
Conexión: Configurada en db.py (usuario: root, password: W0k-18*kash)
(usuario: root, password: Italia6-8*)
##
##Detalles del desarrollo
#•	El proyecto está desarrollado completamente en Python orientado a consola.
#•	La autenticación y las opciones del sistema se manejan según el tipo de usuario (Administrador, Profesor, Estudiante).
#•	Se establecieron flujos separados para cada tipo de usuario, cada uno con un menú personalizado.
#•	Todas las acciones del sistema están organizadas por módulos en archivos .py específicos.
#•	Las validaciones, confirmaciones e interacciones son a través de inputs de consola.
##
##Detalles técnicos
#•	La conexión a la base de datos se gestiona desde un archivo db.py centralizado.
#•	La base de datos se conecta vía localhost, puerto por defecto de MySQL (3306).
#•	La autenticación de usuarios usa email + contraseña.
#•	Las relaciones entre entidades siguen un modelo entidad-relación tradicional.
#•	Las claves primarias y foráneas están definidas explícitamente en el SQL.
#•	Se simulan archivos usando solo nombres de archivo.

##Configuración del proyecto
#•	Conexión a base de datos definida en db.py:
#host="localhost"
#user="root"
#password="W0k-18*kash"
#database="NODO_Data_Base"
##
# 4. Descripción del ambiente de EJECUCIÓN (en producción) lenguaje de programación, librerias, paquetes, etc, con sus numeros de versiones.

##Sistema probado en:
#•	Python 3.13.2 (consola)
#•	MySQL Server local
##Inicio del sistema:
#•	Ejecutar main.py en Terminal
#•	Iniciar sesión con email y contraseña, poniéndolo directamente en la consola.
#•	Navegación por menú según tipo de usuario ingresando el número de la opción en la consola.

##Guía de menús para usuarios:

#Administrador:
#•	Matricular estudiantes
#•	Asignar profesor
#•	Consultar reportes

##Profesor:
#•	Ver cursos asignados
#•	Publicar materiales
#•	Crear foros
#•	Ver tareas
#•	Ver alumnos

##Estudiante:
#•	Ver cursos matriculados
#•	Descargar tareas
#•	Participar en foros
#•	Enviar respuestas

#MENÚ PROFESOR
![image](https://github.com/user-attachments/assets/3a56c66e-78c3-4d9f-9fe3-c0de8b018677)

#MENÚ ESTUDIANTE
![image](https://github.com/user-attachments/assets/28541643-79fa-4be4-b31f-b3acff7acda0)

#MENÚ ADMINISTRADOR
![image](https://github.com/user-attachments/assets/b04b318f-e51e-489f-a749-45529b0c01e1)

# 5. otra información que considere relevante para esta actividad.
# No tenemos otra información relevante que podamos poner para esta actividad.

## Referencias:
•	https://www.eafit.edu.co/nodo
•	https://moodle.org/
•	Documentación oficial MySQL: https://dev.mysql.com/doc/
•	Documentación mysql-connector-python: https://pypi.org/project/mysql-connector-python/
•	Python docs: https://docs.python.org/3/
•	ChatGPT: https://auth.openai.com/log-in
 
 
