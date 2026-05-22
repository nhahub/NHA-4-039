# Functional Requirements

## 1. Purpose
This document defines the functional requirements for the Olist e-commerce analytics project. Functional requirements describe **what** the system must do.

## 2. Requirements Format

Each requirement follows this structure:
- **FR-XXX**: [Requirement description]
- **Priority**: High / Medium / Low
- **Stakeholder**: [Who requested it]
- **User Story**: [Related user story ID]

---

## 3. Data Cleaning Requirements

| ID | Requirement | Priority | Stakeholder |
|----|-------------|----------|-------------|
| FR-001 | System must load 9 raw CSV files (orders, customers, products, sellers, order_items, payments, reviews, geolocation, category_translation) | High | All |
| FR-002 | System must check for null values in all columns | High | All |
| FR-003 | System must convert date columns to datetime format (order_purchase_timestamp, order_delivered_customer_date, etc.) | High | Operations |
| FR-004 | System must fill missing product categories with 'Unknown' | High | Product |
| FR-005 | System must fill missing product dimensions (weight, length, height, width) with median values | Medium | Logistics |
| FR-006 | System must remove duplicate rows from geolocation table (keep first per zip code) | Medium | Logistics |
| FR-007 | System must merge English category names using translation table | High | All |
| FR-008 | System must calculate delivery_diff_days = order_delivered_customer_date - order_estimated_delivery_date | High | Operations |
| FR-009 | System must export 8 clean CSV files | High | All |

---

## 4. Database Design Requirements

| ID | Requirement | Priority | Stakeholder |
|----|-------------|----------|-------------|
| FR-010 | System must support Galaxy Schema with 4 fact tables (fact_orders, fact_order_items, fact_order_payments, fact_order_reviews) | High | All |
| FR-011 | System must support dimension tables (dim_customers, dim_products, dim_sellers, dim_date, dim_payment) | High | All |
| FR-012 | System must maintain referential integrity between fact and dimension tables | High | All |
| FR-013 | System must include a complete date dimension with day, month, quarter, year | Medium | All |

---

## 5. SQL Analysis Requirements (18 Questions)

### 5.1 Revenue & Sales (FR-014 to FR-018)

| ID | Requirement | Priority | User Story |
|----|-------------|----------|------------|
| FR-014 | System must calculate total revenue from delivered orders | High | US-01 |
| FR-015 | System must identify top 10 product categories by revenue | High | US-04 |
| FR-016 | System must identify top 10 products by number of sales | High | US-05 |
| FR-017 | System must identify bottom 5 product categories by revenue | Medium | US-07 |
| FR-018 | System must calculate Average Order Value (AOV) | High | US-06 |

### 5.2 Geographic Analysis (FR-019 to FR-022)

| ID | Requirement | Priority | User Story |
|----|-------------|----------|------------|
| FR-019 | System must identify top 5 states by revenue | High | US-02 |
| FR-020 | System must identify top 5 cities by number of orders | Medium | US-02 |
| FR-021 | System must identify top 5 states with highest cancellation rates | Medium | Operations |
| FR-022 | System must calculate average delivery days by state | High | US-08 |

### 5.3 Reviews & Ratings (FR-023 to FR-026)

| ID | Requirement | Priority | User Story |
|----|-------------|----------|------------|
| FR-023 | System must show review score distribution (1-5 stars) | High | US-12 |
| FR-024 | System must identify category with most 5-star reviews | High | US-13 |
| FR-025 | System must analyze relationship between delivery time and review score | High | US-22 |
| FR-026 | System must identify category with most low ratings (1 or 2 stars) | Medium | US-14 |

### 5.4 Payments (FR-027 to FR-029)

| ID | Requirement | Priority | User Story |
|----|-------------|----------|------------|
| FR-027 | System must identify most used payment method | High | Sales |
| FR-028 | System must calculate average installments by payment method | Medium | Sales |
| FR-029 | System must identify payment method with highest revenue | Medium | Sales |

### 5.5 Delivery (FR-030 to FR-031)

| ID | Requirement | Priority | User Story |
|----|-------------|----------|------------|
| FR-030 | System must calculate average actual delivery time (days) | High | US-08 |
| FR-031 | System must analyze delayed orders (count and revenue impact) | High | US-10 |

---

## 6. Forecasting Requirements

| ID | Requirement | Priority | Stakeholder |
|----|-------------|----------|-------------|
| FR-032 | System must aggregate monthly sales from order data | High | CEO |
| FR-033 | System must build Linear Regression model to forecast sales | High | CEO |
| FR-034 | System must forecast sales for next 6 months | High | CEO |
| FR-035 | System must calculate model performance metrics (MAE, RMSE, R²) | Medium | CEO |
| FR-036 | System must visualize historical vs forecasted sales | Medium | CEO |
| FR-037 | System must forecast by product category (top 5 categories) | Low | Product |

---

