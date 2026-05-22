# Non-Functional Requirements

## 1. Purpose
This document defines the non-functional requirements for the Olist e-commerce analytics project. Non-functional requirements describe **how** the system should perform (quality attributes).

## 2. Requirements Categories

| Category | Description |
|----------|-------------|
| Performance | Speed, response time, throughput |
| Reliability | Availability, fault tolerance, recoverability |
| Usability | Ease of use, learnability, accessibility |
| Security | Data protection, access control |
| Scalability | Ability to handle growth |
| Maintainability | Ease of changes and updates |
| Portability | Ability to run in different environments |

---

## 3. Performance Requirements

| ID | Requirement | Target | Priority |
|----|-------------|--------|----------|
| NFR-001 | SQL queries must execute in under 10 seconds for 100K+ rows | < 10 sec | High |
| NFR-002 | Power BI dashboard must load initial page in under 5 seconds | < 5 sec | High |
| NFR-003 | Power BI slicer filters must respond in under 2 seconds | < 2 sec | High |
| NFR-004 | Python data cleaning must complete within 10 minutes for 1M+ rows | < 10 min | Medium |
| NFR-005 | Forecasting model training must complete within 30 seconds | < 30 sec | Medium |
| NFR-006 | Dashboard must support up to 5 concurrent users without degradation | 5 users | Low |

## 4. Performance Optimization Techniques

| Technique | Applied To | Expected Improvement |
|-----------|------------|---------------------|
| Create indexes on foreign keys | SQL Server | 50-80% faster joins |
| Use filtered queries (WHERE order_status = 'delivered') | SQL Server | 30-50% faster |
| Optimize data types (use INT instead of VARCHAR where possible) | SQL Server | 20-30% smaller |
| Use aggregations in Power BI | Power BI | 40-60% faster |
| Limit rows in development (use TOP 1000) | SQL Server | Faster testing |

---

## 5. Reliability Requirements

| ID | Requirement | Target | Priority |
|----|-------------|--------|----------|
| NFR-007 | System must handle missing data gracefully (no crashes) | 100% | High |
| NFR-008 | System must produce consistent results across multiple runs | 100% | High |
| NFR-009 | Data cleaning scripts must be idempotent (same output for same input) | Yes | High |
| NFR-010 | System must have 99% availability during working hours | 99% | Medium |
| NFR-011 | System must recover from errors without data loss | Yes | Medium |
| NFR-012 | Data backups must be performed daily on GitHub | Daily | High |

## 5.2 Fault Tolerance

| Failure Scenario | System Response | Recovery Time |
|------------------|----------------|---------------|
| Missing input file | Log error, notify user | N/A |
| Null value in critical column | Fill with default (0, 'Unknown', median) | Immediate |
| SQL Server connection lost | Retry 3 times, then log error | < 1 min |
| Power BI refresh fails | Use cached data, retry after 5 min | < 5 min |

---

## 6. Usability Requirements

| ID | Requirement | Target | Priority |
|----|-------------|--------|----------|
| NFR-013 | Dashboard must have intuitive navigation (5 clear pages) | Yes | High |
| NFR-014 | All charts must have clear titles and axis labels | Yes | High |
| NFR-015 | Dashboard must have tooltips explaining KPIs | Yes | Medium |
| NFR-016 | Colors must be consistent across all pages | Yes | Medium |
| NFR-017 | System must include README file with installation guide | Yes | High |
| NFR-018 | User manual must be provided for dashboard users | Yes | Medium |
| NFR-019 | Code must have comments explaining complex logic | Yes | High |

## 6.2 Accessibility Requirements

| ID | Requirement | Target |
|----|-------------|--------|
| NFR-020 | Dashboard must support high contrast mode | Recommended |
| NFR-021 | Color should not be the only way to convey information | Yes |
| NFR-022 | Font size must be readable (minimum 10pt for text, 14pt for titles) | Yes |

## 6.3 UI/UX Guidelines

| Guideline | Application |
|-----------|-------------|
| Consistent color scheme | Blue/green for positive KPIs, red for alerts |
| KPI cards on top of each page | Immediate visibility of key metrics |
| Slicers on left or top | Easy filtering |
| Charts sorted descending | Top items first |
| Map for geographic data | Intuitive state-level insights |

---

## 7. Security Requirements

| ID | Requirement | Target | Priority |
|----|-------------|--------|----------|
| NFR-023 | No PII (Personally Identifiable Information) is stored (Olist data is anonymized) | Yes | High |
| NFR-024 | GitHub repository must be private if containing sensitive data | N/A (public OK) | Medium |
| NFR-025 | SQL Server access must be restricted to project team | Yes | Medium |
| NFR-026 | No hardcoded credentials in code or scripts | Yes | High |

