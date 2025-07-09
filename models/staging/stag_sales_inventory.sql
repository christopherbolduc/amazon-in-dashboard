CREATE OR REPLACE VIEW stag_sales_inventory AS
SELECT
    sku
    , design_no AS style
    , stock AS qty
    , category
    , size
    , color
FROM sale_report;

-- Rename columns for standard formatting arcoss datasets