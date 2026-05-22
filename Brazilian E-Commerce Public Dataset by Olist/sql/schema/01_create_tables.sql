-- =====================================================
-- Olist Data Warehouse Schema - Galaxy Schema
-- =====================================================

-- Dimension Tables
-- =====================================================

-- dim_customers
CREATE TABLE dim_customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_city VARCHAR(100),
    customer_state VARCHAR(2),
    customer_zip_code_prefix INT
);

-- dim_products
CREATE TABLE dim_products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT
);

-- dim_sellers
CREATE TABLE dim_sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_city VARCHAR(100),
    seller_state VARCHAR(2),
    seller_zip_code_prefix INT
);

-- dim_date (you can populate this with a script)
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    day INT,
    day_name VARCHAR(20),
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT
);

-- Fact Tables
-- =====================================================

-- fact_orders
CREATE TABLE fact_orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_date_key INT,
    order_approved_at_date_key INT,
    order_delivered_carrier_date_key INT,
    order_delivered_customer_date_key INT,
    order_estimated_delivery_date_key INT,
    delivery_diff_days INT,
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id)
);

-- fact_order_items
CREATE TABLE fact_order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    price FLOAT,
    freight_value FLOAT,
    shipping_limit_date_key INT,
    PRIMARY KEY (order_id, order_item_id),
    FOREIGN KEY (order_id) REFERENCES fact_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (seller_id) REFERENCES dim_sellers(seller_id)
);

-- fact_order_payments
CREATE TABLE fact_order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(20),
    payment_installments INT,
    payment_value FLOAT,
    PRIMARY KEY (order_id, payment_sequential),
    FOREIGN KEY (order_id) REFERENCES fact_orders(order_id)
);

-- fact_order_reviews
CREATE TABLE fact_order_reviews (
    review_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    review_score INT,
    review_creation_date_key INT,
    review_answer_date_key INT,
    FOREIGN KEY (order_id) REFERENCES fact_orders(order_id)
);
