use bank_loan_db;

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM bank_loan;
 SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan;
 
 SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM bank_loan
 WHERE MONTH(issue_date) = 12;
 
 SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM bank_loan
 WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;
 
 SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan;
 
 SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan
 WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;
 
 SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM bank_loan
 WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;
 
 SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan;
 
 SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM bank_loan
 WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;
 
 SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM bank_loan
 WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;
 
 SELECT ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate FROM bank_loan;

 SELECT ROUND(AVG(int_rate) * 100, 2) AS MTD_Avg_Interest_Rate FROM bank_loan
 WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;
 
 SELECT ROUND(AVG(int_rate) * 100, 2) AS PMTD_Avg_Interest_Rate FROM bank_loan
 WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;
 
 SELECT ROUND(AVG(dti) * 100, 2) AS Avg_DTI FROM bank_loan;

 SELECT ROUND(AVG(dti) * 100, 2) AS MTD_Avg_DTI FROM bank_loan
 WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;
 
 SELECT ROUND(AVG(dti) * 100, 2) AS PMTD_Avg_DTI FROM bank_loan
 WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;
 
 SELECT 
	ROUND(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100 / COUNT(id) ,2) AS Good_Loan_Percentage
    FROM bank_loan;
 
 SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan
 WHERE loan_status IN ('Fully Paid', 'Current');
 
 SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan
 WHERE loan_status IN ('Fully Paid', 'Current');
 
 SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan
 WHERE loan_status IN ('Fully Paid', 'Current');
 
SELECT 
    ROUND(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0 / COUNT(id), 2) AS Bad_Loan_Percentage
    FROM bank_loan;

 SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan
 WHERE loan_status = 'Charged Off';
 
 SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan
 WHERE loan_status = 'Charged Off';
 
 SELECT SUM(total_payment) AS Bad_Loan_Received_Amount FROM bank_loan
 WHERE loan_status = 'Charged Off';
 
 SELECT 
		loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM 
		bank_loan
    GROUP BY
        loan_status;

 SELECT 
		loan_status,
        SUM(total_payment) AS MTD_Total_Amount_Received,
        SUM(loan_amount) AS MTD_Total_Funded_Amount
 FROM bank_loan
 WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 
 GROUP BY loan_status;
			
 SELECT 
		loan_status,
        SUM(total_payment) AS PMTD_Total_Amount_Received,
        SUM(loan_amount) AS PMTD_Total_Funded_Amount
 FROM bank_loan
 WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 
 GROUP BY loan_status;
 
 SELECT 
		MONTH(issue_date) AS Month_Number,
        MONTHNAME(issue_date) AS Month_Name,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount
 FROM bank_loan
 GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
 ORDER BY MONTH(issue_date);
        
 