CREATE OR REPLACE VIEW mart_amazon_geo_sales AS
SELECT
    date,
    style,
    category,
    city,
    state,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(qty) AS total_qty,
    SUM(sales) AS total_sales
FROM prep_amazon_sales_paid
WHERE status = 'Shipped'
GROUP BY date, style, category, city, state;

/*  Aggregate daily sales by style, category, city, state
    Only includes valid, fulfilled orders  */

    -- DO NOT USE for fulfillment or promo analysis (location-based shipped sales only)
