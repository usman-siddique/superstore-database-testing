-- Data Retrieval & Aggregation: 

-- 1. Create a new derived attribute on orders to calculate and show the order processing time in days along with all other attributes. 
SELECT *, DATEDIFF(ship_date, order_date) AS order_processing_time FROM orders; 


-- 2. Find the average sales price of products per product sub-category. 
SELECT sub_category, AVG(sales) AS avg_sales_price FROM products GROUP BY sub_category; 


-- 3. Find the minimum and maximum sales prices of any product per product sub-category. 
SELECT sub_category, MIN(sales) AS min_sales, MAX(sales) AS max_sales FROM products 
GROUP BY sub_category; 


-- 4. Find the count of all tuples / records in each table of your database. 
SELECT 'customer_addresses' AS table_name, COUNT(*) AS record_count FROM customer_addresses; 
SELECT 'customers' AS table_name, COUNT(*) AS record_count FROM customers; 
SELECT 'orders' AS table_name, COUNT(*) AS record_count FROM orders; 
SELECT 'product_categories' AS table_name, COUNT(*) AS record_count FROM product_categories; 
SELECT 'products' AS table_name, COUNT(*) AS record_count FROM products; 


-- 5. Show a list of product categories that have more than 5 sub-categories in them. 
SELECT category, COUNT(sub_category) AS sub_category_count from product_categories 
group by category having sub_category_count > 5; 


-- 6. Show the total number of orders shipped under each type of shipping mode. 
SELECT ship_mode, COUNT(*) AS order_count FROM orders GROUP BY ship_mode; 


-- 7. Show the total number of orders shipped under each type of shipping mode since 2017. 
SELECT ship_mode, COUNT(*) AS order_count FROM orders WHERE ship_date >= '2017-01-01' GROUP BY ship_mode; 


-- 8. Find the distribution of customers in each segment (total number of customers per segment). 
SELECT segment, COUNT(*) AS customers_count FROM customers GROUP BY segment; 


-- 9. Find the distribution of customers in each segment for “New York City”, i.e., postal codes ‘10009’, ‘10011’, ‘10024’ and ‘10035’. 
SELECT segment, COUNT(*) AS customers_count FROM customers WHERE postal_code 
IN (10009, 10011, 10024, 10035) GROUP BY segment;



-- 10. Find the total number of products per sub-category that have a sales price greater than $100. 
SELECT sub_category, COUNT(*) AS product_count FROM products WHERE sales > 100 
GROUP BY sub_category order by product_count DESC; 


-- 11. Orders deliveries are considered late if they take more than 7 days to be shipped after being placed. Find the total number of late deliveries per year. 
SELECT YEAR(order_date) AS order_year, COUNT(*) AS late_delivery_count FROM orders 
WHERE DATEDIFF(ship_date, order_date) > 7 GROUP BY YEAR(order_date); 


-- 12. Show the product IDs of the top 10 most purchased products. 
SELECT product_id, sales FROM products ORDER BY sales DESC LIMIT 10; 


-- 13. Show the names of the top 5 most expensive products. 
SELECT product_name FROM products ORDER BY sales DESC limit 5; 


-- 14. Show a list of the top 3 most frequent buyers. 
SELECT customer_id, count(order_id) AS frequent_buyers FROM orders GROUP BY customer_id ORDER BY frequent_buyers DESC LIMIT 3; 


-- 15. Show the order ID of the largest order given, i.e., maximum product count per order. 
SELECT order_id, COUNT(product_id) AS product_count FROM order_products 
GROUP BY order_id ORDER BY product_count DESC LIMIT 1;
