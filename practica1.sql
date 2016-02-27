
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
----------------------------------------------------
FALTA UNO
----------------------------------------------------
CREATE TABLE EMPLEADO_VENTAS ( --17/02/16 CLASE
id_cliente NUMBER,
nombre_cliente VARCHAR2 (100),
SUELDO_BASE NUMBER,
CONSTRAINT PK_ID_CLIENTE PRIMARY KEY (ID_CLIENTE));

insert into EMPLEADO_VENTAS values(1,'Juan',5200);
insert into EMPLEADO_VENTAS values(2,'Petra',4200);
insert into EMPLEADO_VENTAS values(3,'Panfilo',6400);
insert into EMPLEADO_VENTAS values(4,'Anacleta',5700);
insert into EMPLEADO_VENTAS values(5,'Chana',4600);


select * from EMPLEADO_VENTAS;

CREATE TABLE SUCURSAL(
ID_SUCURSAL NUMBER,
ID_CLIENTE NUMBER,
NOMBRE VARCHAR2(120),
TELEFONO VARCHAR2(40),
VENTA NUMBER,
CONSTRAINT PK_ID_SUCURSAL PRIMARY KEY (ID_SUCURSAL),
CONSTRAINT FK_ID_CLIENTE1 FOREIGN KEY (ID_CLIENTE) REFERENCES EMPLEADO_VENTAS (ID_CLIENTE));

INSERT INTO SUCURSAL VALUES(1,1,'LAS AMERICAS', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(2,1,'PLAZA ARAGON', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(3,1,'PLAZA COYOACAN', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(4,1,'PERISUR', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(5,2,'LAS AMERICAS', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(6,2,'PERISUR', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(7,3,'PLAZA ARAGON', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(8,4,'PLAZA COYOACAN', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(9,4,'LAS AMERICAS', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(10,5,'LAS AMERICAS', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(11,5,'PERISUR', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(12,5,'PERISUR', '67 55 66 77',4000);
INSERT INTO SUCURSAL VALUES(13,5,'PLAZA COYOACAN', '67 55 66 77',4000);

SELECT * FROM SUCURSAL;

DECLARE
CURSOR CUR_EMPLEADOS IS SELECT * FROM empleado_ventas; --ESTE ES EL CURSOR 
BEGIN  
--AQUI VA LA LOGICA 
FOR REC_EMP  IN CUR_EMPLEADOS LOOP--REC ES UNA FILA QUE SE VA A BARRER,IN ES EL CURSOR CREADO  
--
DBMS_OUTPUT.PUT_LINE('NOMBRE: '||REC_EMP.NOMBRE_CLIENTE||'SUELDO:'||REC_EMP.SUELDO_BASE);

END LOOP;
END;
/

SET SERVEROUTPUT ON;--

---------------------------------------------------------------------------

DECLARE
CURSOR CUR_EMP IS SELECT * FROM empleado_ventas;
CURSOR CUR_SUC IS SELECT * FROM SUCURSAL;--ESTE ES EL CURSOR 
BEGIN  
--AQUI VA LA LOGICA 
FOR EMP  IN CUR_EMP LOOP--REC ES UNA FILA QUE SE VA A BARRER,IN ES EL CURSOR CREADO  
FOR SUC IN CUR_SUC LOOP

IF EMP.ID_CLIENTE=SUC.ID_CLIENTE THEN
DBMS_OUTPUT.PUT_LINE('EMPLEADO  '||EMP.NOMBRE_CLIENTE||'SUCURSAL  '||SUC.NOMBRE);
END IF;
END LOOP;
END LOOP;
END;
/
-----------------------------------------------
examen practica 
CREATE TABLE libros
  (
    libro_id           INTEGER,
    isbn              VARCHAR2(13),
    titulo            VARCHAR2(200),
    resumen           VARCHAR2(2000),
    autor             VARCHAR2(200),
    fecha_publicacion DATE,
    num_pag           NUMBER,
    CONSTRAINT pk_libro_id PRIMARY KEY (libro_id));
   
                    CREATE SEQUENCE libros
          
 start with 1 
 increment by 1 
 nomaxvalue; 


SET serveroutput ON;

create or replace procedure guardarlibros(my_id out integer ,my_isbn in varchar2,my_titulo in varchar2,my_resumen in varchar2 ,my_autor in varchar2,dia in integer,mes in varchar2 ,año in integer ,my_num in number);

DECLARE 
my_fecha Date;



BEGIN
my_fecha:=to_date(''||dia||'-'||mes||'-'||anio);




INSERT INTO libros values (valor_id, '1234','Abrupt climate change', 'Trata de que todos vamos a morir por contaminadores','John Wallace',27,'jan',2010,455);


  

END LOOP;
end;
/
---------------------------------------------------
27/02/16

CREATE TABLE XXX(
                   ID_XXX INTEGER, 
                   EDAD INTEGER);
                   
                   --COMO ES TIPO DE VALIDACION SE USA BEFORE 
CREATE OR REPLACE TRIGGER XXX_MAYOR_EDAD BEFORE INSERT  ON XXX  FOR EACH ROW --DECLARACION DE PROCEDIMIENTO, DISPARADOR

BEGIN-- AQUI VA LA LOGICA 

IF:NEW.EDAD < 18 THEN 

RAISE_APPLICATION_ERROR(-20001,'LO SIENTO CHAMACO PRECOZ, NO TE PUEDES REGISTRAR' );
END IF;
END;
/

INSERT INTO XXX VALUES(1,17);
SELECT * FROM XXX;
/

-------------------------------------------------------------------------------
CREATE TABLE NOMINA_XXX(ID_NOMINAXXX INT,
                      LOGIN VARCHAR2(10),
                      SALDO INTEGER);

INSERT INTO NOMINA_XXX VALUES (1,'JUAN',20000);

CREATE OR REPLACE TRIGGER ACTUALIZAR_SALDO BEFORE UPDATE  ON NOMINA_XXXXXX  FOR EACH ROW

BEGIN 
:NEW.SALDO:=:NEW.SALDO+:OLD.SALDO;

END;
/

UPDATE nomina_xxx SET 
SALDO= -800 WHERE ID_NOMINAXXX=1;

SELECT * FROM NOMINA_XXX;
