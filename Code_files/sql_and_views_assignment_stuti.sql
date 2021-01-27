-- Q1: List the names of the items available in the menu?
SELECT item_id, item_name
FROM item;

-- Q2: Select orders with item quantity more than 1?
SELECT order_id, item_ordered, quantity
FROM receipt_info
WHERE quantity > 1;

-- Q3: How many customers did each Kristina and Mike serve?
SELECT cashier_name, COUNT(order_id) AS Customer_served
FROM receipt_info
GROUP BY cashier_name;

-- Q4: What is the percentage of orders that are dine-in?
SELECT SUM(CASE WHEN order_type = 'Dine In' THEN 1 ELSE 0 END)/COUNT(*)*100 AS pct_order_dine_in
FROM orders;
  
-- Q5: How many payments are by cash and how many by card?
 SELECT payment_type, COUNT(order_id)
 FROM orders
 GROUP BY payment_type;
  
-- Q6: Get only the orders with order total more than $10
 SELECT order_id, customer_name,  item_ordered, total
 FROM receipt_info
 WHERE total > 10;
  
-- Q7: Which item sells the most? Arrange by highest to lowest.
 SELECT item_ordered, SUM(quantity) AS Total_quantity
 FROM receipt_info
 GROUP BY item_ordered
 ORDER BY 2 DESC;
 
-- Q8: Give the number of stores by each city?  
SELECT city, COUNT(store_id) AS num_of_stores
FROM store
GROUP BY city;
  
-- 09: What is the total quantity of Burritto ordered?
SELECT item_ordered, SUM(quantity)
FROM receipt_info
GROUP BY item_ordered
HAVING item_ordered = 'Burritto';

-- Q10: Select the total number of customers served?
SELECT COUNT(*) AS total_cust_served
FROM customer;
  
-- Q11: Select all the details of customers whose name starts with 'M'
SELECT *
FROM customer
WHERE first_name LIKE 'M%';
  
-- Q12: Create a view for getting number of orders by each day  
CREATE VIEW orders_by_day AS
SELECT to_char(date_time, 'MM.DD.YY') order_date, COUNT(*) AS daily_orders
FROM orders
GROUP BY to_char(date_time, 'MM.DD.YY')
ORDER BY to_char(date_time, 'MM.DD.YY') ASC;

-- Displaying output for the above created view
SELECT * FROM orders_by_day;

-- Q13: Create a view for all the customers in fremont
CREATE VIEW orders_in_fremont AS
SELECT customer_name, item_ordered, quantity
FROM receipt_info
WHERE store_address LIKE '%Mowry%';

-- Displaying output for the above created view  
SELECT * FROM orders_in_fremont;
  
-- Q14: Create a view for all the items price more than $5
CREATE VIEW price AS
SELECT item_name, price
FROM item
WHERE price > 5;

-- Displaying output for the above created views
SELECT * FROM price;