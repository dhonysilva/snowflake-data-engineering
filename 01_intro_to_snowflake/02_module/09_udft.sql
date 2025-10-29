---> here’s the reference UDF we’re going to work off of as we make our UDTF
CREATE FUNCTION max_menu_price()
  RETURNS NUMBER(5,2)
  AS
  $$
    SELECT MAX(SALE_PRICE_USD) FROM TASTY_BYTES.RAW_POS.MENU
  $$
  ;

USE DATABASE TASTY_BYTES;

---> create a user-defined table function
CREATE FUNCTION menu_prices_above(price_floor NUMBER)
  RETURNS TABLE (item VARCHAR, price NUMBER)
  AS
  $$
    SELECT MENU_ITEM_NAME, SALE_PRICE_USD
    FROM TASTY_BYTES.RAW_POS.MENU
    WHERE SALE_PRICE_USD > price_floor
    ORDER BY 2 DESC
  $$
  ;

---> now you can see it in the list of all functions!
SHOW FUNCTIONS;

---> run the UDTF to see what the output looks like
SELECT * FROM TABLE(menu_prices_above(15));

---> you can use a where clause on the result
SELECT * FROM TABLE(menu_prices_above(15))
WHERE ITEM ILIKE '%CHICKEN%';


CREATE FUNCTION min_menu_price()
  RETURNS NUMBER(5,2)
  AS
  $$
    SELECT MIN(SALE_PRICE_USD) FROM TASTY_BYTES.RAW_POS.MENU
  $$
  ;

select min_menu_price();


CREATE FUNCTION menu_prices_below(price_ceiling NUMBER)
  RETURNS TABLE (item VARCHAR, price NUMBER)
  AS
  $$
    SELECT MENU_ITEM_NAME, SALE_PRICE_USD
    FROM TASTY_BYTES.RAW_POS.MENU
    WHERE SALE_PRICE_USD < price_ceiling
    ORDER BY 2 DESC
  $$
  ;

SELECT * FROM TABLE(menu_prices_below(3));
