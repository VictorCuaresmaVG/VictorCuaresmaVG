-- Este una database de la Panaderia y Bodega San Jose

-- Cambia al contexto de la base de datos principal del servidor
USE master;

-- Elimina la base de datos "db_bdgpan" si ya existe
DROP DATABASE IF EXISTS db_bdgpan;

-- Crea una nueva base de datos llamada "db_bdgpan"
CREATE DATABASE db_bdgpan;

-- Cambia al contexto de la base de datos "db_bdgpan"
USE db_bdgpan;


-- Crea una tabla llamada "client" para almacenar información de los clientes
CREATE TABLE client
(
    -- Identificador único para cada cliente, se genera automáticamente
    Id int identity(1,1) PRIMARY KEY,
    -- Nombre del cliente, se requiere en cada registro
    names varchar(40) NOT NULL,
    -- Apellidos del cliente, se requiere en cada registro
    last_names varchar(80) NOT NULL,
    -- Tipo de documento del cliente (por ejemplo, "DNI", "CNE") se requiere en cada registro
    documentType char(3) NOT NULL,
    -- Número de documento del cliente, se requiere en cada registro
    documentNumber varchar(15) NOT NULL,
    -- Dirección de correo electrónico del cliente, se requiere en cada registro
    email varchar(80) NOT NULL,
    -- Número de teléfono del cliente, se requiere en cada registro
    phone char(9) NOT NULL,
    -- Estado del cliente (por ejemplo, "A" para activo o "I" para inactivo), tiene un valor predeterminado de "A"
    state char(1) DEFAULT 'A' NOT NULL,
    -- Fecha de registro del cliente, tiene un valor predeterminado de la fecha actual
    registration_date date DEFAULT GETDATE() NOT NULL,
    -- Contraseña del cliente, se requiere en cada registro
    Password VARCHAR(255) NOT NULL,
	-- Fecha de nacimiento del cliente, se requiere en cada registro
    birthdate date NOT NULL,
);

-- Table: sales
CREATE TABLE sales (
    sales_id int  NOT NULL,
    sale_date date  NOT NULL,
    receipt_type varchar(10)  NOT NULL,
    sales_code char(10)  NOT NULL,
    tipe_ofpay varchar(10)  NOT NULL,
    stocks_id int  NOT NULL,
    CONSTRAINT sales_pk PRIMARY KEY  (sales_id)
);

-- Table: employees
CREATE TABLE employees (
    employee_id int  NOT NULL,
    name varchar(70)  NOT NULL,
    surnames varchar(70)  NOT NULL,
    cargo varchar(20)  NOT NULL,
    salary decimal(8,2)  NOT NULL,
    CONSTRAINT employees_pk PRIMARY KEY  (employee_id)
);

-- Table: products
CREATE TABLE products (
    product_code int  NOT NULL,
    product_name varchar(90)  NOT NULL,
    product_type varchar(10)  NOT NULL,
    by_product varchar(10)  NOT NULL,
    supplier_id int  NOT NULL,
    CONSTRAINT products_pk PRIMARY KEY  (product_code)
);

-- Table: sale_detail
CREATE TABLE sale_detail (
    id int  NOT NULL,
    Importe decimal(8,2)  NOT NULL,
    amount varchar(10)  NOT NULL,
    sales_sales_id int  NOT NULL,
    CONSTRAINT sale_detail_pk PRIMARY KEY  (id)
);

-- Table: stocks
CREATE TABLE stocks (
    id int  NOT NULL,
    expiration_date date  NOT NULL,
    start_date date  NOT NULL,
    stock_quantity int  NOT NULL,
    product_id int  NOT NULL,
    person_id int  NOT NULL,
    purchase_price int  NOT NULL,
    products_product_code int  NOT NULL,
    customers_id int  NOT NULL,
    CONSTRAINT stocks_pk PRIMARY KEY  (id)
);

-- Table: supplier
CREATE TABLE supplier (
    id int  NOT NULL,
    ruc char(11)  NOT NULL,
    company_name varchar(70)  NOT NULL,
    mail varchar(70)  NOT NULL,
    phone char(9)  NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY  (id)
);

