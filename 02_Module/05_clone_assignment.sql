---> clone a database
CREATE OR REPLACE DATABASE tasty_bytes_clone
CLONE tasty_bytes;

---> clone a table based on an offset (so the table as it was at a certain interval in the past)
CREATE OR REPLACE TABLE tasty_bytes.raw_pos.truck_clone
    CLONE tasty_bytes.raw_pos.truck;

SELECT * FROM TASTY_BYTES.INFORMATION_SCHEMA.TABLE_STORAGE_METRICS
WHERE (TABLE_NAME = 'TRUCK_CLONE' OR TABLE_NAME = 'TRUCK')
AND TABLE_CATALOG = 'TASTY_BYTES';
