CREATE OR REPLACE VIEW mart_amazon_category_b2b_state AS
SELECT
    date,
    category,
    state,
    b2b,
    promo_id IS NOT NULL AS promo_applied,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(qty) AS total_qty,
    SUM(sales) AS total_sales
FROM prep_amazon_sales_paid
WHERE status = 'Shipped'
GROUP BY date, category, state, b2b, promo_applied;

/*  Aggregates daily sales metrics by category, B2B status, and state
    Considers only valid, fulfilled orders  */

    -- DO NOT USE for fulfillment analysis (no promo/status detail)
