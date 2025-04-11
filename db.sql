
CREATE DATABASE techzone;
\c techzone;

CREATE TABLE categoria(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50)
);
CREATE TABLE pais(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR (50)
);
CREATE TABLE departamento(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    pais_id INT,
    FOREIGN KEY (pais_id) REFERENCES pais(id)
);
CREATE TABLE ciudad(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamento(id)
);
CREATE TABLE direccion(
    id SERIAL PRIMARY KEY,
    ciudad_id INT,
    calle VARCHAR (20),
    carrera VARCHAR(20),
    avenida VARCHAR(20),
    barrio VARCHAR(20),
    zip VARCHAR(100),
    FOREIGN KEY (ciudad_id) REFERENCES ciudad(id)
);
CREATE TABLE empresa(
    id SERIAL PRIMARY KEY ,
    nombre VARCHAR(50),
    direccion_id INT,
    FOREIGN KEY (direccion_id) REFERENCES direccion(id)
);
CREATE TABLE proveedor(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    empresa_id INT,
    FOREIGN KEY (empresa_id) REFERENCES empresa(id)
);
CREATE TABLE producto(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    categoria_id INT,
    precio DOUBLE PRECISION,
    stock INT,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);
CREATE TABLE proveedor_producto(
    id_proveedor INT,
    id_producto INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id),
    FOREIGN KEY (id_producto) REFERENCES producto(id)
);
CREATE TABLE cliente(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(50),
    numero_tel VARCHAR(20)
);
CREATE TABLE venta(
    id SERIAL PRIMARY KEY,
    cantidad INT,
    precio_total DOUBLE PRECISION
);
CREATE TABLE cliente_venta(
    cliente_id INT,
    venta_id INT,
    FOREIGN KEY (venta_id) REFERENCES venta(id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);
