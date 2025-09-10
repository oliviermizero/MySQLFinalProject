-- Setup script for MySQL Projects database
CREATE DATABASE IF NOT EXISTS projects;
USE projects;

-- Create projects user with stronger password
CREATE USER IF NOT EXISTS 'projects'@'localhost' IDENTIFIED BY 'Projects123!';
GRANT ALL PRIVILEGES ON projects.* TO 'projects'@'localhost';
FLUSH PRIVILEGES;

-- Create tables (from projects-schema.sql)
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
  project_id INT AUTO_INCREMENT NOT NULL,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL(7, 2),
  actual_hours DECIMAL(7, 2),
  difficulty INT,
  notes TEXT,
  PRIMARY KEY (project_id)
);

CREATE TABLE category (
  category_id INT AUTO_INCREMENT NOT NULL,
  category_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE step (
  step_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  step_text TEXT NOT NULL,
  step_order INT NOT NULL,
  PRIMARY KEY (step_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
  material_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  material_name VARCHAR(128) NOT NULL,
  num_required INT,
  cost DECIMAL(7, 2),
  PRIMARY KEY (material_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE project_category (
  project_id INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
  UNIQUE KEY (project_id, category_id)
);

-- Insert some test data
INSERT INTO category (category_name) VALUES ('Woodworking'), ('Electronics'), ('Gardening');

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) 
VALUES 
('Build a Birdhouse', 5.0, 4.5, 2, 'Simple beginner woodworking project'),
('LED Light Strip Installation', 2.0, 3.0, 3, 'Electronics project for room lighting');

INSERT INTO material (project_id, material_name, num_required, cost)
VALUES 
(1, 'Wood planks', 4, 25.00),
(1, 'Screws', 20, 5.50),
(2, 'LED Strip', 1, 35.99),
(2, 'Power Supply', 1, 15.00);

INSERT INTO step (project_id, step_text, step_order)
VALUES 
(1, 'Cut wood to size', 1),
(1, 'Drill holes for screws', 2),
(1, 'Assemble the birdhouse', 3),
(2, 'Plan the LED strip route', 1),
(2, 'Install the LED strip', 2),
(2, 'Connect power supply', 3);

INSERT INTO project_category (project_id, category_id)
VALUES (1, 1), (2, 2);

SELECT 'Database setup completed successfully!' as message;

