CREATE OR REPLACE VIEW mart_amazon_volume AS
SELECT
    TO_CHAR(date, 'YYYY-MM') AS month,
    category,
    sku,
    size,
    promo_id IS NOT NULL AS promo_applied,
    COUNT(*) AS order_count,
    SUM(qty) AS total_quantity
FROM prep_amazon_sales_mean
WHERE status = 'Shipped'
GROUP BY
    TO_CHAR(date, 'YYYY-MM'),
    category,
    sku,
    size,
    promo_applied;

/*  Aggregate monthly shipped volume by category, SKU, size, and promo status
    Uses mean-imputed pricing dataset; focuses on volume, not financial reporting   */

    -- DO NOT USE for revenue or return analysis (volume only, mean-imputed pricing)
