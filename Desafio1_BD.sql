---- Parte 1 -----

CREATE DATABASE posts;

\c posts;

CREATE TABLE post(id SERIAL, nombre_de_usuario VARCHAR(30), fecha_de_creacion DATE, contenido VARCHAR(25), descripcion VARCHAR(100), PRIMARY KEY id);

INSERT INTO post(nombre_de_usuario, fecha_de_creacion,contenido,descripcion) VALUES ('Pamela', '25-06-2020', 'Correo1','Revisar');

INSERT INTO post(nombre_de_usuario, fecha_de_creacion,contenido,descripcion) VALUES ('Pamela', '26-06-2020', 'Correo2','Revisar');

INSERT INTO post(nombre_de_usuario, fecha_de_creacion,contenido,descripcion) VALUES ('Carlos', '27-06-2020', 'Correo3','Revisar');

ALTER TABLE post ADD titulo VARCHAR(60);

UPDATE post 
SET titulo='titulo1'
WHERE
id=1;


UPDATE post 
SET titulo='titulo2'
WHERE
id=2;

UPDATE post 
SET titulo='titulo3'
WHERE
id=3;

INSERT INTO post(nombre_de_usuario, fecha_de_creacion,contenido,descripcion) VALUES ('Pedro', '26-06-2020', 'Correo4','Revisar');

INSERT INTO post(nombre_de_usuario, fecha_de_creacion,contenido,descripcion) VALUES ('Pedro', '27-06-2020', 'Correo5','Revisar');

DELETE FROM post WHERE nombre_de_usuario='Carlos';

INSERT INTO post(nombre_de_usuario, fecha_de_creacion,contenido,descripcion) VALUES ('Carlos', '30-06-2020', 'Correo6','Revisar');


---- Parte 2 -------

Para standarizar se tuvo que normalizar creando una tabla usuario.


---Creacion tabla usuario ----

CREATE TABLE usuario(id SERIAL, nombre VARCHAR(25), PRIMARY KEY(id));

---- Insert Registros ----

INSERT INTO usuario(nombre) VALUES ('Pamela');

INSERT INTO usuario(nombre) VALUES ('Carlos');

INSERT INTO usuario(nombre) VALUES ('Pedro');

INSERT INTO usuario(nombre) VALUES ('Margarita');


---- Creacion tabla post ----

CREATE TABLE post(id SERIAL,fecha_creacion DATE, contenido VARCHAR(25), descripcion VARCHAR(25), titulo VARCHAR(25),
idusuario INT, 
PRIMARY KEY (id),
FOREIGN KEY (idusuario) REFERENCES usuario(id));


----- Insert registros post -----

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('25-06-2020','Correo1','Revisar',
'titulo1',1);

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('26-06-2020','Correo2','Revisar',
'titulo2',1);

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('27-06-2020', 'Correo5','Revisar','',2);

delete from post where id=3;

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('27-06-2020', 'Correo3','Revisar','',3);

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('27-06-2020', 'Correo4','Revisar','',3);

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('27-06-2020', 'Correo5','Revisar','',2);

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('27-06-2020', 'Correo6','Revisar','',4);

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('27-06-2020', 'Correo7','Revisar','',4);

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('27-06-2020', 'Correo8','Revisar','',4);

INSERT INTO post(fecha_creacion,contenido,descripcion,titulo,idusuario) VALUES ('27-06-2020', 'Correo9','Revisar','',4);



----- Creacion tabla comentarios -----

CREATE TABLE comentarios(id SERIAL, fecha TIMESTAMP, contenido VARCHAR(25), idpost INT,
PRIMARY KEY (id), FOREIGN KEY (idpost) REFERENCES post(id));

------ Insert registros ------

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('25-06-2020','Pamela Comentario-1',1);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('25-06-2020','Pamela Comentario-2',2);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('24-06-2020','Carlos Comentario-1',6);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('24-06-2020','Carlos Comentario-2',6);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('26-06-2020','Carlos Comentario-3',6);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('27-06-2020','Carlos Comentario-4',6);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('27-06-2020','Margarita Comentario-1',7);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('27-06-2020','Margarita Comentario-2',7);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('27-06-2020','Margarita Comentario-3',7);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('27-06-2020','Margarita Comentario-4',7);

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('27-06-2020','Margarita Comentario-5',7);




