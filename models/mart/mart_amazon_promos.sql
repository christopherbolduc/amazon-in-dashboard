CREATE OR REPLACE VIEW mart_amazon_promos AS
SELECT
    date,
    category,
    style,
    promo_id IS NOT NULL AS promo_applied,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(qty) AS total_qty,
    SUM(sales) AS total_sales
FROM prep_amazon_sales_paid
WHERE status = 'Shipped'
GROUP BY date, category, style, promo_applied;

/*  Aggregate daily sales by category, style, and whether a promotion was applied
    Only orders that were successfully completed (no cancellations, returns, etc.)   */

    -- DO NOT USE for cancellation/return rates (filters to 'Shipped' only)
