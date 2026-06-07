SELECT *
-- FROM {{source('demo', 'bike')}}
FROM {{ ref('stg_bike') }}
LIMIT 10;