--Validaciones y Restricciones de Clientes:

-- Agrega restricción a la columna "names" para aceptar solo letras y espacios
ALTER TABLE client
ADD CONSTRAINT CK_names CHECK (names NOT LIKE '%[^A-Za-z ]%');

-- Agrega restricción a la columna "last_names" para aceptar solo letras y espacios
ALTER TABLE client
ADD CONSTRAINT CK_last_names CHECK (last_names NOT LIKE '%[^A-Za-z ]%');

-- Agrega restricciones a la columna "documentNumber" basado en el tipo de documento
ALTER TABLE client
ADD CONSTRAINT CK_documentNumber CHECK 
(
    (documentType = 'DNI' AND LEN(documentNumber) = 8) OR
    (documentType = 'CNE' AND LEN(documentNumber) = 15)
);

-- Agrega restricción a la columna "email" para aceptar solo direcciones de correo electrónico válidas
ALTER TABLE client
ADD CONSTRAINT CK_email CHECK (email LIKE '%@%.%');

-- Agrega restricción a la columna "phone" para aceptar solo números y 9 dígitos
ALTER TABLE client
ADD CONSTRAINT CK_phone CHECK (phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

-- Agrega restricción a la columna "password" para cumplir con los requisitos especificados
ALTER TABLE client
ADD CONSTRAINT CK_password CHECK (password LIKE '%[A-Z]%[0-9]%' AND LEN(password) >= 8 AND LEN(password) <= 15);

-- Este comando se utiliza para convertir la columna "birthdate" en una cadena de caracteres con formato de fecha "dd/mm/aaaa"
-- y mostrarla como "birthdate_formatted" en el resultado del SELECT.
SELECT CONVERT(varchar, birthdate, 103) AS birthdate_formatted FROM client;


-- Agregar Informacion a la tabla Clientes ala database para la prueba.
Insert Into client 
(names, last_names, documentType, documentNumber,phone, email, Password, birthdate)
Values
('Victor Manuel', 'Cuaresma Salhuana', 'DNI', '71667340','972396546', 'victor.cuaresma@gmail.com', 'SALHUANA1130','2005-03-11');

Insert Into client 
(names, last_names, documentType, documentNumber,phone, email, Password, birthdate)
Values
('Maria Fernanda', 'Lazaro Velarde', 'DNI', '78238232','920302032', 'maria.lazaro@gmail.com', 'MariaLaz20','2005-01-21');

Insert Into client 
(names, last_names, documentType, documentNumber,phone, email, Password, birthdate)
Values
('Maria Julia', 'Lazaro Sanchez', 'DNI', '41239403','912032032', 'julia.lazaro@gmail.com', 'Julia2120','1992-11-19');

Insert Into client 
(names, last_names, documentType, documentNumber,phone, email, Password, birthdate)
Values
('Ana Julia', 'Fernandez Sanchez', 'CNE', '192032403243543','911345432', 'anajulia@gmail.com', 'AnaJULIA2024','2001-01-01');

Insert Into client 
(names, last_names, documentType, documentNumber,phone, email, Password, birthdate)
Values
('Alex Daniel', 'Arias Florez', 'CNE', '292032403243543','931345432', 'alexarias@gmail.com', 'Alexarias24fl','2004-12-12');

Insert Into client 
(names, last_names, documentType, documentNumber,phone, email, Password, birthdate)
Values
('Alexis Daniel', 'Arias Franco', 'CNE', '232032403243541','911233411', 'alexisfranco@gmail.com', 'AlexisFr232','2003-10-22');

Insert Into client 
(names, last_names, documentType, documentNumber,phone, email, Password, birthdate)
Values
('Ales Raniel', 'Prias Kranco', 'DNI', '45678909','990233411', 'ales@hotmail.com', 'Ales99Raniel','1990-04-27');

select * from client;

-- Inserta datos en la tabla "employees"
INSERT INTO employees (employee_id, name, surnames, cargo, salary)
VALUES (1, 'John', 'Doe', 'Repartidor', 1000.00),
       (2, 'Jane', 'Smith', 'Cajero', 2500.00),
       (3, 'Michael', 'Diaz', 'Seguridad', 2000.00),
	   (4, 'Michael', 'Johnson', 'Administrador', 4000.00),
       (5, 'Emily', 'Williams', 'Contador', 3000.00);

select * from employees;


-- Inserta datos en la tabla "products"
INSERT INTO products (product_code, product_name, product_type, by_product, supplier_id)
VALUES (1, 'Pan blanco', 'Pan', 'No', 1),
       (2, 'Galletas de chocolate', 'Galletas', 'No', 2),
       (3, 'Pan integral', 'Pan', 'No', 1),
       (4, 'Croissant', 'Pan', 'No', 3),
       (5, 'Pan de ajo', 'Pan', 'No', 1);

select * from products;


-- Inserta datos en la tabla "sale_detail"
INSERT INTO sale_detail (id, Importe, amount, sales_sales_id)
VALUES (1, 50.00, '3', 1),
       (2, 25.00, '2', 1),
       (3, 10.00, '1', 2),
       (4, 15.00, '2', 2),
       (5, 40.00, '4', 3);

select * from sale_detail;

-- Inserta datos en la tabla "sales"
INSERT INTO sales (sales_id, sale_date, receipt_type, sales_code, tipe_ofpay, stocks_id)
VALUES (1, '2023-11-22', 'Factura', 'ABC123', 'Tarjeta', 1),
       (2, '2023-11-23', 'Ticket', 'DEF456', 'Efectivo', 2),
       (3, '2023-11-24', 'Factura', 'GHI789', 'Tarjeta', 3),
       (4, '2023-11-25', 'Ticket', 'JKL012', 'Efectivo', 4),
       (5, '2023-11-26', 'Factura', 'MNO345', 'Tarjeta', 5);

select * from sales;

-- Inserta datos en la tabla "stocks"
INSERT INTO stocks (id, expiration_date, start_date, stock_quantity, product_id, person_id, purchase_price, products_product_code, customers_id)
VALUES (1, '2024-01-01', '2023-11-01', 100, 1, 1, 10, 1, 1),
       (2, '2024-02-01', '2023-12-01', 50, 2, 2, 15, 2, 2),
       (3, '2024-03-01', '2024-01-01', 200, 3, 3, 20, 3, 3),
       (4, '2024-04-01', '2024-02-01', 75, 4, 4, 12, 4, 4),
       (5, '2024-05-01', '2024-03-01', 150, 5, 5, 18, 5, 5);

select * from stocks;

-- Inserta datos en la tabla "supplier"
INSERT INTO supplier (id, ruc, company_name, mail, phone)
VALUES (1, '12345678901', 'Proveedor 1 S.A.', 'proveedor1@example.com', '123456789'),
       (2, '23456789012', 'Proveedor 2 S.A.', 'proveedor2@example.com', '234567890'),
       (3, '34567890123', 'Proveedor 3 S.A.', 'proveedor3@example.com', '345678901'),
       (4, '45678901234', 'Proveedor 4 S.A.', 'proveedor4@example.com', '456789012'),
       (5, '56789012345', 'Proveedor 5 S.A.', 'proveedor5@example.com', '567890123');

select * from supplier;


-- Reference: products_supplier (table: products)
ALTER TABLE products ADD CONSTRAINT products_supplier
    FOREIGN KEY (supplier_id)
    REFERENCES supplier (id);

-- Reference: sale_detail_sales (table: sale_detail)
ALTER TABLE sale_detail ADD CONSTRAINT sale_detail_sales
    FOREIGN KEY (sales_sales_id)
    REFERENCES sales (sales_id);

-- Reference: sales_stocks (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_stocks
    FOREIGN KEY (stocks_id)
    REFERENCES stocks (id);

-- Reference: stocks_products (table: stocks)
ALTER TABLE stocks ADD CONSTRAINT stocks_products
    FOREIGN KEY (products_product_code)
    REFERENCES products (product_code);

-- Consulta para ver las relaciones entre las tablas en tu base de datos
SELECT
    -- Nombre de la restricción de clave externa
    FK.name AS 'Foreign Key',
    -- Nombre de la tabla que contiene la columna que es clave externa
    TP.name AS 'Table',
    -- Nombre de la columna que es clave externa
    CP.name AS 'Column',
    -- Nombre de la tabla a la que se hace referencia
    RFK.name AS 'Referenced Table',
    -- Nombre de la columna a la que se hace referencia
    RCP.name AS 'Referenced Column'
FROM 
    -- Tabla de restricciones de clave externa
    sys.foreign_keys FK
INNER JOIN 
    -- Tabla de tablas
    sys.tables TP ON FK.parent_object_id = TP.object_id
INNER JOIN 
    -- Tabla de tablas referenciadas
    sys.tables RFK ON FK.referenced_object_id = RFK.object_id
INNER JOIN 
    -- Tabla de columnas de restricciones de clave externa
    sys.foreign_key_columns FKC ON FKC.constraint_object_id = FK.object_id
INNER JOIN 
    -- Tabla de columnas de tablas
    sys.columns CP ON FKC.parent_column_id = CP.column_id AND FKC.parent_object_id = CP.object_id
INNER JOIN 
    -- Tabla de columnas de tablas referenciadas
    sys.columns RCP ON FKC.referenced_column_id = RCP.column_id AND FKC.referenced_object_id = RCP.object_id;


-- Agregar 3 consultas utilizando JOIN’s, agrupamiento y funciones:

--001
-- Esta consulta cuenta la cantidad total de productos en stock para cada tipo de producto
SELECT 
    p.product_type, -- Selecciona el tipo de producto de la tabla "products"
    COUNT(*) AS total_products -- Cuenta el número de productos en stock para cada tipo de producto
FROM 
    products p -- Une la tabla "products" con la tabla "stocks" utilizando el código de producto
JOIN 
    stocks s ON p.product_code = s.products_product_code
GROUP BY 
    p.product_type; -- Agrupa los resultados por tipo de producto

--002
-- Esta consulta cuenta la cantidad total de productos en stock para cada tipo de producto
SELECT 
    p.product_type, -- Selecciona el tipo de producto de la tabla "products"
    COUNT(*) AS total_products -- Cuenta el número de productos en stock para cada tipo de producto
FROM 
    products p -- Une la tabla "products" con la tabla "stocks" utilizando el código de producto
JOIN 
    stocks s ON p.product_code = s.products_product_code
GROUP BY 
    p.product_type; -- Agrupa los resultados por tipo de producto

--003
-- Esta consulta muestra el total de ventas realizadas por cada empleado en cada mes y año
SELECT 
    e.name AS employee_name, -- Selecciona el nombre del empleado de la tabla "employees"
    e.surnames AS employee_surnames, -- Selecciona los apellidos del empleado de la tabla "employees"
    MONTH(s.sale_date) AS sale_month, -- Obtiene el mes de la fecha de venta de la tabla "sales"
    YEAR(s.sale_date) AS sale_year, -- Obtiene el año de la fecha de venta de la tabla "sales"
    SUM(sd.Importe) AS total_sales_amount -- Suma el importe de las ventas de la tabla "sale_detail"
FROM 
    employees e -- Une la tabla "employees" con la tabla "sales" utilizando el ID del empleado
JOIN 
    sales s ON e.employee_id = s.stocks_id
JOIN 
    sale_detail sd ON s.sales_id = sd.sales_sales_id
GROUP BY 
    e.employee_id, e.name, e.surnames, MONTH(s.sale_date), YEAR(s.sale_date); -- Agrupa los resultados por ID del empleado, nombre y apellidos del empleado, mes y año de venta



--004
SELECT 
    cargo,
    AVG(salary) AS average_salary
FROM 
    employees
GROUP BY 
    cargo;

--005
SELECT 
    sale_date,
    COUNT(*) AS total_products_sold
FROM 
    sales s
JOIN 
    sale_detail sd ON s.sales_id = sd.sales_sales_id
GROUP BY 
    sale_date;

