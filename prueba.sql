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