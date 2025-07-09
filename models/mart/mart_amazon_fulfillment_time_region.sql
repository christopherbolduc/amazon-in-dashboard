CREATE OR REPLACE VIEW mart_amazon_fulfillment_time_region AS
SELECT
    date
    , city
    , state
    , style
    , category
    , size
    , status
    , SUM(qty) AS total_units
    , SUM(sales) AS total_sales
    , AVG(avg_sales_per_unit) AS avg_sales_per_unit
FROM prep_amazon_sales_complete
WHERE status IN ('Shipped', 'Cancelled', 'Returned')
GROUP BY date, city, state, style, category, size, status;

/*  Aggregate total units, sales, and average sales per unit 
    for shipped, cancelled, and returned styles by date, region, and size
    Used to analyze fulfillment performance over time, across locations, and by size variant */

    -- DO NOT USE for sales rankings or top-selling style analysis (includes non-shipped orders)
