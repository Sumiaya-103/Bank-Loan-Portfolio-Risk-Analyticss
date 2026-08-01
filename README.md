# Bank Loan Portfolio & Risk Analytics

An end-to-end data analysis project investigating key risk drivers behind loan defaults across 601 bank applications. This project leverages **SQL** for data aggregation, **Python** for dataset verification, and **Power BI** for interactive portfolio reporting.

## Key Findings

* **Portfolio Health:** The overall default rate stands at **24.3%** (146 total defaults).
* **Credit Score Risk:** Credit score is the strongest risk indicator—borrowers under 600 defaulted at **49%**, compared to just **11.7%** for those rated 750+.
* **Debt Load:** Defaults spike once a borrower's Debt-to-Income (DTI) ratio exceeds **40%**, topping out at **34.3%** for DTIs over 50%.
* **Employment Tenure:** Applicants with less than 2 years at their job default twice as frequently (**34.5%**) as those with 2–5 years (**16.4%**).
* **Highest-Risk Loan Category:** **Wedding loans** yielded the highest default rate across all categories at **32.1%**.

## Dashboard Preview
<img width="862" height="484" alt="image" src="https://github.com/user-attachments/assets/287bc0bc-e0a5-48fc-9904-9b93031c80ac" />


## Tools & Methods

* **SQL (MySQL):** Multi-table joins, conditional binning (`CASE WHEN`), and metric aggregations.
* **Power BI:** Custom DAX measures, relational data modeling, and interactive reporting.

## Project Files
* `Bank_loan_analysis.sql` – Complete SQL script containing all analytical queries.
* `Bank_loan_default_risk_analysis.pbix` – Interactive Power BI dashboard file.
* `Dashboard.png` – Screenshot preview of the Power BI dashboard.
* `loan_applications.csv` – Primary dataset containing loan application details.
* `borrower_profiles.csv` – Primary dataset containing borrower demographic and credit profile data.
* `default by loan amount.csv` – Exported SQL result for average loan amounts by default status.
* `default rate by credit score bucket.csv` – Exported SQL result for default rates across credit score tiers.
* `default rate by dti.csv` – Exported SQL result for default rates categorized by DTI ranges.
* `default rate by employment group.csv` – Exported SQL result comparing short-tenure (<2 years) vs long-tenure borrowers.
* `default rate by employment status.csv` – Exported SQL result for default rates across employment types.
* `default rate by employment tenure.csv` – Exported SQL result for default rates by years employed.
* `default rate by loan purposes.csv` – Exported SQL result showing default rates by loan purpose.
* `overall defaults.csv` – Exported SQL result for overall portfolio metrics and default counts.

