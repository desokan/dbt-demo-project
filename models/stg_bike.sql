WITH BIKE AS (
    SELECT 
        RIDE_ID,
        -- The STARTED_AT and ENDED_AT columns in the raw data are enclosed in double quotes. 
        -- We use the REPLACE function to remove the double quotes.
        -- This is often necessary when the data is not properly formatted.
        -- We are replacing double quote with empty string to remove it.
        REPLACE(STARTED_AT, '"', '') AS STARTED_AT,
        REPLACE(ENDED_AT, '"', '') AS ENDED_AT,
        START_STATION_NAME,
        START_STATIO_ID,
        END_STATION_NAME,
        END_STATION_ID,
        START_LAT,
        START_LNG,
        END_LAT,
        END_LNG,
        MEMBER_CSUAL
    FROM {{ source('demo', 'bike') }}
    WHERE RIDE_ID != '"bikeid"' 
      AND STARTED_AT != 'starttime' -- This removes the header row if present.
)

SELECT * FROM BIKE