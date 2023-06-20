CREATE TABLE productos(
cod_producto  CHAR(4 BYTE) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
descripcion  VARCHAR2(30 BYTE),
precio_unitario NUMBER(9,2)
);

CREATE TABLE clientes(
cod_cliente   char(5 BYTE) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
nombres VARCHAR2(30 BYTE)NOT NULL,
distrito VARCHAR2(30 BYTE),
telefono VARCHAR2(10 BYTE)
);

CREATE TABLE facturas(
cod_factura  CHAR(5 BYTE) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
fecha_emision DATE,
importe_total NUMBER(9,2),
FOREIGN KEY(cod_cliente)REFERENCES clientes(cod_cliente) 
);

CREATE TABLE detalle_facturas(
cantidad NUMBER(*,2) NOT NULL,
subtotal NUMBER(9,2) NOT NULL,
FOREIGN KEY(cod_factura)REFERENCES facturas (cod_factura),
FOREIGN KEY(cod_producto)REFERENCES productos (cod_producto)
);
--PUNTO 3
INSERT INTO productos(descipcion,precio_unitario)VALUES('ALTAVOCES',7000.00);
--PUNTO 4
--CAMBIAR NOMBRE DE PRODUCTO 8  POR IMPRESORA LÁSER
UPDATE productos SET descripcion = 'IMPRESORA LÁSER' WHERE cod_producto = 8;
--punto 5 10%descuento a todos los productos 
UPDATE productos SET precio_unitario = precio_unitario * 0.1;

--punto 6 
SELECT descripcion FROM productos ;
--punto 7
SELECT cod_producto,descripcion FROM productos WHERE precio_unitario<2000.00;

--punto 8
SELECT* FROM productos WHERE precio_unitario>600.00 AND precio_unitario<1200.00;
--punto 9
UPDATE productos SET precio_unitario = precio_unitario - 150.00 WHERE precio_unitario < 1200.00;
--punto 10
SELECT descripcion ,precio_unitario/450.00 as precio_dolar FROM PRODUCTOS;
--punto 11
SELECT descripcion ,precio_unitario/450.00 as precio_dolar FROM PRODUCTOS WHERE precio_unitario>= 1800.00 ORDER BY precio_unitario DESC , descripcion ;
