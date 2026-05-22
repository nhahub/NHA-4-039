-- =====================================================
-- Q17: Average Actual Delivery Time (Days)
-- =====================================================
SELECT 
    AVG(CAST(delivery_diff_days AS FLOAT)) AS avg_delivery_days,
    MIN(delivery_diff_days) AS min_delivery_days,
    MAX(delivery_diff_days) AS max_delivery_days
FROM fact_orders
WHERE order_status = 'delivered'
  AND delivery_diff_days IS NOT NULL;

-- =====================================================
-- Q18: Delayed Orders Analysis
-- =====================================================
SELECT 
    COUNT(CASE WHEN delivery_diff_days < 0 THEN 1 END) AS delayed_orders,
    COUNT(CASE WHEN delivery_diff_days >= 0 THEN 1 END) AS on_time_orders,
    COUNT(*) AS total_orders,
    (COUNT(CASE WHEN delivery_diff_days < 0 THEN 1 END) * 100.0 / COUNT(*)) AS delayed_percentage,
    SUM(CASE WHEN delivery_diff_days < 0 THEN foi.price + foi.freight_value ELSE 0 END) AS delayed_revenue
FROM fact_orders fo
INNER JOIN fact_order_items foi ON fo.order_id = foi.order_id
WHERE fo.order_status = 'delivered'
  AND fo.delivery_diff_days IS NOT NULL;
