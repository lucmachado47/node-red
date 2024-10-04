# Node-RED Project

This project consists of multiple flows created using Node-RED to interact with the BrazilAPI. Each flow serves a specific purpose and is detailed below.

## Project Flows

### 1. List of Brokers
Provides a web page that lists all the available brokers from the BrazilAPI (https://brasilapi.com.br/docs#tag/Corretoras) in the following format: "${Name} - ${City} - ${CNPJ}".
- **Nodes**: 
  - `http in` 
  - `http request` 
  - `function` 
  - `template` 
  - `response`
- **Access**: **`/brokers`**

### 2. ZIP Code Details by Route
Provides a web page capable to show details of a provided zip code inserted as a route parameter using BrazilAIP (https://brasilapi.com.br/docs#tag/CEP-V2).
- **Nodes**: 
  - `http in` 
  - `function` 
  - `http request` 
  - `template` 
  - `http response`
- **Access**: **`/zipcode/:zipcode`**

### 3. ZIP Code Details by Input
Provides a web page capable to show details of a provided zip code inserted in an input field using BrazilAIP (https://brasilapi.com.br/docs#tag/CEP-V2).
- **Nodes**: 
  - `input` 
  - `http request` 
  - `template` 
  - `ui template`
- **Access**: **`/ui`**

### 4. Database Insert of Brokers
Inserts all brokers into a database with columns id, name, city, cnpj and status.
- **Nodes**: 
  - `inject` 
  - `http request` 
  - `function` 
  - `mysql`
- **Access**: This flow is executed automatically when the inject node is triggered.

### 5. SQL Command Form
Provides a web form that receives an SQL command as input and return the results on another web page.
- **Nodes**:
- Web form
  - `http in (post)` 
  - `function` 
  - `mysql` 
  - `template` 
  - `http response`
- Query Results
  - `http in (get)` 
  - `template form` 
  - `http response`
- **Access**: 
  - Form: **`/sql_form`**
  - Results: **`/sql_query`** (it goes automatically).

## Running the Project

### Must contain
- Node.js
- Node-RED
- MySQL Database

### Installation
1. Clone this repository to your local machine.
2. Navigate to the `.node-red` folder.
3. Install dependencies by running the command `npm install` in your terminal.
4. Import the flows.json file into your Node-RED instance.
5. Set up the MySQL database using the provided `setup.sql` script. You can run the SQL commands in your MySQL client:
   -- Create the schema (database)
   CREATE SCHEMA IF NOT EXISTS dbnode_red;

   -- Use the created schema
   USE dbnode_red;

   -- Create the brokers table
   CREATE TABLE IF NOT EXISTS brokers (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255),
       city VARCHAR(30),
       cnpj VARCHAR(14),
       status VARCHAR(40)
   );
6. Set up the MySQL node in your Node-RED flow with your database user credentials.
7. Start Node-RED by running `node-red` in your terminal.
8. Access Node-RED in your browser at http://localhost:1880 or the IP provided in your terminal.

## Conclusion
This project demonstrates the integration of Node-RED with external APIs and a MySQL database. 

## Issues
If you encounter any issues, ensure that your Node-RED and MySQL server are running properly.
