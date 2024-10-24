CREATE DATABASE SALARIO;

USE SALARIO;

CREATE TABLE employees (
	id INT PRIMARY KEY,
	first_name VARCHAR (120),
	last_name VARCHAR (120),
	department VARCHAR (120), 
	salary DECIMAL (10,2)
);

INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (1, 'Paul', 'Garrix', 'Corporate', 3547.25);
INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (2, 'Astrid', 'Fox', 'Private Individuals', 2845.56);
INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (3, 'Matthias', 'Johnson', 'Private Individuals', 3009.41);
INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (4, 'Lucy', 'Patterson', 'Private Individuals', 3547.25);
INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (5, 'Tom', 'Page', 'Corporate', 5974.41);
INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (6, 'Claudia', 'Conte', 'Corporate', 4714.12);
INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (7, 'Walter', 'Deer', 'Private Individuals', 3547.25);
INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (8, 'Stephanie', 'Marx', 'Corporate', 2894.51);
INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (9, 'Luca', 'Pavarotti', 'Private Individuals', 4123.45);
INSERT INTO employees (id, first_name, last_name, department, salary) VALUES (10, 'Victoria', 'Pollock', 'Corporate', 4789.53);

CREATE TABLE quarterly_sales (
	employee_id INT REFERENCES employees(id),
	q1_2022 DECIMAL (10,2),
	q2_2022 DECIMAL (10,2),
	q3_2022 DECIMAL (10,2),
	q4_2022 DECIMAL (10,2)
	
);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (8, 3471.41, 14789.25, 3478.34, 1254.23);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (4, 5417.81, 12846.23, 8741.54, 3589.99);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (10, 1547.52, 1269.66, 1478.65, 2474.33);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (1, 8715.55, 8465.65, 24747.82, 3514.36);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (3, 12774.51, 24784.31, 12223.34, 8451.51);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (2, 4989.23, 5103.22, 4897.98, 5322.05);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (7, 18415.66, 15279.37, 14634.44, 14445.12);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (6, 2498.63, 8741.45, 3997.65, 2497.21);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (5, 6349.74, 7555.55, 6944.35, 7788.01);
INSERT INTO quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (9, 4485.36, 4101.50, 8787.45, 7648.90);