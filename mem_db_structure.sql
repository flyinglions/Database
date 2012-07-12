
/* sql created by Luthfiya */

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `bank_account` (
  `Account_Number` varchar(255) NOT NULL,
  `Bank` varchar(255) NOT NULL,
  `Account_Name` varchar(255) DEFAULT NULL,
  `Balance_Available` float NOT NULL,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`Account_Number`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `budget_items` (
  `Item_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) NOT NULL,
  `Budgeted_Amount` float NOT NULL,
  `Remaining_Amount` float NOT NULL,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`Item_ID`),
  UNIQUE KEY `User_ID` (`User_ID`),
  KEY `User_ID_2` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `expenses` (
  `Expense_ID` int(11) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Account_Number` varchar(255) NOT NULL,
  `SMS_ID` int(11) NOT NULL,
  PRIMARY KEY (`Expense_ID`),
  KEY `Account_Number` (`Account_Number`),
  KEY `SMS_ID` (`SMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `income` (
  `Income_ID` int(11) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Account_Number` varchar(255) NOT NULL,
  `SMS_ID` int(11) NOT NULL,
  PRIMARY KEY (`Income_ID`),
  KEY `Account_Number` (`Account_Number`),
  KEY `SMS_ID` (`SMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `sms` (
  `SMS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Transaction_Type` varchar(255) NOT NULL,
  `Amount` float NOT NULL,
  `Balance_Available` float NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Account_Number` varchar(255) NOT NULL,
  PRIMARY KEY (`SMS_ID`),
  KEY `Account_Number` (`Account_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `user` (
  `User_ID` int(11) NOT NULL,
  `User_Name` varchar(255) NOT NULL,
  `Password` varchar(25) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `bank_account`
  ADD CONSTRAINT `bank_account_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

ALTER TABLE `budget_items`
  ADD CONSTRAINT `budget_items_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`Account_Number`) REFERENCES `bank_account` (`Account_Number`),
  ADD CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`SMS_ID`) REFERENCES `sms` (`SMS_ID`);

ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`Account_Number`) REFERENCES `bank_account` (`Account_Number`),
  ADD CONSTRAINT `income_ibfk_2` FOREIGN KEY (`SMS_ID`) REFERENCES `sms` (`SMS_ID`);

ALTER TABLE `sms`
  ADD CONSTRAINT `sms_ibfk_1` FOREIGN KEY (`Account_Number`) REFERENCES `bank_account` (`Account_Number`);
