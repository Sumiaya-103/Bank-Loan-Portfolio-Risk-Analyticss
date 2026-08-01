CREATE DATABASE bankloan;
USE bankloan;

SELECT * FROM borrower_profiles;

-- 1. WHAT IS THE OVERALL DEFAULT RATE? 
SELECT 
    COUNT(*) AS total_loans, 
    SUM(defaulted) AS total_defaults, 
    ROUND(100.0 * SUM(defaulted) / COUNT(*), 2) AS default_percent
FROM loan_applications;

-- 2. HOW DOES IT BREAK DOWN BY CREDIT SCORE RANGE?
SELECT 
    CASE
        WHEN bp.credit_score BETWEEN 520 AND 599 THEN '520-599'
        WHEN bp.credit_score BETWEEN 600 AND 649 THEN '600-649'
        WHEN bp.credit_score BETWEEN 650 AND 699 THEN '650-699'
        WHEN bp.credit_score BETWEEN 700 AND 749 THEN '700-749'
        WHEN bp.credit_score >= 750 THEN '750+' 
        ELSE 'Below 520'
    END AS credit_score_bucket,
    COUNT(*) AS total_loans,
    SUM(la.defaulted) AS total_defaults,
    ROUND(100.0 * SUM(la.defaulted) / COUNT(*), 2) AS default_percent
FROM loan_applications la
JOIN borrower_profiles bp ON la.borrower_id = bp.borrower_id
GROUP BY credit_score_bucket
ORDER BY credit_score_bucket;

-- 3. IS THERE A RELATIONSHIP BETWEEN A BORROWER'S DEBT-TO-INCOME (DTI) RATIO AND DEFAULTING?
SELECT 
    CASE
        WHEN dti_ratio < 20 THEN '0-19'
        WHEN dti_ratio BETWEEN 20 AND 29 THEN '20-29'
        WHEN dti_ratio BETWEEN 30 AND 39 THEN '30-39'
        WHEN dti_ratio BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS dti_ratio_bucket,
    COUNT(*) AS total_loans,
    SUM(defaulted) AS total_defaults,
    ROUND(100.0 * SUM(defaulted) / COUNT(*), 2) AS default_percent
FROM loan_applications
GROUP BY dti_ratio_bucket
ORDER BY dti_ratio_bucket;

-- 4. WHICH LOAN PURPOSES HAVE THE HIGHEST DEFAULT RATES?
SELECT 
    loan_purpose, 
    COUNT(*) AS total_loans, 
    SUM(defaulted) AS total_defaults, 
    ROUND(100.0 * SUM(defaulted) / COUNT(*), 2) AS default_percent
FROM loan_applications
GROUP BY loan_purpose
ORDER BY default_percent DESC;

-- 5. DOES THE AVERAGE LOAN AMOUNT DIFFER SIGNIFICANTLY BETWEEN DEFAULTED AND NON-DEFAULTED LOANS?
SELECT 
    defaulted, 
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_amount), 0) AS avg_loan_amount,
    MIN(loan_amount) AS min_loan,
    MAX(loan_amount) AS max_loan
FROM loan_applications
GROUP BY defaulted;

-- 6. HOW DOES EMPLOYMENT STATUS AFFECT DEFAULT RISK?
SELECT 
    bp.employment_status,
    COUNT(*) AS total_loans,
    SUM(la.defaulted) AS total_defaults,
    ROUND(100.0 * SUM(la.defaulted) / COUNT(*), 2) AS default_percent
FROM loan_applications la
JOIN borrower_profiles bp ON la.borrower_id = bp.borrower_id
GROUP BY bp.employment_status
ORDER BY default_percent DESC;

-- 7. HOW DO YEARS EMPLOYED AFFECT DEFAULT RISK?
SELECT 
    CASE
        WHEN bp.years_employed < 2 THEN '<2 years'
        WHEN bp.years_employed BETWEEN 2 AND 5 THEN '2-5 years'
        WHEN bp.years_employed BETWEEN 6 AND 10 THEN '6-10 years'
        ELSE '10+ years'
    END AS employment_tenure,
    COUNT(*) AS total_loans,
    SUM(la.defaulted) AS total_defaults,
    ROUND(100.0 * SUM(la.defaulted) / COUNT(*), 2) AS default_percent
FROM loan_applications la
JOIN borrower_profiles bp ON la.borrower_id = bp.borrower_id
GROUP BY employment_tenure
ORDER BY 
    CASE employment_tenure
        WHEN '<2 years' THEN 1
        WHEN '2-5 years' THEN 2
        WHEN '6-10 years' THEN 3
        WHEN '10+ years' THEN 4
        ELSE 5
    END ASC;   

-- 8. ARE BORROWERS WITH LESS THAN 2 YEARS OF EMPLOYMENT MORE LIKELY TO DEFAULT?
SELECT
    CASE
        WHEN bp.years_employed < 2 THEN '<2 years'
        ELSE '2+ years'
    END AS employment_group,
    COUNT(*) AS total_loans,
    SUM(la.defaulted) AS total_defaults,
    ROUND(100.0 * SUM(la.defaulted) / COUNT(*), 2) AS default_percent
FROM loan_applications la
JOIN borrower_profiles bp ON la.borrower_id = bp.borrower_id
GROUP BY employment_group
ORDER BY employment_group;



           



           

 


           