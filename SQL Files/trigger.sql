-- created a trigger that activates when age inserted is negative
DELIMITER $$
CREATE TRIGGER negative_age
BEFORE INSERT
ON policy_holder FOR EACH ROW
BEGIN
	DECLARE error_msg VARCHAR(255);
    SET error_msg = ('Age cannot be zero or negative!!');
    IF NEW.AGE <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_msg;
    END IF;
END $$
DELIMITER ;

INSERT INTO policy_holder VALUES(697103128, 'Atul Khatri', 8363286832, 'khatri.atul32@gmail.com', 'Delhi', 'ZOLD', 'F103', 192023, 'Kavya Khatri', 'Spouse', 'FEMALE', 'Student', '2022-11-18', '12 pass', 0);
