-- =====================================================
-- Q1: Total Revenue
-- =====================================================
SELECT 
    SUM(foi.price + foi.freight_value) AS total_revenue
FROM fact_order_items foi
INNER JOIN fact_orders fo ON foi.order_id = fo.order_id
WHERE fo.order_status = 'delivered';

-- =====================================================
-- Q2: Top 10 Categories by Revenue
-- =====================================================
SELECT TOP 10
    dp.product_category_name_english AS category,
    SUM(foi.price + foi.freight_value) AS total_revenue
FROM fact_order_items foi
INNER JOIN dim_products dp ON foi.product_id = dp.product_id
INNER JOIN fact_orders fo ON foi.order_id = fo.order_id
WHERE fo.order_status = 'delivered'
GROUP BY dp.product_category_name_english
ORDER BY total_revenue DESC;

-- =====================================================
-- Q3: Top 10 Products by Number of Sales
-- =====================================================
SELECT TOP 10
    dp.product_id,
    dp.product_category_name_english AS category,
    COUNT(*) AS number_of_sales
FROM fact_order_items foi
INNER JOIN dim_products dp ON foi.product_id = dp.product_id
GROUP BY dp.product_id, dp.product_category_name_english
ORDER BY number_of_sales DESC;

-- =====================================================
-- Q4: Bottom 5 Product Categories by Revenue
-- =====================================================
SELECT TOP 5
    dp.product_category_name_english AS category,
    SUM(foi.price + foi.freight_value) AS total_revenue
FROM fact_order_items foi
INNER JOIN dim_products dp ON foi.product_id = dp.product_id
INNER JOIN fact_orders fo ON foi.order_id = fo.order_id
WHERE fo.order_status = 'delivered'
GROUP BY dp.product_category_name_english
ORDER BY total_revenue ASC;

-- =====================================================
-- Q5: Average Order Value (AOV)
-- =====================================================
SELECT 
    SUM(foi.price + foi.freight_value) / COUNT(DISTINCT foi.order_id) AS aov
FROM fact_order_items foi
INNER JOIN fact_orders fo ON foi.order_id = fo.order_id
WHERE fo.order_status = 'delivered';
