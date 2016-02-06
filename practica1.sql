
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


--activar salisas
SET SERVEROUTPUT ON;
--EL IN ES PARA INDICAR Q ES DE ENTRADA 
--EL REPLASE ES PARA COMPLARLO LAS VECES Q QUIERAS
CREATE OR REPLACE PROCEDURE  HOLA_MUNDO(NOMBRE IN VARCHAR2)
AS
BEGIN
--CUERPO DEL PROCEDIMIENTO LOGICA
DBMS_OUTPUT.PUT_LINE(' HOLA COMO ESTAS '|| NOMBRE);
END;
/


BEGIN
HOLA_Mundo('PAPI ALVA');
END;
/


DECLARE
VALOR NUMBER;
BEGIN
SUMA(12,8,VALOR);
DBMS_OUTPUT.PUT_LINE(' LA SUMA ES : '||VALOR);
END;
/
----------------------------------------------------------------------------------
CREATE TABLE  PELICULA (ID_PELICULA INTEGER, 
                        TITULO VARCHAR2(120), 
                       SINOPSIS VARCHAR(500), 
                   CLASIFICACION VARCHAR2(3), 
                   CONSTRAINT PK_ID_PELICULA PRIMARY KEY (ID_PELICULA) 
                   );  
                   DESCRIBE PELICULA ; 
            
CREATE SEQUENCE sec_pelicula 
 start with 1 
 increment by 1 
 nomaxvalue;
 


CREATE OR REPLACE PROCEDURE GUARDAR_PELICULA  
( 
   MY_ID_PELICULA OUT NUMBER   
, MY_TITULO IN VARCHAR2   
, MY_SINOPSIS IN VARCHAR2   
 , MY_CLASIFICACION IN VARCHAR2   
) AS  
 BEGIN 
 --LOGICA 
 SELECT SEC_PELICULA.NEXTVAL INTO MY_ID_PELICULA FROM DUAL; 
 INSERT INTO PELICULA VALUES(MY_ID_PELICULA,MY_TITULO,MY_SINOPSIS,MY_CLASIFICACION); 

 END GUARDAR_PELICULA; 

/

DECLARE
VALOR INTEGER;
BEGIN
GUARDAR_PELICULA(VALOR,'EL RENACIDO','ESTA MASOMENOS','B');
END;
/

SELECT * FROM PELICULA;
---------------------------------------------------------------------------------------
6/02/16
create table simple1 (id_simple integer,edad integer,nombre varchar2(40));
--la llamamos con informacion rapida

declare
mi_edad integer;

begin
mi_edad:=20;
-- el loop e llave cierre
for i IN 1..20 LOOP 

mi_edad:= mi_edad + i;
insert into simple1 values (i,mi_edad,'juan carlos');
end loop;
end;
/


-- crear un cursor que busque el id que valga 21 y sustituir el nombre por el tu yo
update simple1 set nombre ='xxx' where edad=21;
set serveroutput on;

DECLARE

mi_nombre varchar(40) ;

BEGIN

SELECT nombre INTO mi_nombre 

dbms_output.put_line(mi_nombre);
end;
/
select * from simple1;

delete from simple1;

insert into simple1 values (1,21,'juan');

insert into simple1 values (2,25,'pedro');

insert into simple1 values (3,22,'pablo');

insert into simple1 values (4,23,'paco');


declare 
mi_nombre varchar (40);
begin

select nombre into mi_nombre from simple1 where edad=21;
dbms_output.put_line(mi_nombre);
end;
/
