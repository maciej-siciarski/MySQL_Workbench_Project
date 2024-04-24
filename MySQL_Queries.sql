 -- Tables Overview
 Select * FROM orders;
 SELECT * FROM employees;
 SELECT * FROM orders_status;
 SELECT * FROM suppliers;
 SELECT * FROM products;
 SELECT * FROM purchase_orders;
 
 -- The management requests a report showing whether all employees have placed orders. The report should include the order date, the employee's last name, and their job position. How many employees did not place orders?
 CREATE VIEW EmployeesOrders AS
 SELECT last_name, job_title, order_date
  FROM orders
  RIGHT JOIN employees
  ON orders.employee_id = employees.id;

CREATE VIEW LackOfOrders AS
  SELECT COUNT(*) as "Number of employees who did not place orders"
  FROM orders
  RIGHT JOIN employees
  ON orders.employee_id = employees.id
  WHERE order_date IS NULL;
  
   -- Verification of order status
  CREATE VIEW OrderVerification AS
  SELECT status_name AS 'Order Status', COUNT(*) AS 'Number of Orders'
  FROM orders
  JOIN orders_status
  ON orders.status_id = orders_status.id
  GROUP BY status_name;
  
  -- Verification of companies regarding produced products and relationships between orders for individual items.
  CREATE VIEW CompanyProductOrders AS
  SELECT company AS 'Company', product_name AS 'Product Name', COUNT(supplier_id) AS 'Total Orders'
  FROM suppliers
  RIGHT JOIN products
  ON suppliers.id = products.supplier_ids
  RIGHT JOIN purchase_orders
  ON purchase_orders.supplier_id = suppliers.id
  GROUP BY company, product_name;
  
  -- Simple AVG with 2 decimal points
SELECT CAST(AVG(CAST(shipping_fee AS decimal(10,2))) AS DECIMAL(10,2)) AS 'Average shipping fee'
FROM orders
WHERE shipping_fee > 0;

-- Remove spaces on the right side
SELECT id, CONCAT(RTRIM(last_name), ' ', RTRIM(first_name)) AS FullName 
FROM employees;