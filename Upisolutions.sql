CREATE TABLE transactions (
    transaction_id varchar(50),	timestamp timestamp not null ,	transaction_type varchar(30),	merchant_category varchar(30),	amount_inr int,	transaction_status varchar(30),	sender_age_group varchar(30),	receiver_age_group varchar(30),	sender_state varchar(30),	sender_bank varchar(30),receiver_bank varchar(30),	device_type varchar(30),	network_type varchar(30),	fraud_flag int,	hour_of_day int,	day_of_week varchar(50),	is_weekend int
);
select * from transactions
--1.Display five sample transaction

select * 
from transactions
limit 5;

--2.2. Display the first 20 transactions.

select * 
from transactions
order by timestamp
limit 20;

--3. Fetch the transactions worth less than 100 INR. Display only the amount and
--merchant category
select amount_inr,merchant_category
from transactions
where amount_inr < 100;

--4. How many transactions have happened in total?

select count(*) as total_transaction
from transactions

--5. How many transactions have happened in Karnataka?

select * from transactions
select count(*) as total_transaction
from transactions
where sender_state='Karnataka';

--6. How many transactions happened in July?



select count(*)
from transactions
where to_char(timestamp, 'Mon') = 'Jul'

--7.7. What is the average value of all transactions?

select avg(amount_inr) as average_value
from transactions


--8. Display the names of all the banks that initiated the transaction.
select distinct sender_bank
from transactions

--9. How many unique types of transactions have been used?
select count(distinct(transaction_type)) 
from transactions

--10. Identify all the fraudulent transactions on weekends after midnight and before
sunrise. Assume sunrise is at 6 a.m.
select *
from transactions
where fraud_flag=1 and is_weekend=1
and hour_of_day between 0 and 5

--solution-2
select *
from  transactions 
where fraud_flag = 1
and is_weekend = 1
and hour_of_day >= 0
and hour_of_day < 6;


--11. Identify successful transactions initiated by senior citizens. Assume a senior
--citizen's age starts at 55.

select *
from  transactions 
where transaction_status='SUCCESS'
and sender_age_group like '%55%';

-- solution 2--
select *
from transactions
where transaction_status = 'SUCCESS'
and sender_age_group ='56+'


--12. How many failed grocery or shopping transactions have happened between
--	midnight and sunrise on weekdays? Assume sunrise is at 5 a.m.
select *
from transactions
where merchant_category in('Grocery','Shopping')
and transaction_status='FAILED'
and is_weekend=0
and hour_of_day between 0 and 4;-- 4 taken because betwween uses both range insclusive.

--13. Identify all transactions involving recharge or bill payments at the SBI bank.

select *
from transactions
where transaction_type in('Recharge','Bill Payment')
and ( receIver_bank='SBI' OR sender_bank='SBI')

--14. Which device type has had the most transactions?
select device_type
from transactions
group by device_type
order by count(device_type) desc
limit 1


--15. Fetch the total transaction amount per sender bank.

select sender_bank, sum(amount_inr) as total_amount
from transactions
group by sender_bank























