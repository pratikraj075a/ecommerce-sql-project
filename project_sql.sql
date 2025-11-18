-- CREATE DATABASE ecommerce_db;
-- USE ecommerce_db;

-- CREATE TABLE customers (
--     customer_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100),
--     email VARCHAR(100) UNIQUE,
--     phone VARCHAR(15),
--     city VARCHAR(50),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE products (
--     product_id INT AUTO_INCREMENT PRIMARY KEY,
--     product_name VARCHAR(100),
--     category VARCHAR(50),
--     price DECIMAL(10,2),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE inventory (
--     inventory_id INT AUTO_INCREMENT PRIMARY KEY,
--     product_id INT,
--     stock INT,
--     FOREIGN KEY (product_id) REFERENCES products(product_id)
-- );

-- CREATE TABLE orders (
--     order_id INT AUTO_INCREMENT PRIMARY KEY,
--     customer_id INT,
--     order_date DATE,
--     status VARCHAR(20),
--     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
-- );

-- CREATE TABLE order_items (
--     order_item_id INT AUTO_INCREMENT PRIMARY KEY,
--     order_id INT,
--     product_id INT,
--     quantity INT,
--     price DECIMAL(10,2),
--     FOREIGN KEY (order_id) REFERENCES orders(order_id),
--     FOREIGN KEY (product_id) REFERENCES products(product_id)
-- );

-- CREATE TABLE payments (
--     payment_id INT AUTO_INCREMENT PRIMARY KEY,
--     order_id INT,
--     amount DECIMAL(10,2),
--     payment_date DATE,
--     method VARCHAR(20),
--     FOREIGN KEY (order_id) REFERENCES orders(order_id)
-- );

-- INSERT INTO customers (name, email, phone, city) VALUES
-- ('Rahul Verma', 'rahul@gmail.com', '9876543210', 'Delhi'),
-- ('Suman Roy', 'suman@gmail.com', '9988776655', 'Kolkata'),
-- ('Neha Singh', 'neha@yahoo.com', '7766554433', 'Mumbai');

-- INSERT INTO products (product_name, category, price) VALUES
-- ('Laptop', 'Electronics', 55000),
-- ('Mobile', 'Electronics', 15000),
-- ('Shoes', 'Fashion', 2500),
-- ('Watch', 'Accessories', 3000);

-- INSERT INTO inventory (product_id, stock) VALUES
-- (1, 10), (2, 25), (3, 40), (4, 15);

-- INSERT INTO orders (customer_id, order_date, status) VALUES
-- (1, '2024-01-12', 'Delivered'),
-- (2, '2024-01-15', 'Delivered'),
-- (1, '2024-01-20', 'Pending');

-- INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
-- (1, 1, 1, 55000),
-- (1, 4, 1, 3000),
-- (2, 2, 1, 15000),
-- (3, 3, 2, 2500);

-- INSERT INTO payments (order_id, amount, payment_date, method) VALUES
-- (1, 58000, '2024-01-12', 'UPI'),
-- (2, 15000, '2024-01-15', 'Card');














