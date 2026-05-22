-- =====================================================
-- Q14: Most Used Payment Method
-- =====================================================
SELECT 
    payment_type,
    COUNT(*) AS usage_count,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS percentage
FROM fact_order_payments
GROUP BY payment_type
ORDER BY usage_count DESC;

-- =====================================================
-- Q15: Average Installments by Payment Method
-- =====================================================
SELECT 
    payment_type,
    AVG(CAST(payment_installments AS FLOAT)) AS avg_installments,
    COUNT(*) AS transaction_count
FROM fact_order_payments
GROUP BY payment_type
ORDER BY avg_installments DESC;

-- =====================================================
-- Q16: Payment Method with Highest Revenue
-- =====================================================
SELECT 
    fop.payment_type,
    SUM(fop.payment_value) AS total_revenue
FROM fact_order_payments fop
INNER JOIN fact_orders fo ON fop.order_id = fo.order_id
WHERE fo.order_status = 'delivered'
GROUP BY fop.payment_type
ORDER BY total_revenue DESC;
