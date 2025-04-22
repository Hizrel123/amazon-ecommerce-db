-- List all Users
SELECT *
FROM users;

-- Find all products with stock less 20
SELECT 
	product_id,
	name AS product_name
FROM products
WHERE stock < 20;

-- 3.	Get all orders with status 'delivered'
SELECT *
FROM orders
WHERE status = 'delivered';

-- 4.	List all categories alphabetically
SELECT *
FROM categories
ORDER BY name;

-- 5.	Count total number of users
SELECT COUNT(*) AS total_num_users
FROM users;

-- 6.	Total number of products in each category
SELECT 
	c.name AS categoryname,
	COUNT(product_id) AS total_num_products
FROM products p
LEFT JOIN categories c
	USING(category_id)
GROUP BY categoryname
;

-- 7.	Total orders each user has made
SELECT 
	COUNT(o.order_id) AS total_orders,
	u.full_name
FROM orders o
LEFT JOIN users u
	USING(user_id)
GROUP BY u.full_name;

-- 8.	Total revenue per order
	SELECT 
		order_id,
		SUM(price * quantity) AS total_revenue_per_order
	FROM order_items
	GROUP BY order_id;

-- 9.	Top 5 most expensive products.
SELECT 
	product_id,
	name AS product,
	price
FROM products
ORDER BY price DESC
LIMIT 5;

-- 10.	Most used payment method
SELECT 
	payment_method,
	COUNT(*) AS usage_count
FROM payments
GROUP BY payment_method
ORDER BY usage_count DESC;

-- 11.	How many products are in stock (sum)
SELECT
	name AS product,
	SUM(stock) OVER ()
FROM products;

-- 12.	Average product price per category
SELECT 
	category_id,
	ROUND(AVG(price), 2) AS avg_product_price_per_category
FROM products
GROUP BY category_id;

-- 13.	Find users who have made more than 1 order
SELECT 
	u.full_name,
	COUNT(o.order_id) AS total_orders
FROM users u
LEFT JOIN orders o
	USING(user_id)
GROUP BY u.full_name
HAVING COUNT(o.order_id) > 1;

-- 14.	Count orders by status (pending, shipped, etc.)
SELECT
	status,
	COUNT(order_id) AS total_orders_by_status
FROM orders
GROUP BY status;

-- 15.	Get the latest 10 orders placed
SELECT *
FROM orders
ORDER BY order_id DESC
LIMIT 10;

-- 16. Revenue per category
SELECT 
	p.product_id,
	oi.price,
	oi.quantity,
	p.category_id,
	SUM(oi.price * oi.quantity) OVER (PARTITION BY p.category_id) AS revenue_per_category
FROM order_items oi
LEFT JOIN products p
	USING(product_id);

-- 17.	Which users have spent the most (by payment amount)
SELECT 
	u.full_name,
	SUM(p.amount) AS total_spent
FROM users u
LEFT JOIN orders o
	ON u.user_id = o.user_id
LEFT JOIN payments p
	ON o.order_id = p.order_id
GROUP BY u.full_name
ORDER BY total_spent DESC 
LIMIT 5;

-- 18.	Which product appears in the most orders
SELECT 
	p.name AS product,
	COUNT(DISTINCT oi.order_id) AS most_orders
FROM order_items oi
LEFT JOIN products p
	USING(product_id)
GROUP BY product
ORDER BY most_orders DESC
LIMIT 1;

-- 19.	Average order value
SELECT 
	ROUND(AVG(p.amount), 2) AS avg_order_value
FROM orders o
LEFT JOIN payments p
	USING(order_id)

-- 20.	Orders with multiple items
SELECT 
	order_id,
	COUNT(*) AS multiple_items
FROM order_items
GROUP BY order_id
ORDER BY multiple_items DESC;

-- 21.	Users who haven't placed any orders
SELECT 
	u.full_name,
	o.order_id
FROM users u
LEFT JOIN orders o
	USING(user_id)
WHERE o.order_id IS NULL;

-- 
-- 21.	Users who haven't placed any orders
SELECT 
	u.full_name,
	o.order_id
FROM users u
LEFT JOIN orders o
	USING(user_id)
WHERE o.order_id IS NULL;

-- 
-- 21.	Users who haven't placed any orders
SELECT 
	u.full_name,
	o.order_id
FROM users u
LEFT JOIN orders o
	USING(user_id)
WHERE o.order_id IS NULL;

-- 22.	Top shipping statuses (most common)
SELECT 
    status, 
    COUNT(*) AS status_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM orders
GROUP BY status;

-- 23.	Total sales made today / this week / this month
WITH sales_data AS (
    SELECT 
        oi.price * oi.quantity AS sale_amount,
        o.order_date
    FROM orders o
    JOIN order_items oi USING(order_id)
)
SELECT 
    EXTRACT(year FROM order_date) AS sales_year,
    EXTRACT(month FROM order_date) AS sales_month,
    EXTRACT(week FROM order_date) AS sales_week,
    EXTRACT(day FROM order_date) AS sales_day,
    SUM(sale_amount) AS total_sales
FROM sales_data
GROUP BY 
    sales_year, sales_month, sales_week, sales_day
ORDER BY sales_year DESC, sales_month DESC, sales_week DESC, sales_day DESC;

-- 24.	Compare revenue between two months
SELECT 
    TO_CHAR(o.order_date, 'FMMonth') AS month_name,  -- Convert date to full month name
    SUM(oi.price * oi.quantity) AS total_revenue
FROM order_items oi
LEFT JOIN orders o
    USING(order_id)
WHERE EXTRACT(MONTH FROM o.order_date) IN (1, 2)  -- Compare for January (1) and February (2)
GROUP BY month_name, EXTRACT(MONTH FROM o.order_date)  -- Group by month name and extracted month
ORDER BY EXTRACT(MONTH FROM o.order_date);

-- 25.	How many orders each category contributes to
WITH cte AS (
    SELECT 
        p.category_id,
        COUNT(DISTINCT oi.order_id) AS contributes
    FROM order_items oi
    LEFT JOIN products p
        USING(product_id)
    GROUP BY p.category_id
)
SELECT *
FROM cte;

-26.	Create a view for total user spending
-- DROP VIEW total_user_spending;
CREATE VIEW total_user_spending AS
SELECT 
	u.full_name,
	SUM(p.amount) OVER (PARTITION BY u.full_name) total_spent
FROM orders o
LEFT JOIN payments p
	USING(order_id)
LEFT JOIN users u
	ON o.user_id = u.user_id
ORDER BY total_spent DESC;
-- SELECT * FROM total_user_spending;

-- 27.	Create a view for order summary (user, amount, status)
CREATE VIEW order_summary AS 
SELECT 
	u.full_name,
	p.amount,
	o.status
FROM orders o
LEFT JOIN payments p
	USING(order_id)
LEFT JOIN users u
	ON o.user_id = u.user_id;

-- 28.	Create a view showing best-selling products
CREATE VIEW best_selling_products AS
SELECT 
	p.product_id,
	p.name AS product,
	COALESCE(SUM(oi.price * oi.quantity), 0) AS total_revenue
FROM products p
LEFT JOIN order_items oi
	USING(product_id)
GROUP BY p.product_id, p.name
ORDER BY total_revenue DESC;


-- 29.	Create a view for shipping progress (order ID, status)
CREATE VIEW shipping_progress AS
SELECT 
	order_id,
	status,
	order_date
FROM orders;

-- 30.	Create a view combining products with their categories and stock level
CREATE VIEW product_details AS 
SELECT 
	product_id,
	name AS product,
	category_id,
	stock
FROM products;
