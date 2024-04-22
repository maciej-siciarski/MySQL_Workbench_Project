# MySQL_Workbench_Project

### **Relational database containing various queries, views and relation keys 🗂🔑**<br>

- Overview
- Queries

## Relation Diagram
![EER Diagram 1](https://github.com/maciej-siciarski/MySQL_Workbench_Project/assets/147531793/213cff0a-2f16-4e2f-b2d4-ac1adde64299)

## Sample Queries ✨

JOINING 2 TABLES WITH **RIGHT JOIN + COUNT (*)**

Example: <br>
The management requests a report showing whether all employees have placed orders. The report should include the order date, the employee's last name, and their job position.
How many employees did not place orders?

      SELECT last_name, job_title, order_date
      FROM orders
      RIGHT JOIN employees
      ON orders.employee_id = employees.id;

      SELECT COUNT(*) as "Number of employees who did not place orders"
      FROM orders
      RIGHT JOIN employees
      ON orders.employee_id = employees.id
      WHERE order_date IS NULL;
      

https://github.com/maciej-siciarski/MySQL_Workbench_Project/assets/147531793/da436193-0be9-4d95-91e2-27b5a98bbf91
