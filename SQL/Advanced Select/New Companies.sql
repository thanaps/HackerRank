SELECT company_code,
        founder,
        count(distinct l.lead_manager_code),
        count(distinct s.senior_manager_code),
        count(distinct m.manager_code),
        count(distinct e.employee_code)
    
FROM company 
LEFT JOIN lead_manager l USING (company_code)
LEFT JOIN senior_manager s USING (company_code)
LEFT JOIN manager m USING (company_code)
LEFT JOIN employee e USING (company_code)
GROUP BY company_code, founder
ORDER BY company_code
