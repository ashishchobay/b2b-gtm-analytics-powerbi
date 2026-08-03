CREATE VIEW view_gtm_campaign_performance AS
SELECT 
    c.company_id,
    c.industry,
    c.company_size,
    c.annual_revenue_m,
    c.marketing_spend_k,
    c.campaign_type,
    c.leads_generated,
    c.conversion_rate_pct,
    c.region,
    c.contract_status,
    c.sales_rep,
    COUNT(e.employee_id) AS total_contacts,
    COUNT(CASE WHEN e.decision_maker_flag = 'Yes' THEN 1 END) AS decision_maker_count
FROM companies c
LEFT JOIN employees e ON c.company_id = e.company_id
GROUP BY 
    c.company_id, c.industry, c.company_size, c.annual_revenue_m, 
    c.marketing_spend_k, c.campaign_type, c.leads_generated, 
    c.conversion_rate_pct, c.region, c.contract_status, c.sales_rep;