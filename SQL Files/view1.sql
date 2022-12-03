CREATE VIEW policy_holders_and_plans AS
SELECT PO.Policy_No, PL.Name, PL.Plan_No
FROM plan AS PL JOIN policy AS PO
WHERE PL.Plan_No = PO.Plan_No
