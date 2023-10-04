WITH PUCHASED_USER AS (
    SELECT
        USER_ID
    FROM
        USER_INFO
    WHERE
        YEAR(JOINED) = 2021
)

SELECT
    YEAR(SALE.SALES_DATE) AS YEAR,
    MONTH(SALE.SALES_DATE) AS MONTH,
    COUNT(DISTINCT USERS.USER_ID) AS PUCHASED_USERS,
    ROUND(COUNT(DISTINCT USERS.USER_ID) / (SELECT COUNT(*) FROM PUCHASED_USER), 1) AS PUCHASED_RATIO
FROM
    ONLINE_SALE AS SALE
JOIN
    PUCHASED_USER AS USERS
        ON SALE.USER_ID = USERS.USER_ID
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH

