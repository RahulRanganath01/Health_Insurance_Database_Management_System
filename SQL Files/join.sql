-- Inner Join
SELECT *
FROM policy_holder JOIN policy ON policy.Policy_no = policy_holder.Policy_no

--Natural JOIN
SELECT *
FROM policy_holder NATURAL JOIN payment_record

--Left Outer JOIN
SELECT *
FROM admin LEFT JOIN agent ON admin.Admin_id = agent.Admin_id;

--Right Outer JOIN
SELECT *
FROM admin RIGHT JOIN agent ON admin.Admin_id = agent.Admin_id;
