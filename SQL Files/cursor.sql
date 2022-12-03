 -- cursor for creating backup table for policy holders
CREATE TABLE `Policy_holder_backup` (
  `Policy_No` int(9) UNSIGNED NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Mobile_No` bigint(10) NOT NULL,
  `Email_ID` varchar(64) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Colony` varchar(15) DEFAULT NULL,
  `House_No` varchar(10) DEFAULT NULL,
  `Pincode` int(6) DEFAULT NULL,
  `Nominee_Name` varchar(30) NOT NULL,
  `Nominee_Relation` enum('Parent','Child','Spouse','Grand child','Relative','Friend') NOT NULL,
  `Gender` enum('MALE','FEMALE','OTHER') DEFAULT NULL,
  `Occupation` varchar(15) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Edu_ql` varchar(20) DEFAULT NULL,
  `AGE` int(11));

DELIMITER $$
CREATE PROCEDURE backup_procedure()
	BEGIN
    	DECLARE done INT DEFAULT 0;
        DECLARE Policy_No INTEGER;
        DECLARE Name VARCHAR(50);
        DECLARE Mobile_No VARCHAR (10);
        DECLARE Email_ID VARCHAR(50);
        DECLARE City VARCHAR(20);
        DECLARE Colony VARCHAR(15);
        DECLARE House_No VARCHAR(20);
        DECLARE Pincode INTEGER;
        DECLARE Nominee_Name VARCHAR(40);
        DECLARE Nominee_Relation VARCHAR(40);
        DECLARE Gender VARCHAR(10);
        DECLARE Occupation VARCHAR(50);
        DECLARE DOB DATE;
        DECLARE Edu_ql VARCHAR(50);
        DECLARE AGE INTEGER;
        DECLARE curr CURSOR FOR SELECT * FROM policy_holder;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
        OPEN curr;
        label: LOOP
        FETCH curr INTO Policy_No, Name, Mobile_No, Email_ID, City, Colony, House_No, Pincode, Nominee_Name, Nominee_Relation, Gender, Occupation, DOB, Edu_ql, AGE;
        INSERT INTO Policy_holder_backup VALUES(Policy_No, Name, Mobile_No, Email_ID, City, Colony, House_No, Pincode, Nominee_Name, Nominee_Relation, Gender, Occupation, DOB, Edu_ql, AGE);
        IF done = 1 THEN LEAVE label;
        END IF;
        END LOOP;
        CLOSE curr;
       END $$
DELIMITER ;

CALL backup_procedure;
SELECT * FROM Policy_holder_backup;
