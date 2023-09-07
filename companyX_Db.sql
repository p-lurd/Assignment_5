-- to create database
CREATE DATABASE inventoryDb;

-- to use the specific database 
USE inventoryDb;

-- to create each entity(table) 
CREATE TABLE users (
id int NOT NULL,
name varchar(255) NOT NULL,
email varchar(255) NOT NULL UNIQUE,
password varchar(255) NOT NULL,
phone_number varchar(255) NOT NULL,
gender ENUM ('MALE', 'FEMALE'),
created_at datetime DEFAULT CURRENT_TIMESTAMP,
role ENUM ('regular', 'admin') DEFAULT 'regular',
PRIMARY KEY (id)
);


CREATE TABLE categories(
id int AUTO_INCREMENT NOT NULL,
name varchar(255),
created_at datetime DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
);


CREATE TABLE items(
id int AUTO_INCREMENT NOT NULL,
name varchar(255),
price decimal(10, 2),
size ENUM('small', 'medium', 'large'),
quantity int,
category_id int,
user_id int,
FOREIGN KEY (category_id) REFERENCES categories(id),
FOREIGN KEY (user_id) REFERENCES users(id),
PRIMARY KEY (id)
);

CREATE TABLE orders(
id int AUTO_INCREMENT NOT NULL,
status ENUM('pending','approved', 'disapproved') DEFAULT 'pending',
quantity int,
orderDate datetime DEFAULT CURRENT_TIMESTAMP,
user_id int,
FOREIGN KEY (user_id) REFERENCES users(id),
PRIMARY KEY (id)
);

CREATE TABLE items_orders(
id int AUTO_INCREMENT NOT NULL,
order_id int,
item_id int,
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (item_id) REFERENCES items(id),
PRIMARY KEY(id)
);


--  to insert records into entities 
INSERT INTO users (id, name, email, password, phone_number, gender, role)
 VALUES (1, 'Tolu', 'tolu@altschool.com', '12345abcd', '01234567', 'MALE', 'admin');
 
 INSERT INTO users (id, name, email, password, phone_number, gender, role)
 VALUES (2, 'Dan', 'dan@altschool.com', '54321abcd', '07654343', 'MALE', 'regular');

 INSERT INTO categories (name) VALUES ('Milks');

INSERT INTO items (name, price, size) VALUES ('Dano', 3000, 'small');

INSERT INTO orders (quantity, user_id) VALUES (3, 1);

INSERT INTO items_orders (order_id, item_id) VALUES (1, 1);

-- to get record from entities 
SELECT * FROM users;

SELECT * FROM categories;

SELECT * FROM items;

SELECT * FROM orders;

SELECT * FROM items_orders;

-- To update records of entities 
UPDATE users
SET name = 'Danny'
WHERE id = 2;

UPDATE categories
SET name = 'Milk_types'
WHERE id = 2;

UPDATE items
SET price = 3500
WHERE id = 1;

-- To delete records from entities 
DELETE FROM items_orders WHERE id = 1;
DELETE FROM items_orders WHERE id = 2;

DELETE FROM orders WHERE id = 1;

DELETE FROM items WHERE id = 1;