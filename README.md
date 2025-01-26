# JavaEE E-Commerce Web Application

## Project Overview
A halfly-featured e-commerce web application developed using JavaEE, JDBC connection pooling, and JSP, providing comprehensive functionality for both administrators and customers.Please change branch into main.The project isn't done 100% as required but have done back end logic handling and front-end work.

## Features

### Administrator Features
- Product Management
  - Add, view products
- Order Management
  - View all customer orders
- User Management
  - Manage customer accounts

### Customer Features
- User Authentication
  - Registration, login, and logout
- Product Browsing
  - View products
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
- Maven (for dependency management)

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
