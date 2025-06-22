USE superstore; 

-- 1. Insert the first records of each table using the data provided in the attached dataset.
INSERT INTO customer_addresses(postal_code, city, state, region, country) VALUES 
(42420,"Henderson", "Kentucky", "South", "United States"); 

INSERT INTO customers(customer_id, customer_name, segment, postal_code) VALUES 
('CG-12520', 'Claire Gute', 'Consumer', 42420); 

INSERT INTO orders(order_id, customer_id, order_date, ship_mode, ship_date) VALUES 
('CA-2017-152156', 'CG-12520', '2017-08-11', 'Second Class', '2017-11-11'); 

INSERT INTO product_categories(sub_category, category) VALUES ('Bookcases', 'Furniture'); 

INSERT INTO product(product_id, product_name, sub_category, sales) VALUES 
('FUR-BO-10001798', 'Bush Somerset Collection Bookcase', 'Bookcases', 261.96); 


-- 3. Show all columns from all tables (each table displayed one by one). 
SHOW COLUMNS FROM customer_addresses; 
SHOW COLUMNS FROM customers; 
SHOW COLUMNS FROM product_categories; 
SHOW COLUMNS FROM products; 
SHOW COLUMNS FROM orders; 
SHOW COLUMNS FROM order_products; 


-- 4. Show the name of the customer whose customer ID is ‘HP-14815’. 
SELECT customer_name FROM customers WHERE customer_ID = 'HP-14815'; 


-- 5. Show all items placed under order ID ‘CA-2017-145625’. 
SELECT * FROM orders WHERE order_id IN ('CA-2017-152156'); 


-- 6. Show the name, category and sub-category of the product with product ID ‘TEC-AC-10002167’. 
SELECT products.product_name, products.sub_category, product_categories.category FROM 
products INNER JOIN product_categories ON products.sub_category = 
product_categories.sub_category WHERE products.product_id = 'TEC-AC-10002167'; 


-- 7. Show all customers belonging to the ‘consumer’ segment. 
SELECT * FROM customers WHERE segment = 'consumer'; 


-- 8. Show a list of all sales amounting to more than $100. 
SELECT * FROM products WHERE sales > 100; 


-- 9. Show all customers with missing postal addresses. 
SELECT * FROM customers WHERE postal_code IS NULL; 


-- 10. Show all orders placed in 2017 and afterwards. 
SELECT * FROM orders WHERE order_date >= '2017-01-01'; 


-- 11. Show all orders placed between 2015 and 2016 only. 
SELECT * FROM orders WHERE order_date >= '2015-01-01' AND order_date <= '2016-12-31'; 


-- 12. Show all orders where the order was not shipped within 7 days of being placed. 
SELECT * FROM orders WHERE datediff(ship_date, order_date) > 7; 


-- 13. Show a list of all products with ‘Xerox’ in their name. 
SELECT * FROM products WHERE product_name LIKE '%Xerox%'; 


-- 14. Show a list of all office supplies. 
SELECT products.product_id, products.product_name, products.sub_category, 
product_categories.category, products.sales FROM products INNER JOIN product_categories 
ON products.sub_category = product_categories.sub_category  
WHERE product_categories.category = 'Office Supplies'; 


-- 15. Update the address of the customer with ID ‘KC-16540’ to country=‘Pakistan’, city=‘Lahore’, state=‘Punjab’, postal_code=‘54000’, region=‘East’. 
UPDATE customer_addresses SET country = 'Pakistan', city = 'Lahore', state = 'Punjab', 
postal_code = 54000, region = 'East' WHERE postal_code IN (SELECT postal_code FROM 
customers WHERE customer_id = 'KC-16540');