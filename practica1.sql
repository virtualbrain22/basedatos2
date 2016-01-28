
--Crearemos una tabla muy simple para probar el poder de PL SQL

CREATE TABLE DANCE(ID_dANCE INTEGER,NOMBRE VARCHAR2(40), EDAD INTEGER );
--Prendemos el servidor en modo de desarrollador 
SET SERVEROUTPUT ON;
--VAMOS A EMPEZAR CON UN BLOQUE PL SQL 
DECLARE 
--AQUI SE DECLARAN LAS VARIABLES A USARSE
EDAD INTEGER;
YEARS INTEGER ;
--AQUI VA LA LOGICA DEL PROGRAMA 
BEGIN 

YEARS:=21;
EDAD:=YEARS*365;

DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES'||EDAD);

END;
/
--Crearemos una tabla muy simple para probar el poder de PL SQL

CREATE TABLE DANCE(ID_dANCE INTEGER,NOMBRE VARCHAR2(40), EDAD INTEGER );
--Prendemos el servidor en modo de desarrollador 
SET SERVEROUTPUT ON;
--VAMOS A EMPEZAR CON UN BLOQUE PL SQL 
DECLARE 
--AQUI SE DECLARAN LAS VARIABLES A USARSE
EDAD INTEGER;
YEARS INTEGER ;
--AQUI VA LA LOGICA DEL PROGRAMA 
BEGIN 

YEARS:=21;
EDAD:=YEARS*365;

DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES'||EDAD);

END;
/

--CREAR UN BLOQUE PL SQL QUE GENERE 200,000 REGISTRO EN SECUEJNCIA ASCENDENTE EN LA TABLA DANCE

BEGIN 

 FOR I IN 1..200000 LOOP
 
   INSERT INTO DANCE VALUES(I,'OSCAR',21);
   
   END LOOP;
   END;
/
--HACEMOS UN SELECT PARA VER Q HACE 
SELECT * FROM DANCE;
/
--SITEMA DE PELICULAS  LA DE SALA ES DE TAREA 

CREATE TABLE  PELICULA (ID_PELICULA INTEGER,
                       TITULO VARCHAR2(120),
                      SINOPSIS VARCHAR(500),
                  CLASIFICACION VARCHAR2(2),
                  CONSTRAINT PK_ID_PELICULA PRIMARY KEY (ID_PELICULA)
                  ); 
                  DESCRIBE PELICULA ;
          
CREATE TABLE HORARIO (ID_HORARIO  INTEGER,
                       ID_PELICULA INTEGER ,
                       HORARIO VARCHAR2(8),
                       CONSTRAINT PK_ID_HORARIO PRIMARY KEY(HORARIO ),
                       CONSTRAINT FK1_ID_PELICULA FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA (ID_PELICULA));
                       
CREATE TABLE SALA (ID_SALA INTEGER,
                   ID_PELICULA INTEGER,
                   NUMSALA VARCHAR(3),
                   CONSTRAINT PK_ID_SALA PRIMARY KEY(SALA),
                   CONSTRAINT FK2_ID_PELICULA FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA (ID_PELICULA));
                   
                   CREATE SEQUENCE sec_pelicula
start with 1
increment by 1
nomaxvalue;
