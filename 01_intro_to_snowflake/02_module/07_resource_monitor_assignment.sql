---> create a resource monitor
CREATE RESOURCE MONITOR tasty_test_rm
WITH 
    CREDIT_QUOTA = 15 -- 20 credits
    FREQUENCY = daily -- reset the monitor daily
    START_TIMESTAMP = immediately -- begin tracking immediately
    TRIGGERS 
        ON 90 PERCENT DO NOTIFY; -- notify accountadmins at 80%
        

---> see all resource monitors
SHOW RESOURCE MONITORS;

---> assign a resource monitor to a warehouse
create WAREHOUSE tasty_de_wh;

---> assign a resource monitor to a warehouse
ALTER WAREHOUSE tasty_de_wh SET RESOURCE_MONITOR = tasty_test_rm;


SHOW RESOURCE MONITORS;

---> change the credit quota on a resource monitor
ALTER RESOURCE MONITOR tasty_test_rm
  SET CREDIT_QUOTA=20;

SHOW RESOURCE MONITORS;

---> drop a resource monitor
DROP RESOURCE MONITOR tasty_test_rm;

SHOW RESOURCE MONITORS;