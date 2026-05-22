# Risk Assessment & Mitigation Plan

## Risk Matrix

| Risk ID | Risk Description | Probability | Impact | Mitigation Strategy |
|---------|------------------|-------------|--------|----------------------|
| R1 | Missing values in critical columns (e.g., delivery dates) | High | High | Document missing rows, use median imputation or exclude if <5% |
| R2 | SQL Server performance slow with large joins | Medium | Medium | Create indexes on foreign keys, use filtered queries |
| R3 | Portuguese text in product categories and reviews | Low | Medium | Translate using Google Translate API or focus on numeric fields |
| R4 | Dashboard tool compatibility issues | Low | Low | Develop in both Power BI and Tableau |
| R5 | Hard drive failure or data loss | Low | High | Daily commits to GitHub, backup SQL Server database |
| R6 | Time management issues | Medium | High | Use Gantt chart, set weekly checkpoints |

## Risk Log

| Risk ID | Status | Notes |
|---------|--------|-------|
| R1 | Active | Missing delivery dates exist, handled in clean tables |
| R2 | Active | Indexes will be added before heavy queries |
| R3 | Mitigated | Product categories mapped to English |
| R4 | Closed | Power BI chosen, confirmed working |
| R5 | Mitigated | GitHub backup configured |
| R6 | Active | Weekly progress tracked |
