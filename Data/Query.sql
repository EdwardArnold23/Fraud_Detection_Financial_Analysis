-- Grouped the transactions of each cardholder
CREATE VIEW cardholder_transactions AS
SELECT cc.cardholder_id, t.amount
FROM transaction AS t
JOIN credit_card as cc
ON t.card = cc.card
GROUP BY cc.cardholder_id,t.amount 

-- Count the number of transactions of each cardholder
CREATE VIEW count_cardholder_transactions AS
SELECT cc.cardholder_id, COUNT(t.amount) as count_transactions
FROM transaction AS t
JOIN credit_card as cc
ON t.card = cc.card
GROUP BY cc.cardholder_id
ORDER BY cc.cardholder_id;

-- Count the transactions that are less than $2.00 per cardholder
CREATE VIEW small_cardholder_transactions AS
SELECT cc.cardholder_id, COUNT(t.amount) as count_small_transactions
FROM transaction as t
JOIN credit_card as cc
ON t.card = cc.card
WHERE t.amount <2 
GROUP BY cc.cardholder_id
ORDER BY COUNT(t.amount) DESC;


-- Top 100 highest transactions made between 7:00 am and 9:00 am
CREATE VIEW highest_transactions_morning AS
SELECT cc.cardholder_id, t.amount,t.date
FROM transaction AS t
JOIN credit_card as cc
ON t.card = cc.card
WHERE EXTRACT(HOUR FROM t.date) <= 9 AND EXTRACT(HOUR FROM t.date) >=7
ORDER BY t.amount DESC
LIMIT 100;

-- Top 100 highest transactions made not between 7:00 am and 9:00 am
CREATE VIEW highest_trans_not_morning AS
SELECT cc.cardholder_id, t.amount, t.date
FROM transaction AS t
JOIN credit_card as cc
ON t.card = cc.card
WHERE EXTRACT(HOUR FROM t.date) != 9 OR EXTRACT(HOUR FROM t.date) != 8 OR EXTRACT(HOUR FROM t.date)!=7
ORDER BY t.amount DESC
LIMIT 100; 

-- Small transactions per merchant
CREATE VIEW small_merchant_transaction AS
SELECT m.id, count(t.amount) as small_trans
from merchant as m
join transaction as t on m.id = t.id_merchant
where t.amount < 2.00 
group by m.id 
order by count(t.amount) desc


--
-- Grouped the transactions of each cardholder
SELECT * FROM cardholder_transactions
-- Count the number of transactions of each cardholder
SELECT * FROM count_cardholder_transactions
-- Count the transactions that are less than $2.00 per cardholder
SELECT * FROM small_cardholder_transactions
-- Top 100 highest transactions made between 7:00 am and 9:00 am
SELECT * FROM highest_transactions_morning
-- Top 100 highest transactions made not between 7:00 am and 9:00 am
SELECT * FROM highest_trans_not_morning
-- Small transactions per merchant
SELECT * FROM small_merchant_transaction 
