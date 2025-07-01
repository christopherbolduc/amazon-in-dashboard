CREATE OR REPLACE VIEW stag_amazon_sales_complete AS
SELECT * 
FROM amazon_sales_full
WHERE status_mismatch = FALSE;

/*  Remove the 10 rows where there is a discrepancy b/t statuses,
    and therefore also the column */