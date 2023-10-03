SELECT
    BOARD.TITLE,
    BOARD.BOARD_ID,
    REPLY.REPLY_ID,
    REPLY.WRITER_ID,
    REPLY.CONTENTS,
    DATE_FORMAT(REPLY.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE
FROM
    USED_GOODS_BOARD AS BOARD
JOIN
    USED_GOODS_REPLY AS REPLY
    ON REPLY.BOARD_ID = BOARD.BOARD_ID
WHERE
    BOARD.CREATED_DATE BETWEEN '2022-10-01' AND '2022-10-31'
ORDER BY
    REPLY.CREATED_DATE ASC,
    BOARD.TITLE ASC