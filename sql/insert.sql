INSERT INTO categoria(nombre) VALUES('Computadores'),('Tablets'),('Celulares'),('Acesorios'),('Monitores'),('Teclados'),('Mouses'),('Audifonos'),('Impresoras'),('Almacenamient'),('Routers'),('Drone'),('Gafas VR'),('consolas'),('Camaras'),('Tarjetas graficas'),('Gaming');
INSERT INTO pais(nombre) VALUES ('Colombia'),('Ecuador'),('Panama'),('Peru'),('Brazil'),('Canada'),('Alemania'),('Ucrania'),('Bolivia'),('Italia'),('España'),('Venezuela'),('Uruguay'),('Chile'),('Mexico');

INSERT INTO departamento(nombre, pais_id) VALUES ('Santander',1),('Tolima',1),('Antioquia',1);
INSERT INTO ciudad(nombre,departamento_id) VALUES ('Bucaramanga',1),('Ibague',2),('Medellin',3),('El carmen',1),('Mariquita',2);
INSERT INTO direccion(ciudad_id,calle, carrera,avenida,barrio,code) VALUES
(1,'32','29',NULL,'La Aurora','680001'),
(1,'12','28','Bucaros','Real de Minas','680001'),
(1,'36','27-29',NULL, 'Centro','680001'),
(1,'51','33',NULL,'Cabecera del llano', '680002'),
(3,'1-50','43A',NULL,'El poblado','0520021'),
(3,'50','52-30',NULL,'La candelaria','0520012'),
(2,' 37','5',NULL,'Centro'),
(2,'60','7-90','Santana','El Vergel','730006');
