SELECT p.PRODUCT_ID, p.PRODUCT_NAME, SUM(p.PRICE * o.AMOUNT) AS TOTAL_SALES
FROM FOOD_PRODUCT p
JOIN FOOD_ORDER o 
ON p.PRODUCT_ID = o.PRODUCT_ID
WHERE DATE_FORMAT(PRODUCE_DATE, '%Y-%m') = '2022-05'
GROUP BY p.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, p.PRODUCT_ID