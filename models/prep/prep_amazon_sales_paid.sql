CREATE OR REPLACE VIEW prep_amazon_sales_paid AS
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
    , SUM(amount) OVER (PARTITION BY state, style) * 1.0 /
        NULLIF(SUM(amount) OVER (PARTITION BY state), 0) AS style_pct_of_state_sales
    , SUM(amount) OVER (PARTITION BY style) AS style_total_sales
    , amount * 1.0 / NULLIF(qty, 0) AS avg_sales_per_unit
FROM stag_amazon_sales_paid;

/*  Remove currency column(all INR)
    Replace status with status_clean, rename as status
    Rename amount to sales for clairty 
    style_pct_of_state_sales: % of total state sales that this style accounts for
    style_total_sales: national sales total for the style
    sales_per_unit: price per unit/order for SKU-level analysis */