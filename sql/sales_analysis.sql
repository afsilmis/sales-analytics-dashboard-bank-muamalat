SELECT 
  -- Customer Information
  c.CustomerEmail as cust_email,
  c.CustomerCity as cust_city,
  
  -- Order Information
  o.Date as order_date,
  o.Quantity as order_qty,
  
  -- Product Information
  p.ProdName as product_name,
  p.Price as product_price,
  
  -- Category Information
  pc.CategoryName as category_name,
  
  -- Calculated Field: Total Sales
  (o.Quantity * p.Price) as total_sales

FROM orders o

INNER JOIN customers c
  ON o.CustomerID = c.CustomerID

INNER JOIN products p
  ON o.ProdNumber = p.ProdNumber

INNER JOIN productcategory pc
  ON p.Category = pc.CategoryID

ORDER BY o.Date ASC;