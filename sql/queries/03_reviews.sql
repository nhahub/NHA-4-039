-- =====================================================
-- Q10: Review Score Distribution
-- =====================================================
SELECT 
    review_score,
    COUNT(*) AS count,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS percentage
FROM fact_order_reviews
GROUP BY review_score
ORDER BY review_score;

-- =====================================================
-- Q11: Category with Most 5-Star Reviews
-- =====================================================
SELECT TOP 5
    dp.product_category_name_english AS category,
    COUNT(*) AS five_star_count
FROM fact_order_reviews forv
INNER JOIN fact_orders fo ON forv.order_id = fo.order_id
INNER JOIN fact_order_items foi ON fo.order_id = foi.order_id
INNER JOIN dim_products dp ON foi.product_id = dp.product_id
WHERE forv.review_score = 5
GROUP BY dp.product_category_name_english
ORDER BY five_star_count DESC;

-- =====================================================
-- Q12: Relationship between Delivery Time and Review Score
-- =====================================================
SELECT 
    forv.review_score,
    AVG(CAST(fo.delivery_diff_days AS FLOAT)) AS avg_delivery_days,
    COUNT(*) AS order_count
FROM fact_order_reviews forv
INNER JOIN fact_orders fo ON forv.order_id = fo.order_id
WHERE fo.order_status = 'delivered'
  AND fo.delivery_diff_days IS NOT NULL
  AND forv.review_score IS NOT NULL
GROUP BY forv.review_score
ORDER BY forv.review_score;

-- =====================================================
-- Q13: Category with Most Low Ratings (1 or 2)
-- =====================================================
SELECT TOP 5
    dp.product_category_name_english AS category,
    COUNT(*) AS low_rating_count
FROM fact_order_reviews forv
INNER JOIN fact_orders fo ON forv.order_id = fo.order_id
INNER JOIN fact_order_items foi ON fo.order_id = foi.order_id
INNER JOIN dim_products dp ON foi.product_id = dp.product_id
WHERE forv.review_score IN (1, 2)
GROUP BY dp.product_category_name_english
ORDER BY low_rating_count DESC;
