-- =====================================================
-- Indexes for Performance Optimization
-- =====================================================

-- Indexes on fact_orders
CREATE INDEX idx_fact_orders_customer ON fact_orders(customer_id);
CREATE INDEX idx_fact_orders_purchase_date ON fact_orders(order_purchase_date_key);
CREATE INDEX idx_fact_orders_status ON fact_orders(order_status);

-- Indexes on fact_order_items
CREATE INDEX idx_fact_items_order ON fact_order_items(order_id);
CREATE INDEX idx_fact_items_product ON fact_order_items(product_id);
CREATE INDEX idx_fact_items_seller ON fact_order_items(seller_id);

-- Indexes on fact_order_payments
CREATE INDEX idx_fact_payments_order ON fact_order_payments(order_id);
CREATE INDEX idx_fact_payments_type ON fact_order_payments(payment_type);

-- Indexes on fact_order_reviews
CREATE INDEX idx_fact_reviews_order ON fact_order_reviews(order_id);
CREATE INDEX idx_fact_reviews_score ON fact_order_reviews(review_score);
