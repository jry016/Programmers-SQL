-- 코드를 입력하세요
SELECT C.CAR_ID, C.CAR_TYPE, 
    ROUND(C.DAILY_FEE * 30 * (100 - D.DISCOUNT_RATE)/100) AS FEE
FROM CAR_RENTAL_COMPANY_CAR C
JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H ON C.CAR_ID = H.CAR_ID
JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN D ON C.CAR_TYPE = D.CAR_TYPE 
WHERE C.CAR_ID NOT IN (
    SELECT CAR_ID FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE < '2022-12-01' AND END_DATE > '2022-11-01'
) AND D.DURATION_TYPE = '30일 이상'
GROUP BY C.CAR_ID
HAVING C.CAR_TYPE IN ('SUV', '세단') AND (FEE BETWEEN 500000 AND 2000000)
ORDER BY FEE DESC, C.CAR_TYPE ASC, C.CAR_ID DESC
