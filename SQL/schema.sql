-- Schema to build SQL database storing Instacart orders

-- Aisle table
DROP TABLE IF EXISTS aisles;
CREATE TABLE aisles (
	aisle_id INT NOT NULL PRIMARY KEY,
	aisle VARCHAR NOT NULL
);

COPY aisles
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/Project_3/Resources/aisles.csv'
DELIMITER ',' CSV HEADER;


-- Departments table
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
	department_id INT NOT NULL PRIMARY KEY,
	department VARCHAR NOT NULL
);
COPY departments
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/Project_3/Resources/departments.csv'
DELIMITER ',' CSV HEADER;


-- Orders table
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	order_id INT NOT NULL PRIMARY KEY,
	user_id INT NOT NULL,
	eval_set VARCHAR(5) NOT NULL,
	order_number INT NOT NULL,
	order_dow INT NOT NULL,
	order_hour_of_day INT NOT NULL,
	days_since_prior_order FLOAT
);
COPY orders
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/Project_3/Resources/orders.csv'
DELIMITER ',' CSV HEADER;


-- Products table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	product_id INT NOT NULL PRIMARY KEY,
	product_name VARCHAR NOT NULL,
	aisle_id INT NOT NULL,
	department_id INT NOT NULL,
	FOREIGN KEY (aisle_id) REFERENCES aisles(aisle_id),
	FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
COPY products
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/Project_3/Resources/products.csv'
DELIMITER ',' CSV HEADER;


-- Order Products table, append both order_products__prior and order_products__train.csv
DROP TABLE IF EXISTS order_products;
CREATE TABLE order_products (
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	add_to_cart_order INT NOT NULL,
	reordered INT NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);
COPY order_products
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/Project_3/Resources/order_products__prior.csv'
DELIMITER ',' CSV HEADER;

COPY order_products
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/Project_3/Resources/order_products__train.csv'
DELIMITER ',' CSV HEADER;


-- Quick Query
SELECT * FROM aisles;
SELECT * FROM departments;
SELECT COUNT(*) FROM orders;
SELECT * FROM orders LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT COUNT(*) FROM order_products;