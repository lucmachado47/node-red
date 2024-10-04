-- Create the schema (database)
CREATE SCHEMA IF NOT EXISTS dbnode_red;

-- Use the schema that was just created
USE dbnode_red;

-- Create the brokers table
CREATE TABLE IF NOT EXISTS brokers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(30),
    cnpj VARCHAR(14),
    status VARCHAR(40)
);
