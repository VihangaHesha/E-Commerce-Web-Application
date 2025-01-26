# JavaEE E-Commerce Web Application

## Project Overview
A halfly-featured e-commerce web application developed using JavaEE, JDBC connection pooling, and JSP, providing comprehensive functionality for both administrators and customers.

## Features

### Administrator Features
- Product Management
  - Add, view, update, and delete products
- Category Management
  - Manage product categories
- Order Management
  - View all customer orders
- User Management
  - Manage customer accounts

### Customer Features
- User Authentication
  - Registration, login, and logout
- Product Browsing
  - View products by category
  - Search and sort products
- Shopping Cart
  - Add, update, and remove products
- Order Placement
  - Place and view order history
- Profile Management
  - Update personal information

## Technologies Used
- Backend: JavaEE, Servlets
- Database: MySQL
- Connection Pooling: Apache DBCP/HikariCP
- Frontend: JSP, CSS (Optional: Bootstrap)

## Prerequisites
- Java Development Kit (JDK)
- Apache Tomcat
- MySQL Database
- Maven/Gradle (for dependency management)

## Database Setup
1. Create MySQL database named `ecommerce`
2. Create tables:
   - products
   - categories
   - users
   - orders
   - order_details
   - cart

## Installation
1. Clone the repository
```bash
https://github.com/VihangaHesha/E-Commerce-Web-Application.git
```

2. Configure database connection in `database.properties`

3. Deploy to Tomcat server

## Running the Application
1. Start Tomcat server
2. Access application at `http://localhost:8080/ecommerce`

## Bonus Features
- Advanced product search
- User role management
- AJAX-powered interactions
