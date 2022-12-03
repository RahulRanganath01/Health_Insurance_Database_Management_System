DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin` (
  `Admin_id` int(5) UNSIGNED ZEROFILL NOT NULL CHECK (octet_length(`Admin_id`) = 5),
  `Branch_id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Mobile_no` bigint(10) UNSIGNED NOT NULL,
  `Email_id` varchar(64) DEFAULT NULL,
  `DOB` date NOT NULL,
  `AGE` int(11) GENERATED ALWAYS AS (timestampdiff(YEAR,`DOB`,curdate())),
  `Designation` varchar(15) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Agent`;
CREATE TABLE `Agent` (
  `Agency_code` int(7) UNSIGNED ZEROFILL NOT NULL CHECK (octet_length(`Agency_code`) = 7),
  `Admin_id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `Branch_id` int(5) UNSIGNED ZEROFILL NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Mobile_no` bigint(10) UNSIGNED NOT NULL,
  `Email_id` varchar(64) DEFAULT NULL,
  `DOB` date NOT NULL,
  `AGE` int(11) GENERATED ALWAYS AS (timestampdiff(YEAR,`DOB`,curdate())) VIRTUAL,
  `Designation` varchar(15) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Payment_record`;
CREATE TABLE `Payment_record` (
  `Policy_no` int(9) UNSIGNED NOT NULL CHECK (octet_length(`Policy_no`) = 9),
  `Mode` enum('Cash','Other') NOT NULL,
  `Date_Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `Amount` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Plan`;
CREATE TABLE `Plan` (
  `Plan_no` int(3) UNSIGNED NOT NULL CHECK (octet_length(`Plan_no`) = 3),
  `Name` varchar(15) DEFAULT NULL,
  `MMA` int(3) NOT NULL,
  `min_SA` bigint(10) UNSIGNED NOT NULL,
  `max_SA` bigint(10) UNSIGNED DEFAULT NULL,
  `min_age` int(10) UNSIGNED NOT NULL,
  `max_age` int(10) UNSIGNED NOT NULL,
  `MODE_YEARLY` tinyint(1) DEFAULT 1,
  `MODE_HALFLY` tinyint(1) DEFAULT 1,
  `MODE_QUARTELY` tinyint(1) DEFAULT 1,
  `MODE_MONTHLY` tinyint(1) DEFAULT 1,
  `MODE_SINGLE` tinyint(1) DEFAULT 0,
  `Type_term` tinyint(1) DEFAULT NULL,
  `T1` int(11) DEFAULT NULL,
  `T2` int(11) DEFAULT NULL,
  `T3` int(11) DEFAULT NULL,
  `T4` int(11) DEFAULT NULL,
  `P1` int(11) DEFAULT NULL,
  `P2` int(11) DEFAULT NULL,
  `P3` int(11) DEFAULT NULL,
  `P4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Policy`;
CREATE TABLE `Policy` (
  `Policy_no` int(9) UNSIGNED NOT NULL CHECK (octet_length(`Policy_no`) = 9),
  `Plan_no` int(3) UNSIGNED NOT NULL,
  `Agency_code` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Premium` int(10) UNSIGNED NOT NULL,
  `DOC` date DEFAULT NULL,
  `FUP` date DEFAULT NULL,
  `Mode` enum('Yearly','Halfly','Monthly','Quartely','Single premium') DEFAULT NULL,
  `SA` bigint(10) UNSIGNED NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 1,
  `Term` int(11) NOT NULL,
  `PPT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Policy_holder`;
CREATE TABLE `Policy_holder` (
  `Policy_no` int(9) UNSIGNED NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Mobile_no` bigint(10) NOT NULL,
  `Email_id` varchar(64) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Colony` varchar(15) DEFAULT NULL,
  `House_no` varchar(10) DEFAULT NULL,
  `Pincode` int(6) DEFAULT NULL,
  `Nominee_name` varchar(30) NOT NULL,
  `Nominee_relation` enum('Parent','Child','Spouse','Grand child','Relative','Friend') NOT NULL,
  `Gender` enum('MALE','FEMALE','OTHER') DEFAULT NULL,
  `Occupation` varchar(15) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Edu_ql` varchar(20) DEFAULT NULL,
  `AGE` int(11) GENERATED ALWAYS AS (timestampdiff(YEAR,`DOB`,curdate()))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `Admin`
  ADD PRIMARY KEY (`Admin_id`);

ALTER TABLE `Agent`
  ADD PRIMARY KEY (`Agency_code`),
  ADD FOREIGN KEY (`Admin_id`) REFERENCES `Admin` (`Admin_id`);

ALTER TABLE `Payment_record`
  ADD PRIMARY KEY (`Policy_no`,`Date_Time`);

ALTER TABLE `Plan`
  ADD PRIMARY KEY (`Plan_no`);

ALTER TABLE `Policy`
  ADD PRIMARY KEY (`Policy_no`),
  ADD FOREIGN KEY (`Agency_code`) REFERENCES `Agent` (`Agency_code`);

ALTER TABLE `Policy_holder`
  ADD UNIQUE KEY `Policy_no` (`Policy_no`);

ALTER TABLE `Agent`
  ADD FOREIGN KEY (`Admin_id`) REFERENCES `Admin` (`Admin_id`);


ALTER TABLE `Payment_record`
  ADD FOREIGN KEY (`Policy_no`) REFERENCES `Policy` (`Policy_no`);


ALTER TABLE `Policy`
  ADD FOREIGN KEY (`Agency_code`) REFERENCES `Agent` (`Agency_code`);


ALTER TABLE `Policy_holder`
  ADD FOREIGN KEY (`Policy_no`) REFERENCES `Policy` (`Policy_no`);

