-- primero creamos modelo físico

CREATE DATABASE prueba;

CREATE TABLE clients_table(
    id SERIAL,
    name VARCHAR(50),
    rut VARCHAR(10), --rut sin puntos, con guion y dv
    address VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE categories_table(
    id SERIAL,
    name VARCHAR(50),
    description VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE products_table(
    id SERIAL,
    name VARCHAR(50),
    description VARCHAR(255),
    unit_value INT,
    category_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES categories_table(id)
);

CREATE TABLE bills_table(
    id SERIAL,
    bill_date DATE,
    client_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients_table(id)
);

CREATE TABLE bill_product_relations(
    id SERIAL,
    bill_id INT,
    product_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (bill_id) REFERENCES bills_table(id),
    FOREIGN KEY (product_id) REFERENCES products_table(id)
);

-- insertaremos datos
-- 5 clientes
INSERT INTO clients_table (name, rut, address) VALUES ('ariel', '17000000-1', 'avenida apoquindo 5000, departamento 115, las condes'); 
INSERT INTO clients_table (name, rut, address) VALUES ('jose', '17000000-2', 'avenida carlos casanova 488, la reina');
INSERT INTO clients_table (name, rut, address) VALUES ('maria', '17000000-3', 'enrique mac-iver 390, departamento 72, Santiago Centro');
INSERT INTO clients_table (name, rut, address) VALUES ('ignacia', '17000000-4', 'avenida chile españa 358, departamento 128, ñuñoa');
INSERT INTO clients_table (name, rut, address) VALUES ('pablo', '17000000-5', 'avenida el golf 80, departamento 34, las condes');


--3 categorias
INSERT INTO categories_table (name, description) VALUES ('electronica', 'productos que tienen que ver con el mundo digital en que vivimos, smartphones, smart-tv, ps5 y mucho más...');
INSERT INTO categories_table (name, description) VALUES ('deporte', 'productos que tienen que ver con el mundo de actividad física, rendimiento y recreación.');
INSERT INTO categories_table (name, description) VALUES ('cocina', 'productos que tienen que ver con el mundo gastronómico del hogar, consigue todo lo necesario para crear los mejores platos');

--8 productos
INSERT INTO products_table (name, description, unit_value, category_id) VALUES ('iphone 20', 'el último iphone del mercado', 1500, 1);
INSERT INTO products_table (name, description, unit_value, category_id) VALUES ('smart-tv', 'la tele de 500 pulgadas que no puede faltar en tu patio', 3000, 1);
INSERT INTO products_table (name, description, unit_value, category_id) VALUES ('pelota de fútbol total 90', 'la mejor pelota de fútbol de la historia', 80, 2);
INSERT INTO products_table (name, description, unit_value, category_id) VALUES ('ps6', 'no seas como el resto con un ps5, consigue la ps6 con 40K de resolucion y 1000 tera de almacenaje', 5000, 1);
INSERT INTO products_table (name, description, unit_value, category_id) VALUES ('raqueta de tenis', 'esta raqueta llevó al chino ríos a ser número 1 del mundo', 200, 2);
INSERT INTO products_table (name, description, unit_value, category_id) VALUES ('sarten', 'sarten que tiene el mejor teflon del mundo, no se rompe con nada', 200, 3);
INSERT INTO products_table (name, description, unit_value, category_id) VALUES ('tenedor', 'un tenedor para comer alimentos gourmet', 4, 3);
INSERT INTO products_table (name, description, unit_value, category_id) VALUES ('cuchillo', 'un cuchillo para comer alimentos gourmet', 5, 3);

--10 facturas


--2 para el cliente 1
--una con 2 productos
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-10-30', 1);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (1, 5);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (1, 3);

--otra con 3 productos
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-11-05', 1);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (2, 8);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (2, 7);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (2, 6);



--3 para el cliente 2
--una con 3 productos
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-09-18', 2);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (3, 2);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (3, 5);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (3, 6);

--otra con 2 productos
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-09-26', 2);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (4, 1);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (4, 7);

--otra con 3 productos
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-12-01', 2);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (5, 3);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (5, 6);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (5, 8);


--una para el cliente 3 con un producto
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-08-23', 3);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (6, 1);


--4 para el cliente 4
--una con 2 productos
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-03-01', 4);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (7, 3);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (7, 5);

--otra con 3 productos
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-05-05', 4);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (8, 1);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (8, 5);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (8, 8);

--otra con 4 productos
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-07-20', 4);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (9, 2);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (9, 4);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (9, 6);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (9, 7);

--otra con 1 producto
INSERT INTO bills_table (bill_date, client_id) VALUES ('2020-09-28', 4);
INSERT INTO bill_product_relations (bill_id, product_id) VALUES (10, 5);

--revisamos avance
SELECT * FROM clients_table
SELECT * FROM categories_table;
SELECT * FROM products_table;
SELECT * FROM bills_table;
SELECT * FROM bill_product_relations;


