DROP DATABASE IF EXISTS `cableCompany`;
CREATE DATABASE `cableCompany`;
USE `cableCompany`;

CREATE TABLE `cableCompany`.`customers` (
  `customerID` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `firstName` VARCHAR( 55 ) NOT NULL ,
  `middleName` VARCHAR( 55 ) NOT NULL ,
  `lastName` VARCHAR( 55 ) NOT NULL ,
  `email` VARCHAR( 55 ) NOT NULL ,
  `phone` VARCHAR( 20 ) NOT NULL ,
  `address` VARCHAR( 255 ) NOT NULL ,
  PRIMARY KEY ( `customerID` )
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `cableCompany`.`accounts` (
  `accountID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
  `amount` DOUBLE NOT NULL ,
  `customer_id` INT UNSIGNED NOT NULL ,
  CONSTRAINT FOREIGN KEY ( `customer_id` )
  REFERENCES `cableCompany`.`customers` ( `customerID` )
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `cableCompany`.`plans` (
  `planID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR( 25 ) NOT NULL,
  `monthly_fee` DOUBLE NOT NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `cableCompany`.`contracts` (
  `contractID` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
  `contractDate` DATE NOT NULL ,
  `customer_id` INT UNSIGNED NOT NULL ,
  `plan_id` INT UNSIGNED NOT NULL ,
  CONSTRAINT FOREIGN KEY ( `customer_id` )
  REFERENCES `cableCompany`.`customers`( `customerID` ) ,
  CONSTRAINT FOREIGN KEY ( `plan_id` )
  REFERENCES `cableCompany`.`plans` ( `planID` ) ,
  UNIQUE KEY( `customer_id`, `plan_id` )
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `cableCompany`.`payments`(
  `paymentID` INT AUTO_INCREMENT PRIMARY KEY ,
  `contract_id` INT UNSIGNED NOT NULL ,
  `paymentAmount` DOUBLE NOT NULL ,
  `month` TINYINT NOT NULL ,
  `year` YEAR NOT NULL ,
  `dateOfPayment` DATETIME NOT NULL ,
  CONSTRAINT FOREIGN KEY ( `contract_id` )
  REFERENCES `cableCompany`.`contracts`( `contractID` ) ,
  UNIQUE KEY( `contract_id`, `month`, `year` )
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `cableCompany`.`debtors`(
  `customer_id` INT UNSIGNED NOT NULL ,
  `plan_id` INT UNSIGNED NOT NULL ,
  `debt_amount` DOUBLE NOT NULL ,

  FOREIGN KEY ( `customer_id` )
  REFERENCES `cableCompany`.`customers`( `customerID` ) ,
  FOREIGN KEY ( `plan_id` )
  REFERENCES `cableCompany`.`plans`( `planID` ) ,
  PRIMARY KEY ( `customer_id`, `plan_id` )
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;



DROP PROCEDURE IF EXISTS monthlyPayment;
DELIMITER $
CREATE PROCEDURE monthlyPayment(IN id INT, IN suma DECIMAL)
  BEGIN
    SELECT
  END; $
DELIMITER ;


DROP EVENT IF EXISTS eventName;
DELIMITER $
CREATE EVENT eventName
  ON SCHEDULE EVERY 1 MONTH
  STARTS '2019-01-28 04:52:12'
DO
  BEGIN
    CALL procedure2(MONTH(NOW()));
  END;
$
DELIMITER ;

DROP VIEW IF EXISTS viewName;
CREATE VIEW viewName AS
SELECT customers.firstName , customers.middleName, customers.lastName, contracts.contractDate, plans.name, debtors.debt_amount
  FROM customers
  JOIN contracts ON customers.customerID = contracts.customer_id
  JOIN debtors ON customers.customerID = debtors.customer_id
  JOIN plans ON customers.customerID













