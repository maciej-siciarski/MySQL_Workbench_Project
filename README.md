# MySQL_Workbench_Project

### **Relational database containing various queries, views and relation keys 🗂🔑**<br>

- Overview
- [Sample Queries](#sample-queries)

## Relation Diagram
![EER Diagram 1](https://github.com/maciej-siciarski/MySQL_Workbench_Project/assets/147531793/213cff0a-2f16-4e2f-b2d4-ac1adde64299)

## Sample Queries 🔢 <a name="sample-queries"></a>

### Joining 2 tables with RIGHT JOIN + COUNT(*) ✨

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

### Inner join, Count(*) and Group By ✨

Example: Verification of order status

      SELECT status_name AS 'Order Status', COUNT(*) AS 'Number of Orders'
      FROM orders
      JOIN orders_status
      ON orders.status_id = orders_status.id
      GROUP BY status_name;

![image](https://github.com/maciej-siciarski/MySQL_Workbench_Project/assets/147531793/0e316f7a-8847-4bc3-906d-5320a44e5eb8)

###  Outer JOIN multiple tables ✨

Example: Verification of companies regarding produced products and relationships between orders for individual items.

      SELECT company AS 'Company', product_name AS 'Product Name', COUNT(supplier_id) AS 'Total Orders'
      FROM suppliers
      RIGHT JOIN products
      ON suppliers.id = products.supplier_ids
      RIGHT JOIN purchase_orders
      ON purchase_orders.supplier_id = suppliers.id
      GROUP BY company, product_name

![image](https://github.com/maciej-siciarski/MySQL_Workbench_Project/assets/147531793/51b5d960-bfb8-450a-9d22-ef9e5fc8b5e0)

      

### Simple AVG with 2 decimal points ✨

      SELECT CAST(AVG(CAST(shipping_fee AS decimal(10,2))) AS DECIMAL(10,2)) AS 'Average shipping fee'
      FROM orders
      WHERE shipping_fee > 0;

### Remove spaces on the right side ✨

      SELECT id, CONCAT(RTRIM(last_name), ' ', RTRIM(first_name)) AS FullName 
      FROM employees;
