--[UNION] of the policy holders that live in Bangalore and Ahmedabad
SELECT * FROM policy_holder
WHERE City = "Bangalore"
UNION
SELECT * FROM policy_holder
WHERE City = "Ahmedabad";

--[UNION ALL] of the MALE policy holders that live in Bangalore and Gandhinagar
SELECT * FROM policy_holder
WHERE City = "Gandhinagar" AND Gender = "Male"
UNION ALL
SELECT * FROM policy_holder
WHERE City = "Bangalore" AND Gender = "Male";

--[EXCEPT] Select all the Policy holders except Male Policy Holders
SELECT * FROM policy_holder
EXCEPT SELECT * FROM policy_holder
		WHERE Gender = "Male";

--[UNION] return the policy no, Name & Nominee Name of policy Holders
-- who live in Ahmedabad and Gandhinagar and are Doctors by Occupation
SELECT Policy_no, Name, Nominee_name
FROM policy_holder
WHERE City = "Ahmedabad" AND Occupation = "Doctor"
UNION
SELECT Policy_no, Name, Nominee_name
FROM policy_holder
WHERE City = "Gandhinagar" AND Occupation = "Doctor";
