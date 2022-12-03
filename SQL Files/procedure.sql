-- procedure to return the policy_no and nominee_name where the relation with the claimer is Friend.
DELIMITER $$
CREATE PROCEDURE patient_friend()
BEGIN
SELECT Policy_no, Nominee_name FROM policy_holder
WHERE Nominee_relation = "Friend";
END
$$
DELIMITER ;

CALL patient_friend;
