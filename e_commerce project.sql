# 1.Database Create
CREATE DATABASE E_commerce;
USE E_commerce;

# 2. Tables Create
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50)
    );
    
# 3. CREATE Products Table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# 4. CREATE TABLE inventory
CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    stock INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

# 5. CREATE TABLE orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

# 6. CREATE TABLE order_items
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

# 7. CREATE TABLE payments
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    method VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
# 8. Data Insert
INSERT INTO customers (name, email, phone, city) VALUES
('Rahul Verma', 'rahul@gmail.com', '9876543210', 'Delhi'),
('Suman Roy', 'suman@gmail.com', '9988776655', 'Kolkata'),
('Neha Singh', 'neha@yahoo.com', '7766554433', 'Mumbai');

INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 55000),
('Mobile', 'Electronics', 15000),
('Shoes', 'Fashion', 2500),
('Watch', 'Accessories', 3000);

INSERT INTO inventory (product_id, stock) VALUES
(1, 10), (2, 25), (3, 40), (4, 15);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2024-01-12', 'Delivered'),
(2, '2024-01-15', 'Delivered'),
(1, '2024-01-20', 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 55000),
(1, 4, 1, 3000),
(2, 2, 1, 15000),
(3, 3, 2, 2500);

INSERT INTO payments (order_id, amount, payment_date, method) VALUES
(1, 58000, '2024-01-12', 'UPI'),
(2, 15000, '2024-01-15', 'Card');

# 9. Check Data 
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM inventory;
SELECT * FROM order_items;

# 10. JOIN Query
SELECT customers.name, 
orders.order_id, orders.status
FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id;

# 11. Highest Price Product
SELECT * FROM products
ORDER BY price DESC
LIMIT 1;

# 12. Total Sales
SELECT SUM(quantity * price) AS total_sales
FROM order_items;

# 13. Product Stock
SELECT products.product_name, inventory.stock 
FROM products
JOIN inventory 
ON products.product_id = inventory.product_id;

# 14. Total_Customers
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

# 15. Low Stock Alert
SELECT p.product_name, i.stock
FROM products p
JOIN inventory i
ON p.product_id = i.product_id
WHERE i.stock < 20;

# 16. Pending Orders Query
SELECT * FROM orders
WHERE status = 'Pending';

# 17. check null values 
SELECT * FROM customers
WHERE city IS NULL;

SELECT * FROM products
WHERE price IS NULL;

## Analytics Queries
# 18. Monthly Sales
SELECT 
MONTH(payment_date) AS month,
SUM(amount) AS monthly_sales
FROM payments
GROUP BY MONTH(payment_date);

# 19. Total Revenue Per Product
SELECT 
p.product_name,
SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name;

# 20. Customer Spending Analysis
SELECT c.name,
SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.name
ORDER BY total_spent DESC;

# 21. Total Orders Per Customer
SELECT 
c.name,
COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;

# 22. Create View
CREATE VIEW customer_orders AS
SELECT
c.name,
o.order_id,
o.status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM customer_orders;


