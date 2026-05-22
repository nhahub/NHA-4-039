# User Stories & Use Cases

## 1. Format
**As a** [role]  
**I want** [action]  
**So that** [benefit]

---

## 2. User Stories by Stakeholder

### 2.1 CEO / Executive

| ID | User Story |
|----|------------|
| US-01 | **As a** CEO, **I want** to see total revenue and growth trend, **so that** I can assess overall business health. |
| US-02 | **As a** CEO, **I want** to see revenue by state on a map, **so that** I can identify geographic opportunities. |
| US-03 | **As a** CEO, **I want** to see customer satisfaction trends, **so that** I can prioritize CX initiatives. |

### 2.2 Sales Manager

| ID | User Story |
|----|------------|
| US-04 | **As a** Sales Manager, **I want** to see top 10 categories by revenue, **so that** I can focus marketing efforts. |
| US-05 | **As a** Sales Manager, **I want** to see top 10 products by sales volume, **so that** I can ensure inventory availability. |
| US-06 | **As a** Sales Manager, **I want** to see Average Order Value (AOV), **so that** I can track customer spending. |
| US-07 | **As a** Sales Manager, **I want** to see bottom 5 categories by revenue, **so that** I can consider discontinuing or promoting them. |

### 2.3 Operations Manager

| ID | User Story |
|----|------------|
| US-08 | **As an** Operations Manager, **I want** to see average delivery days by state, **so that** I can identify problematic regions. |
| US-09 | **As an** Operations Manager, **I want** to see on-time delivery rate, **so that** I can track logistics performance. |
| US-10 | **As an** Operations Manager, **I want** to see delayed orders count and revenue impact, **so that** I can quantify the cost of delays. |

### 2.4 Marketing Manager

| ID | User Story |
|----|------------|
| US-11 | **As a** Marketing Manager, **I want** to see repeat customer rate, **so that** I can measure loyalty program effectiveness. |
| US-12 | **As a** Marketing Manager, **I want** to see review score distribution, **so that** I can understand customer satisfaction. |
| US-13 | **As a** Marketing Manager, **I want** to see which categories have the most 5-star reviews, **so that** I can feature them in campaigns. |
| US-14 | **As a** Marketing Manager, **I want** to see which categories have the most low ratings (1-2 stars), **so that** I can investigate quality issues. |

### 2.5 Logistics Manager

| ID | User Story |
|----|------------|
| US-15 | **As a** Logistics Manager, **I want** to see freight ratio (freight/revenue), **so that** I can optimize shipping costs. |
| US-16 | **As a** Logistics Manager, **I want** to see freight value by state, **so that** I can negotiate with carriers. |
| US-17 | **As a** Logistics Manager, **I want** to see if freight correlates with delivery delays, **so that** I can identify carrier issues. |

### 2.6 Seller

| ID | User Story |
|----|------------|
| US-18 | **As a** Seller, **I want** to see my ranking compared to other sellers, **so that** I can benchmark my performance. |
| US-19 | **As a** Seller, **I want** to see my average review score, **so that** I can improve product quality. |
| US-20 | **As a** Seller, **I want** to see my lead time (shipping), **so that** I can reduce delivery delays. |

### 2.7 Product Manager

| ID | User Story |
|----|------------|
| US-21 | **As a** Product Manager, **I want** to see price distribution by category, **so that** I can position products appropriately. |
| US-22 | **As a** Product Manager, **I want** to see relationship between price and review score, **so that** I can identify value-for-money products. |
| US-23 | **As a** Product Manager, **I want** to see volume vs freight by product, **so that** I can optimize product dimensions. |

---

## 3. Use Cases

### UC-01: View Executive Dashboard

| Element | Description |
|---------|-------------|
| **Actor** | CEO |
| **Precondition** | User has dashboard access |
| **Main Flow** | 1. User opens Power BI dashboard<br>2. User views Executive Dashboard page<br>3. User sees KPIs (Revenue, Orders, AOV)<br>4. User sees revenue trend chart<br>5. User sees revenue by state map |
| **Postcondition** | User understands overall business performance |
| **Alternative Flow** | User can filter by date range |

### UC-02: Identify Top Products

| Element | Description |
|---------|-------------|
| **Actor** | Sales Manager |
| **Precondition** | Dashboard is open |
| **Main Flow** | 1. User navigates to Products Analysis page<br>2. User sorts products by revenue<br>3. User identifies top 10 products<br>4. User clicks product to see details |
| **Postcondition** | User knows which products to prioritize |

### UC-03: Analyze Delivery Delays

| Element | Description |
|---------|-------------|
| **Actor** | Operations Manager |
| **Precondition** | Dashboard is open |
| **Main Flow** | 1. User navigates to Delivery & Operations page<br>2. User views average delivery days by state<br>3. User views delayed orders count<br>4. User filters by region<br>5. User identifies problematic states |
| **Postcondition** | User can take action to improve delivery |

### UC-04: Forecast Future Sales

| Element | Description |
|---------|-------------|
| **Actor** | CEO / Sales Manager |
| **Precondition** | Forecasting notebook is available |
| **Main Flow** | 1. User runs forecasting notebook<br>2. User views historical sales chart<br>3. User views forecast for next 6 months<br>4. User sees monthly growth rate |
| **Postcondition** | User can plan inventory and resources |

---


