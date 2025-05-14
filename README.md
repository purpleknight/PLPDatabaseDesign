# PLPDatabaseDesign
# Restaurant Database (MySQL)
## Overview
This repository contains the SQL script to set up a fully-featured relational database for a restaurant business using MySQL. The database is structured to efficiently handle customer orders, menu items, payments, reservations, employees, suppliers, and inventory management.

## Database Schema
The database consists of the following core tables:

Customers – Stores customer details.

Employees – Manages restaurant staff.

Menu_Items – Lists available dishes and beverages.

Orders – Handles customer purchase records.

Order_Items – Links orders with menu items (many-to-many relationship).

Reservations – Manages table bookings.

Payments – Tracks transactions and payment methods.

Suppliers – Maintains supplier records for ingredient sourcing.

Inventory – Oversees stock availability and restocking.

## Usage
Clone the repository:

```bash
git clone <https://github.com/purpleknight/PLPDatabaseDesign.git>
```
Import the SQL file into MySQL:
```bash
mysql -u username -p < RestaurantDB.sql
```
Run queries to interact with the database.

## ERD Diagram
![RestaurantDB ERD Diagram](https://github.com/user-attachments/assets/fbe7e8e5-cb82-4eca-93fb-8a8da4deaf0a)