## 7. Dashboard Requirements

### 7.1 General Dashboard Requirements

| ID | Requirement | Priority | Stakeholder |
|----|-------------|----------|-------------|
| FR-038 | System must provide interactive Power BI dashboard with 5 pages | High | All |
| FR-039 | Dashboard must have slicers for date range, state, and category | High | All |
| FR-040 | Dashboard must support drill-through (click product → product details) | Medium | Sales |
| FR-041 | Dashboard must have synchronized slicers across all pages | High | All |
| FR-042 | Dashboard must have tooltips on maps and charts | Medium | All |

### 7.2 Page 1: Executive Dashboard

| ID | Requirement | Priority |
|----|-------------|----------|
| FR-043 | Display Total Revenue KPI card | High |
| FR-044 | Display Total Orders KPI card | High |
| FR-045 | Display Average Order Value (AOV) KPI card | High |
| FR-046 | Display revenue trend line chart (monthly) | High |
| FR-047 | Display top 10 categories by revenue (bar chart) | High |
| FR-048 | Display revenue by state (Brazil map) | High |
| FR-049 | Display payment method distribution (pie chart) | Medium |

### 7.3 Page 2: Customer & Reviews

| ID | Requirement | Priority |
|----|-------------|----------|
| FR-050 | Display review score distribution (histogram) | High |
| FR-051 | Display new vs repeat customers (donut chart) | High |
| FR-052 | Display repeat customer rate KPI | High |
| FR-053 | Display average review score by category (bar chart) | High |
| FR-054 | Display 5-star vs low rating comparison | Medium |

### 7.4 Page 3: Delivery & Operations

| ID | Requirement | Priority |
|----|-------------|----------|
| FR-055 | Display average delivery days KPI | High |
| FR-056 | Display on-time delivery rate KPI | High |
| FR-057 | Display delayed orders count and percentage | High |
| FR-058 | Display average delivery days by state (map or bar chart) | High |
| FR-059 | Display delivery time vs review score scatter plot | High |
| FR-060 | Display freight ratio (freight/revenue) | Medium |
| FR-061 | Display order status distribution (pie chart) | Medium |

### 7.5 Page 4: Products Analysis

| ID | Requirement | Priority |
|----|-------------|----------|
| FR-062 | Display top 10 products by revenue (table or bar chart) | High |
| FR-063 | Display bottom 10 products by revenue | Medium |
| FR-064 | Display price distribution by category (box plot) | Medium |
| FR-065 | Display volume vs freight scatter plot | Low |

### 7.6 Page 5: Sellers Performance

| ID | Requirement | Priority |
|----|-------------|----------|
| FR-066 | Display top 10 sellers by revenue | High |
| FR-067 | Display seller ranking (revenue, rating, lead time) | Medium |
| FR-068 | Display seller average rating vs delivery delay scatter plot | Medium |
| FR-069 | Display seller lead time distribution | Low |

---

## 8. DAX Measures Requirements

| ID | Requirement | Priority |
|----|-------------|----------|
| FR-070 | System must create Total Revenue measure (SUM price + freight) | High |
| FR-071 | System must create Total Orders measure (DISTINCTCOUNT order_id) | High |
| FR-072 | System must create Total Customers measure (DISTINCTCOUNT customer_unique_id) | High |
| FR-073 | System must create AOV measure (Total Revenue / Total Orders) | High |
| FR-074 | System must create Avg Delivery Days measure (AVERAGE delivery_diff_days) | High |
| FR-075 | System must create On-Time % measure (delivery_diff_days >= 0) | High |
| FR-076 | System must create Delayed % measure (delivery_diff_days < 0) | High |
| FR-077 | System must create Repeat Customer Rate measure | High |
| FR-078 | System must create Freight Ratio measure (Total Freight / Total Revenue) | Medium |
| FR-079 | System must create Avg Installments measure (AVERAGE payment_installments) | Medium |

---

## 9. Requirements Traceability Matrix

| Requirement ID | User Story | Stakeholder | Status |
|----------------|------------|-------------|--------|
| FR-014 | US-01 | CEO | ✅ Implemented |
| FR-015 | US-04 | Sales Manager | ✅ Implemented |
| FR-016 | US-05 | Sales Manager | ✅ Implemented |
| FR-018 | US-06 | Sales Manager | ✅ Implemented |
| FR-019 | US-02 | CEO | ✅ Implemented |
| FR-022 | US-08 | Operations | ✅ Implemented |
| FR-023 | US-12 | Marketing | ✅ Implemented |
| FR-024 | US-13 | Marketing | ✅ Implemented |
| FR-025 | US-22 | Product | ✅ Implemented |
| FR-030 | US-08 | Operations | ✅ Implemented |
| FR-031 | US-10 | Operations | ✅ Implemented |
| FR-032-036 | US-01 | CEO | ✅ Implemented |
| FR-038-069 | Various | All | ✅ Implemented |
