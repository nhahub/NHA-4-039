# Key Performance Indicators (KPIs)

## Business KPIs

### Revenue & Sales

| KPI | Formula | Target | Actual | Status |
|-----|---------|--------|--------|--------|
| Total Revenue | SUM(price + freight) | > $15M | $15.42M | ✅ Exceeded |
| Average Order Value (AOV) | Revenue / Orders | > $150 | $159.83 | ✅ Exceeded |
| Monthly Growth Rate | Slope of linear model | > $50k | $69,572 | ✅ Exceeded |

### Delivery Performance

| KPI | Formula | Target | Actual | Status |
|-----|---------|--------|--------|--------|
| Average Delivery Days | AVG(delivery_diff_days) | < 14 days | 12.09 days | ✅ Achieved |
| On-Time Delivery Rate | (on_time / total) × 100 | > 90% | 92.13% | ✅ Achieved |
| Delayed Orders % | (delayed / total) × 100 | < 10% | 8% | ✅ Achieved |

### Customer Satisfaction

| KPI | Formula | Target | Actual | Status |
|-----|---------|--------|--------|--------|
| Average Review Score | AVG(review_score) | > 4.0 | 4.09 | ✅ Achieved |
| 5-Star Review Rate | (5_star / total) × 100 | > 50% | ~55% | ✅ Achieved |
| Repeat Customer Rate | (repeat / total) × 100 | > 10% | 12.5% | ✅ Achieved |

### Payment Analysis

| KPI | Formula | Target | Actual | Status |
|-----|---------|--------|--------|--------|
| Credit Card Usage | (credit_card / total) × 100 | > 70% | 78% | ✅ Achieved |
| Average Installments | AVG(payment_installments) | > 2 | ~3 | ✅ Achieved |

### Product & Seller

| KPI | Target | Actual | Status |
|-----|--------|--------|--------|
| Top Category Revenue | health_beauty | $1.4M | ✅ Identified |
| Top State Revenue | SP (São Paulo) | 45% | ✅ Identified |
| Number of Active Sellers | > 3,000 | 3,095 | ✅ Good |
| Number of Products | > 30,000 | 32,951 | ✅ Good |

## Forecasting KPIs

| Metric | Value |
|--------|-------|
| Model | Linear Regression |
| Slope (monthly growth) | $69,572 |
| MAE (Mean Absolute Error) | $304,049 |
| RMSE | $341,948 |
| R² | Documented in notebook |

## Forecast Results (Next 6 Months)

| Month | Predicted Revenue |
|-------|-------------------|
| September 2018 | $1.57 Million |
| October 2018 | $1.64 Million |
| November 2018 | $1.71 Million |
| December 2018 | $1.78 Million |
| January 2019 | $1.85 Million |
| February 2019 | $1.92 Million |

## Dashboard KPIs (DAX Measures)

| Measure | Definition |
|---------|------------|
| Total Revenue | SUM(price + freight_value) WHERE order_status = 'delivered' |
| Total Orders | DISTINCTCOUNT(order_id) WHERE order_status = 'delivered' |
| Total Customers | DISTINCTCOUNT(customer_unique_id) |
| AOV | [Total Revenue] / [Total Orders] |
| Avg Delivery Days | AVERAGE(delivery_diff_days) |
| Avg Review Score | AVERAGE(review_score) |
| Total Freight | SUM(freight_value) |
| Avg Installments | AVERAGE(payment_installments) |
| On-Time % | COUNT(delivery_diff_days >= 0) / COUNT(Total Orders) |
| Delayed % | COUNT(delivery_diff_days < 0) / COUNT(Total Orders) |
| Repeat Customer Rate | customers with >1 order / total customers |

## KPI Dashboard (Executive View)

```text
┌────────────────────────────────────────────────────────────────┐
│                    EXECUTIVE DASHBOARD                         │
├───────────────────┬───────────────────┬───────────────────────┤
│ Total Revenue     │ Total Orders      │ Avg Order Value       │
│   $15.42M    ▲    │   96,000     ▲    │   $159.83        ▲    │
├───────────────────┼───────────────────┼───────────────────────┤
│ Avg Delivery Days │ Avg Review Score  │ Repeat Rate           │
│   12.09 days  ▼   │   4.09 ★★★★★      │   3.12%          ▲    │
├───────────────────┼───────────────────┼───────────────────────┤
│ On-Time Rate      │ Delayed %         │ Monthly Growth        │
│   92.13%     ▲    │   8%         ▼    │   $69,572        ▲    │
└───────────────────┴───────────────────┴───────────────────────┘

▲ = Above target  ▼ = Below target  ✅ = Target achieved
