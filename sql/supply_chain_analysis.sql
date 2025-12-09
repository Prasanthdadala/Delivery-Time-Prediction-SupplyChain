---------------------------------------------------------------
-- SUPPLY CHAIN DELIVERY TIME ANALYSIS (SQL)
-- Author: Prasanth Dadala
-- Solo Project Submission for Daxwell – Data Analyst Role
---------------------------------------------------------------

-- TABLE STRUCTURE ASSUMED:
-- deliveries(
--     pickup_datetime      DATETIME,
--     dropoff_datetime     DATETIME,
--     distance             FLOAT,
--     delivery_minutes     FLOAT,
--     hour_of_dispatch     INT,
--     day_of_week          INT,
--     traffic_window_Morning_Peak  INT,
--     traffic_window_Evening_Peak  INT,
--     traffic_window_Off_Peak      INT
-- );


---------------------------------------------------------------
-- 1. Average Delivery Time by Day of Week
---------------------------------------------------------------
SELECT 
    day_of_week,
    ROUND(AVG(delivery_minutes), 2) AS avg_delivery_time
FROM deliveries
GROUP BY day_of_week
ORDER BY day_of_week;


---------------------------------------------------------------
-- 2. Peak Hour Delay Analysis
---------------------------------------------------------------
SELECT 
    hour_of_dispatch,
    ROUND(AVG(delivery_minutes), 2) AS avg_delivery_time
FROM deliveries
GROUP BY hour_of_dispatch
ORDER BY hour_of_dispatch;


---------------------------------------------------------------
-- 3. Distance vs Delivery Time Bucketing
---------------------------------------------------------------
WITH distance_groups AS (
    SELECT 
        CASE 
            WHEN distance < 2 THEN '0-2 miles'
            WHEN distance < 5 THEN '2-5 miles'
            ELSE '5+ miles'
        END AS distance_bucket,
        delivery_minutes
    FROM deliveries
)
SELECT 
    distance_bucket,
    ROUND(AVG(delivery_minutes), 2) AS avg_delivery_time
FROM distance_groups
GROUP BY distance_bucket
ORDER BY 
    CASE distance_bucket
        WHEN '0-2 miles' THEN 1
        WHEN '2-5 miles' THEN 2
        WHEN '5+ miles' THEN 3
    END;


---------------------------------------------------------------
-- 4. Traffic Window Impact on Delivery Time
---------------------------------------------------------------
SELECT 
    SUM(CASE WHEN traffic_window_Morning_Peak = 1 THEN 1 ELSE 0 END) AS morning_peak_deliveries,
    SUM(CASE WHEN traffic_window_Evening_Peak = 1 THEN 1 ELSE 0 END) AS evening_peak_deliveries,
    SUM(CASE WHEN traffic_window_Off_Peak = 1 THEN 1 ELSE 0 END) AS off_peak_deliveries,

    ROUND(AVG(CASE WHEN traffic_window_Morning_Peak = 1 
                   THEN delivery_minutes END), 2) AS avg_morning_peak_time,

    ROUND(AVG(CASE WHEN traffic_window_Evening_Peak = 1 
                   THEN delivery_minutes END), 2) AS avg_evening_peak_time,

    ROUND(AVG(CASE WHEN traffic_window_Off_Peak = 1 
                   THEN delivery_minutes END), 2) AS avg_off_peak_time
FROM deliveries;


---------------------------------------------------------------
-- 5. Identify Slowest Delivery Routes (Top 10)
---------------------------------------------------------------
SELECT 
    pickup_datetime,
    dropoff_datetime,
    distance,
    delivery_minutes
FROM deliveries
ORDER BY delivery_minutes DESC
LIMIT 10;


---------------------------------------------------------------
-- 6. On-Time Performance Calculation
-- Assume deliveries <= 3 minutes are "On Time"
---------------------------------------------------------------
SELECT
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN delivery_minutes <= 3 THEN 1 ELSE 0 END) AS on_time_deliveries,
    ROUND(SUM(CASE WHEN delivery_minutes <= 3 THEN 1 ELSE 0 END) * 100.0 
          / COUNT(*), 2) AS on_time_percentage
FROM deliveries;


---------------------------------------------------------------
-- END OF FILE
---------------------------------------------------------------

