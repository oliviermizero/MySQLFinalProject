# MySQL Final Project

A Java-based CRUD and T-SQL application for managing DIY projects using MySQL database and JDBC.

## Features

- **Create** new projects with details (name, estimated/actual hours, difficulty, notes)
- **Read** and list all projects
- **Update** existing project details
- **Delete** projects (with CASCADE deletion of related data)
- **Select** and view project details including materials, steps, and categories

## Technology Stack

- **Java 11**
- **Maven** for dependency management
- **MySQL** database
- **JDBC** for database connectivity
- **Console-based** user interface

## Database Schema

The application uses a normalized database with the following tables:
- `project` - Main project information
- `material` - Project materials with costs
- `step` - Project steps in order
- `category` - Project categories
- `project_category` - Many-to-many relationship between projects and categories

## Setup Instructions

### Prerequisites
- Java 11 or higher
- Maven
- MySQL Server
- MySQL Workbench (optional)

### Database Setup
1. Run the `projects-schema.sql` script in MySQL Workbench or MySQL client
2. This will create:
   - `projects` database
   - `projects` user with password `Projects123!`
   - All required tables with sample data

### Running the Application
```bash
cd ProjectsApp/mysql-java
mvn compile exec:java -Dexec.mainClass="projects.ProjectsApp"
```

## Entity Relationship Diagram

The database follows a normalized design with:
- **One-to-Many**: Project → Materials, Project → Steps
- **Many-to-Many**: Project ↔ Categories (via junction table)
- **CASCADE DELETE**: Removing a project automatically removes related materials and steps

## Project Requirements Met

- **CRUD Operations**: Complete Create, Read, Update, Delete functionality  
- **UPDATE Statement**: Modify project details  
- **DELETE Statement**: Remove projects with CASCADE  
- **PreparedStatement.executeUpdate()**: Proper return value usage  
- **Transaction Management**: Commit/rollback operations  
- **Menu-driven Interface**: User-friendly console application  

## Author

Created by Olivier Niyonshuti Mizero as part of MySQL/Java programming coursework.
