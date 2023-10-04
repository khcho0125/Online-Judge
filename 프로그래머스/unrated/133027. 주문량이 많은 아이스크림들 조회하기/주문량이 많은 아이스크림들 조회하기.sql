WITH TOTAL_ORDER_LIST AS (
    SELECT
        HALF.FLAVOR AS FLAVOR,
        SUM(HALF.TOTAL_ORDER) + SEVEN.TOTAL_ORDER AS TOTAL_ORDER
    FROM
        FIRST_HALF AS HALF
    CROSS JOIN
        (SELECT
             FLAVOR,
             SUM(TOTAL_ORDER) AS TOTAL_ORDER
         FROM
             JULY
         GROUP BY
             FLAVOR) AS SEVEN
            ON HALF.FLAVOR = SEVEN.FLAVOR
    GROUP BY
        FLAVOR
    ORDER BY
        TOTAL_ORDER DESC
    LIMIT 3
)

SELECT
    FLAVOR
FROM TOTAL_ORDER_LIST