CREATE OR REPLACE VIEW prep_amazon_sales_mean AS
SELECT
    date
    , order_id
    , shipping_method
    , status_clean AS status
    , fulfilment
    , courier_status
    , category
    , style
    , sku
    , size
    , qty
    , amount AS sales
    , city
    , state
    , postal_code
    , latitude
    , longitude
    , promo_id
    , fulfilled_by
    , b2b
    , amount_filled
    , SUM(amount) OVER (PARTITION BY state, style) * 1.0 /
        NULLIF(SUM(amount) OVER (PARTITION BY state), 0) AS style_pct_of_state_sales
    , SUM(amount) OVER (PARTITION BY style) AS style_total_sales
    , amount * 1.0 / NULLIF(qty, 0) AS avg_sales_per_unit
FROM stag_amazon_sales_mean;

/*  Prep Amazon sales data with imputed amounts for null values
    Adds imputation flag (amount_filled) to track estimated rows
    Includes key derived metrics for style-level and geographic analysis  */
