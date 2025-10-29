CREATE VIEW tasty_bytes.harmonized.truck_franchise
    AS

SELECT
    t.*,
    f.first_name AS franchisee_first_name,
    f.last_name AS franchisee_last_name
FROM tasty_bytes.raw_pos.truck t
JOIN tasty_bytes.raw_pos.franchise f
    ON t.franchise_id = f.franchise_id;

DESCRIBE VIEW tasty_bytes.harmonized.truck_franchise;

select
    make
from
    tasty_bytes.harmonized.truck_franchise
where 
    FRANCHISEE_FIRST_NAME = 'Sara' and FRANCHISEE_LAST_NAME = 'Nicholson';


DESCRIBE VIEW tasty_bytes.harmonized.truck_franchise;

drop VIEW tasty_bytes.harmonized.truck_franchise;


CREATE materialized VIEW tasty_bytes.harmonized.truck_franchise
    AS
SELECT
    t.*,
    f.first_name AS franchisee_first_name,
    f.last_name AS franchisee_last_name
FROM tasty_bytes.raw_pos.truck t
JOIN tasty_bytes.raw_pos.franchise f
    ON t.franchise_id = f.franchise_id;


CREATE materialized VIEW tasty_bytes.harmonized.nissan
    AS
SELECT
    t.*
FROM tasty_bytes.raw_pos.truck t
WHERE make = 'Nissan';

SELECT COUNT(*) FROM tasty_bytes.harmonized.nissan;

drop materialized VIEW tasty_bytes.harmonized.nissan;