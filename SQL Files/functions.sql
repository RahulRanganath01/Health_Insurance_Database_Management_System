-- function to classify the amount as Premium or Standard
DELIMITER $$

CREATE FUNCTION policy_classifier(Amount INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

	IF Amount > 10000 THEN
			RETURN ('Premium');
	ELSE
			RETURN ('Standard');
   	END IF;
END
$$

DELIMITER ;

SELECT Policy_No,policy_classifier(Amount) FROM payment_record;
