-- Creating tables for online store
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INTEGER NOT NULL
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    order_date DATE NOT NULL
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
    order_id INTEGER FOREIGN KEY (order_id) REFERENCES orders(id),
    product_id INTEGER  FOREIGN KEY (product_id) REFERENCES products(id),
    quantity INTEGER NOT NULL,
    PRIMARY KEY (order_id, product_id)
);

--Inserting data into tables (5 products, 4 customers, and 5 orders - each order has 2 items)
INSERT INTO products (product_name, price, stock_quantity)
VALUES
('Snaggle Tooth', 6000, 32),
('Cannibalism', 0000, 100),
('Tree Bark', 12 000, 55),
('Cat Butthole', 350, 15),
('Rodents', 20, 267);

INSERT INTO customers (first_name, last_name, email)
VALUES
('Toaster', 'Strudel', 't.strudel@myfood.com'),
('No', 'Also No', 'i_said_no@no.com'),
('Micro', 'Wave', 'microwave@heatingfood.com'),
('Dusty', 'A$$', 'dusty.af@bruh.com');

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '1403-06-17'),
(1, '1898-08-23'),
(2, '1995-09-21'),
(3, '2010-12-28'),
(4, '2024-02-09');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(5, 1, 3),
(5, 4, 2),
(2, 3, 2),
(4, 4, 2),
(5, 3, 2),
(5, 1, 2),
(1, 2, 2),
(3, 4, 2),
(2, 2, 2);

-- SQL Query - Retrieve the names and stock quantities of all products
SELECT products.product_name, products.stock_quantity FROM products;

-- SQL Query - Retrieve the product names and quantities for one of the orders placed
SELECT products.product_name, order_items.quantity FROM order_items
JOIN products ON order_items.product_id = products.id
WHERE order_items.order_id = 1;

-- SQL Query Retrieve all orders placed by a specific customer (including the ID’s of what was ordered and the quantities)
SELECT orders.customer_id, order_items.order_id, order_items.product_id, order_items.quantity
FROM order_items
JOIN orders ON order_items.order_id = orders.id
JOIN products ON order_items.product_id = products.id
JOIN customers ON orders.customer_id = customers.id
WHERE orders.customer_id = 3;

-- Updating data for reducing stock quantities
UPDATE products 
SET stock_quantity = stock_quantity - 6
FROM order_items
WHERE products.product_name = 'Cannibalism'; -- Theres less cannibalism in stock


-- Delete Data: Remove one of the orders and all associated order items from the system.
DELETE FROM order_items
WHERE order_id = 5;

DELETE FROM orders
WHERE id = 5;