## 7.2 Security Best Practices Applied

| Practice | Implemented |
|----------|-------------|
| No credentials in code | ✅ |
| Use environment variables for sensitive config | ⚠️ (not needed for this project) |
| Data anonymized by source | ✅ |
| Regular commits to GitHub (backup) | ✅ |

---

## 8. Scalability Requirements

| ID | Requirement | Target | Priority |
|----|-------------|--------|----------|
| NFR-027 | System must handle 2x data volume without major changes | 200K orders | Low |
| NFR-028 | Python code must use efficient data structures (pandas, not loops) | Yes | Medium |
| NFR-029 | SQL queries must use indexes for scalability | Yes | Medium |
| NFR-030 | Dashboard must handle additional months (time series growth) | Yes | Low |

## 8.1 Scalability Limitations

| Component | Current Capacity | Scalability Limit | Action if Exceeded |
|-----------|-----------------|-------------------|---------------------|
| SQL Server (Local) | 100K orders | 1M orders | Move to Azure SQL |
| Power BI Desktop | 100K rows | 500K rows | Use aggregations |
| Python (pandas) | 1M rows | 10M rows | Use chunking or Dask |

---

## 9. Maintainability Requirements

| ID | Requirement | Target | Priority |
|----|-------------|--------|----------|
| NFR-031 | Code must be modular (separate files for cleaning, analysis, forecasting) | Yes | High |
| NFR-032 | Variables and functions must have meaningful names | Yes | High |
| NFR-033 | SQL queries must be stored in separate .sql files | Yes | Medium |
| NFR-034 | Documentation must be updated when code changes | Yes | Medium |
| NFR-035 | GitHub commit messages must be descriptive | Yes | High |

## 9.1 Code Organization Standards

| Standard | Applied |
|----------|---------|
| PEP 8 for Python | ✅ |
| UPPER_CASE for SQL keywords | ✅ |
| snake_case for variables | ✅ |
| Comments for complex logic | ✅ |
| No duplicate code (DRY principle) | ✅ |

---

## 10. Portability Requirements

| ID | Requirement | Target | Priority |
|----|-------------|--------|----------|
| NFR-036 | Python code must run on Windows, Mac, or Linux | Yes | Medium |
| NFR-037 | SQL queries must be compatible with SQL Server (T-SQL) | Yes | High |
| NFR-038 | Dashboard must be exportable to PDF | Yes | Low |
| NFR-039 | Clean CSV files must be readable by any tool | Yes | High |

## 10.1 Environment Requirements

| Component | Minimum Version | Tested On |
|-----------|----------------|-----------|
| Python | 3.9+ | 3.9, 3.10 |
| SQL Server | 2017+ | 2019 |
| Power BI | Desktop (free) | 2024 version |
| OS | Windows 10/11 | ✅ |
| RAM | 8 GB minimum | 16 GB used |
| Storage | 2 GB free | ✅ |

---

## 11. NFR Priority Summary

| Priority | Count of Requirements |
|----------|----------------------|
| High | 22 |
| Medium | 12 |
| Low | 5 |
| **Total** | **39** |

### High Priority NFRs (Must Have)

| ID | Requirement |
|----|-------------|
| NFR-001 | SQL query performance (< 10 sec) |
| NFR-002 | Dashboard initial load (< 5 sec) |
| NFR-003 | Slicer response (< 2 sec) |
| NFR-007 | Handle missing data gracefully |
| NFR-008 | Consistent results |
| NFR-009 | Idempotent cleaning scripts |
| NFR-012 | Daily GitHub backups |
| NFR-013 | Intuitive navigation |
| NFR-017 | README file |
| NFR-023 | No PII stored |
| NFR-026 | No hardcoded credentials |
| NFR-031 | Modular code |
| NFR-032 | Meaningful names |
| NFR-035 | Descriptive commit messages |

---

## 12. NFR Validation Checklist

| ID | Requirement | Validated? | Method |
|----|-------------|------------|--------|
| NFR-001 | SQL query < 10 sec | ✅ Yes | Manual testing |
| NFR-002 | Dashboard load < 5 sec | ✅ Yes | Manual testing |
| NFR-003 | Slicer < 2 sec | ✅ Yes | Manual testing |
| NFR-004 | Cleaning < 10 min | ✅ Yes | Timing |
| NFR-007 | Missing data handling | ✅ Yes | Tested with nulls |
| NFR-013 | Navigation | ✅ Yes | 5 dashboard pages |
| NFR-017 | README file | ✅ Yes | GitHub |
| NFR-023 | No PII | ✅ Yes | Olist data is anonymized |
| NFR-026 | No hardcoded credentials | ✅ Yes | Code review |
| NFR-031-032 | Modular, meaningful names | ✅ Yes | Code review |
