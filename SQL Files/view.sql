-- Created a view that displays the distribution of insurance policy plans based on claims made by policyholders
CREATE VIEW Types_of_policy_holders_and_plans AS
SELECT PO.Policy_No, PL.Name, PL.Plan_No, COUNT(PL.Plan_No)
FROM plan AS PL JOIN policy AS PO
WHERE PL.Plan_No = PO.Plan_No
GROUP BY PO.Plan_No
HAVING COUNT(PO.Plan_No) > 1
