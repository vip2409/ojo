-- SQL Queries for Online Food Delivery System

-- 1. Get all orders of a user
SELECT o.order_id, o.order_date, o.total_amount
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE u.username = 'example_username';

-- 2. Get menu items of a restaurant
SELECT m.item_name, m.price, m.description
FROM menu_items m
JOIN restaurants r ON m.restaurant_id = r.restaurant_id
WHERE r.restaurant_name = 'example_restaurant';

-- 3. Calculate total order amounts for a user
SELECT SUM(o.total_amount) AS total_spent
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE u.username = 'example_username';

-- 4. Get the most popular menu items based on order counts
SELECT m.item_name, COUNT(o.order_id) AS order_count
FROM order_items oi
JOIN menu_items m ON oi.menu_item_id = m.menu_item_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY m.item_name
ORDER BY order_count DESC;

-- 5. Get total orders and average order amount by restaurant
SELECT r.restaurant_name, COUNT(o.order_id) AS total_orders, AVG(o.total_amount) AS average_order_amount
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name;

-- 6. Get users with the highest total spent
SELECT u.username, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY u.username
ORDER BY total_spent DESC
LIMIT 10;

-- 7. Get orders with complex conditions
SELECT o.order_id, o.order_date, u.username, r.restaurant_name, o.total_amount
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE o.order_date >= '2026-01-01'
AND o.total_amount > 100
ORDER BY o.order_date DESC;