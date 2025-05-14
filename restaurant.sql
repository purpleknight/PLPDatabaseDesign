-- Create the database
CREATE DATABASE RestaurantDB;
USE RestaurantDB;

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

-- Create Employees table
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL
);

-- Create Menu_Items table
CREATE TABLE Menu_Items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Create Order_Items table (Many-to-Many between Orders and Menu_Items)
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id) ON DELETE CASCADE
);

-- Create Reservations table
CREATE TABLE Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    num_guests INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Create Payments table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(50) NOT NULL DEFAULT 'Pending',
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
);

-- Create Suppliers table
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info TEXT NOT NULL
);

-- Create Inventory table
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    supplier_id INT NOT NULL,
    quantity INT NOT NULL,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE CASCADE
);

-- Indexes for performance optimization
CREATE INDEX idx_customer_email ON Customers(email);
CREATE INDEX idx_order_date ON Orders(order_date);
CREATE INDEX idx_item_category ON Menu_Items(category);

-- Sample Data
INSERT INTO Customers (name, email, phone, address) VALUES 
('John Ochieng', 'john@example.com', '123-456-7890', '123 Street, Nairobi'),
('Jane Kerubo', 'jane@example.com', '098-765-4321', '456 Avenue, Kisumu'),
('Wilson Sang', 'sang@example.com', '222-314-5678', '294 Street, Nakuru');

INSERT INTO Employees (name, role, salary, hire_date) VALUES 
('Alice Wahome', 'Manager', 50000.00, '2024-01-15'),
('Bob Njagi', 'Chef', 35000.00, '2023-05-10'),
('Winnie Fatuma', 'Reception', 15000.00, '2024-06-03');

INSERT INTO Menu_Items (name, description, price, category) VALUES 
('Margherita Pizza', 'Classic cheese and tomato pizza', 8.99, 'Main Course'),
('Caesar Salad', 'Romaine lettuce with Caesar dressing', 6.99, 'Appetizer'),
('Southwestern Napoleons', 'Crab meat, bean and corn salsa', 12.99, 'Main Course');

INSERT INTO Suppliers (name, contact_info) VALUES 
('Fresh Farms', 'freshfarms@example.com'),
('Gourmet Ingredients', 'gourmet@example.com'),
('Fresh Fish', 'fishing@example.com');

