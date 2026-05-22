-- =====================================================
-- Q6: Top 5 States by Revenue
-- =====================================================
SELECT TOP 5
    dc.customer_state,
    SUM(foi.price + foi.freight_value) AS total_revenue
FROM fact_order_items foi
INNER JOIN fact_orders fo ON foi.order_id = fo.order_id
INNER JOIN dim_customers dc ON fo.customer_id = dc.customer_id
WHERE fo.order_status = 'delivered'
GROUP BY dc.customer_state
ORDER BY total_revenue DESC;

-- =====================================================
-- Q7: Top 5 Cities by Number of Orders
-- =====================================================
SELECT TOP 5
    dc.customer_city,
    dc.customer_state,
    COUNT(DISTINCT fo.order_id) AS total_orders
FROM fact_orders fo
INNER JOIN dim_customers dc ON fo.customer_id = dc.customer_id
WHERE fo.order_status = 'delivered'
GROUP BY dc.customer_city, dc.customer_state
ORDER BY total_orders DESC;

-- =====================================================
-- Q8: Top 5 States with Highest Cancellation Rate
-- =====================================================
SELECT TOP 5
    dc.customer_state,
    COUNT(CASE WHEN fo.order_status = 'canceled' THEN 1 END) AS canceled_orders,
    COUNT(*) AS total_orders,
    (COUNT(CASE WHEN fo.order_status = 'canceled' THEN 1 END) * 100.0 / COUNT(*)) AS cancel_rate
FROM fact_orders fo
INNER JOIN dim_customers dc ON fo.customer_id = dc.customer_id
GROUP BY dc.customer_state
HAVING COUNT(*) > 100
ORDER BY cancel_rate DESC;

-- =====================================================
-- Q9: Average Delivery Days by State
-- =====================================================
SELECT 
    dc.customer_state,
    AVG(CAST(fo.delivery_diff_days AS FLOAT)) AS avg_delivery_days
FROM fact_orders fo
INNER JOIN dim_customers dc ON fo.customer_id = dc.customer_id
WHERE fo.order_status = 'delivered'
  AND fo.delivery_diff_days IS NOT NULL
GROUP BY dc.customer_state
ORDER BY avg_delivery_days;
