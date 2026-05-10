USE RetailBanking

SELECT TOP (1000) [customer_id]
      ,[credit_score]
      ,[country]
      ,[gender]
      ,[age]
      ,[tenure]
      ,[balance]
      ,[products_number]
      ,[credit_card]
      ,[active_member]
      ,[estimated_salary]
      ,[churn]
FROM [RetailBanking].[dbo].[BankCustomerChurn]


  
  -- Check Dataset
  SELECT *
  FROM BankCustomerChurn


  -- Check Total Records
  SELECT COUNT(*) AS Total_Records
  FROM BankCustomerChurn


  -- Check NULL Values
  SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
    SUM(CASE WHEN credit_score IS NULL THEN 1 ELSE 0 END) AS credit_score_nulls,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS country_nulls,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_nulls,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS tenure_nulls,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END) AS balance_nulls,
    SUM(CASE WHEN products_number IS NULL THEN 1 ELSE 0 END) AS products_number_nulls,
    SUM(CASE WHEN credit_card IS NULL THEN 1 ELSE 0 END) AS credit_card_nulls,
    SUM(CASE WHEN active_member IS NULL THEN 1 ELSE 0 END) AS active_member_nulls,
    SUM(CASE WHEN estimated_salary IS NULL THEN 1 ELSE 0 END) AS estimated_salary_nulls,
    SUM(CASE WHEN churn IS NULL THEN 1 ELSE 0 END) AS churn_nulls
  FROM BankCustomerChurn


  -- Check Duplicate Records
  SELECT customer_id, COUNT(*) AS duplicate_count
  FROM BankCustomerChurn
  GROUP BY customer_id
  HAVING COUNT(*) > 1


  -- Basic Data Analysis in SQL
  -- Churn Count
  SELECT churn, COUNT(*) AS total_customers
  FROM BankCustomerChurn
  GROUP BY churn


  -- Country-wise Customers
  SELECT country, COUNT(*) AS total_customers
  FROM BankCustomerChurn
  GROUP BY country
  ORDER BY total_customers DESC


  -- Average Balance by Churn
  SELECT churn,
       AVG(balance) AS avg_balance
  FROM BankCustomerChurn
  GROUP BY churn


  -- Gender wise Churn
  SELECT gender,
       churn,
       COUNT(*) AS total_customers
  FROM BankCustomerChurn
  GROUP BY gender, churn
  ORDER BY gender


  -- Active Members vs Churn
  SELECT active_member,
       churn,
       COUNT(*) AS total_customers
  FROM BankCustomerChurn
  GROUP BY active_member, churn