DROP DATABASE IF EXISTS superstore;
CREATE DATABASE IF NOT EXISTS superstore;

USE superstore;

CREATE TABLE customer_addresses (
    postal_code INT (5),
    city VARCHAR (30),
    state VARCHAR (30),
    region VARCHAR (10),
    country VARCHAR (30),
    
    PRIMARY KEY (postal_code)
);


CREATE TABLE customers (
	
    customer_id CHAR (8),
    customer_name VARCHAR (40),
    segment VARCHAR (25),
    postal_code INT (5),
    
    PRIMARY KEY (customer_id),
    FOREIGN KEY (postal_code) REFERENCES customer_addresses(postal_code)
		ON UPDATE CASCADE
        ON DELETE SET NULL

);

CREATE TABLE product_categories (

    sub_category VARCHAR (100),
    category VARCHAR (50),
    
    PRIMARY KEY (sub_category)

);


CREATE TABLE products (

	product_id CHAR (15),
    product_name VARCHAR (255),
    sub_category VARCHAR (100),
    sales FLOAT,

	PRIMARY KEY (product_id),
    FOREIGN KEY (sub_category) REFERENCES product_categories(sub_category)
);



CREATE TABLE orders (

	order_id CHAR (14),
    order_date DATE,
    ship_mode VARCHAR (25),
    ship_date DATE,
    customer_id CHAR (8),
    
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

);


CREATE TABLE order_products (

	order_id CHAR (14),    
 	product_id CHAR (15),
    
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id),
    PRIMARY KEY (order_id, product_id)

);