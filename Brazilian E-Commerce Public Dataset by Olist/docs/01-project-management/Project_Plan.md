# Project Plan: Olist E-Commerce Data Analysis

## Timeline (4 Weeks)

### Week 1: Database Design & Data Cleaning

| Task | Deliverable |
|------|-------------|
| Load 9 CSV files | Raw data imported |
| Explore data structure | Data profiling report |
| Handle missing values | Cleaned columns |
| Convert date columns | Proper datetime format |
| Remove duplicates | Deduplicated geolocation |
| Add English category names | Translated categories |
| Calculate delivery metrics | delivery_diff_days column |
| Export clean data | 8 clean CSV files |

### Week 2: SQL Analysis (18 Questions)

| Category | Questions |
|----------|-----------|
| Revenue & Sales | Q1–Q5 |
| Geographic | Q6–Q9 |
| Reviews | Q10–Q13 |
| Payments | Q14–Q16 |
| Delivery | Q17–Q18 |

### Week 3: Sales Forecasting & Database Design Evolution

| Task | Deliverable |
|------|-------------|
| Prepare monthly sales data | Time series ready |
| Build Linear Regression model | Trained model |
| Forecast next 6 months | Predictions |
| Design Galaxy Schema | Fact constellation model |
| Create data dictionary | Column definitions |

### Week 4: Power BI Dashboard & Documentation

| Task | Deliverable |
|------|-------------|
| Connect to clean data | Data source |
| Create 5 dashboard pages | Interactive visuals |
| Write DAX measures | KPIs |
| Final documentation | GitHub upload |

## Milestones

| Milestone | Due Date | Status |
|-----------|----------|--------|
| M1: Data cleaning completed | Week 1, Day 5 | Completed |
| M2: SQL analysis completed | Week 2, Day 5 | Completed |
| M3: Forecasting completed | Week 3, Day 4 | Completed |
| M4: Dashboard completed | Week 4, Day 3 | Completed |
| M5: Documentation & submission | Week 4, Day 5 | Completed |

## Resource Allocation

| Resource | Purpose |
|----------|---------|
| SQL Server 2017+ | Data storage and querying |
| Python 3.9+ | Data cleaning & forecasting |
| Jupyter Notebook | Interactive development |
| Power BI Desktop | Dashboard creation |
| GitHub | Version control |
| VS Code | Code editing |

## Team Roles

| Team Member | Role |
|-------------|------|
| Ahmed Mohamed Awadalla | Data Analyst Lead |
| Mohamed Mostafa Elsayed | Data Analyst |


## Work Breakdown Structure (WBS)

```text
Olist Project
├── 1.0 Data Cleaning (40 hours)
│   ├── 1.1 Load and explore (8 hrs)
│   ├── 1.2 Handle nulls and duplicates (12 hrs)
│   ├── 1.3 Feature engineering (10 hrs)
│   └── 1.4 Export clean data (10 hrs)
├── 2.0 SQL Analysis (30 hours)
│   ├── 2.1 Revenue & Sales (8 hrs)
│   ├── 2.2 Geographic (6 hrs)
│   ├── 2.3 Reviews (6 hrs)
│   ├── 2.4 Payments (5 hrs)
│   └── 2.5 Delivery (5 hrs)
├── 3.0 Forecasting (20 hours)
│   ├── 3.1 Data preparation (6 hrs)
│   ├── 3.2 Model building (8 hrs)
│   └── 3.3 Forecast & validation (6 hrs)
├── 4.0 Dashboard (25 hours)
│   ├── 4.1 Design & layout (8 hrs)
│   ├── 4.2 DAX measures (8 hrs)
│   └── 4.3 Testing & refinement (9 hrs)
└── 5.0 Documentation (15 hours)
    ├── 5.1 GitHub setup (5 hrs)
    ├── 5.2 Report writing (5 hrs)
    └── 5.3 Final review (5 hrs)
