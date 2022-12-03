-- Find the number of policy holders who live in GandhiNagar using COUNT
SELECT COUNT(*) FROM policy_holder WHERE City = "Gandhinagar";

-- Find the total amount of money earned by the insurance company as per payment records using SUM
SELECT SUM(Amount) FROM payment_record;

-- Find the average of all the money earned by the insurance company as per payment record using AVG
SELECT AVG(Amount) FROM payment_record;

-- Find the Highest payment as per payment record using MAX
SELECT MAX(Amount) FROM payment_record;

/*
Display the Polocy_no,name of the policy holder with maximum insurance payment
SELECT P.Policy_No, P.Name, MAX(PP.Amount)
FROM Policy_holder AS P JOIN Payment_record AS PP
WHERE P.Policy_No = PP.Policy_No;*/
