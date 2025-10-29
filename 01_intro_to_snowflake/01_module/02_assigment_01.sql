-- How many items are there with an item_category of 'Snack' and an item_subcategory of 'Warm Option'?
SELECT
    item_category,
    item_subcategory,
    COUNT(*) as count
FROM
    tasty_bytes_sample_data.raw_pos.menu
where
    item_category = 'Snack' and item_subcategory = 'Warm Option'
GROUP BY 1, 2
ORDER BY 3 DESC;

-- What are the max sales prices for each of the three item subcategories (hot option, warm option, cold option)? List from highest price to lowest.
SELECT
    item_subcategory,
    max(SALE_PRICE_USD)
FROM
    tasty_bytes_sample_data.raw_pos.menu
where
    item_subcategory in ('Hot Option', 'Warm Option', 'Cold Option')
GROUP BY 1
ORDER BY 2 DESC;

show warehouses;
