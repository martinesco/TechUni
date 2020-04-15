DROP DATABASE IF EXISTS school_sport_clubs;
CREATE DATABASE school_sport_clubs;
USE school_sport_clubs;

CREATE TABLE school_sport_clubs.sports(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE school_sport_clubs.coaches(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(255) NOT NULL ,
  egn VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE school_sport_clubs.students(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(255) NOT NULL ,
  egn VARCHAR(10) NOT NULL UNIQUE ,
  address VARCHAR(255) NOT NULL ,
  phone VARCHAR(20) NULL DEFAULT NULL ,
  class VARCHAR(10) NULL DEFAULT NULL
);

CREATE TABLE school_sport_clubs.sportGroups(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  location VARCHAR(255) NOT NULL ,
  dayOfWeek ENUM('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') ,
  hourOfTraining TIME NOT NULL ,
  sport_id INT NOT NULL ,
  coach_id INT NOT NULL ,
  UNIQUE KEY(location,dayOfWeek,hourOfTraining)  ,
  CONSTRAINT FOREIGN KEY(sport_id)
  REFERENCES sports(id) ,
  CONSTRAINT FOREIGN KEY (coach_id)
  REFERENCES coaches(id)
);

CREATE TABLE school_sport_clubs.student_sport(
  student_id INT NOT NULL ,
  sportGroup_id INT NOT NULL ,
  CONSTRAINT FOREIGN KEY (student_id)
  REFERENCES students(id) ,
  CONSTRAINT FOREIGN KEY (sportGroup_id)
  REFERENCES sportGroups(id) ,
  PRIMARY KEY(student_id,sportGroup_id)
);

CREATE TABLE taxesPayments(
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  group_id INT NOT NULL,
  paymentAmount DOUBLE NOT NULL,
  month TINYINT,
  year YEAR,
  dateOfPayment DATETIME NOT NULL ,
  CONSTRAINT FOREIGN KEY (student_id)
  REFERENCES students(id),
  CONSTRAINT FOREIGN KEY (group_id)
  REFERENCES sportgroups(id)
);

CREATE TABLE salaryPayments(
  id INT AUTO_INCREMENT PRIMARY KEY,
  coach_id INT NOT NULL,
  month TINYINT,
  year YEAR,
  salaryAmount double,
  dateOfPayment datetime not null,
  CONSTRAINT FOREIGN KEY (coach_id)
  REFERENCES coaches(id),
  UNIQUE KEY(`coach_id`,`month`,`year`)
);

INSERT INTO sports
VALUES 	(NULL, 'Football') ,
  (NULL, 'Volleyball'),
  (NULL, 'Tennis');

INSERT INTO coaches
VALUES 	(NULL, 'Ivan Todorov Petkov', '7509041245') ,
  (NULL, 'georgi Ivanov Todorov', '8010091245') ,
  (NULL, 'Ilian Todorov Georgiev', '8407106352') ,
  (NULL, 'Petar Slavkov Yordanov', '7010102045') ,
  (NULL, 'Todor Ivanov Ivanov', '8302160980') ,
  (NULL, 'Slavi Petkov Petkov', '7106041278');

INSERT INTO students (name, egn, address, phone, class)
VALUES 	('Iliyan Ivanov', '9401150045', 'Sofia-Mladost 1', '0893452120', '10') ,
  ('Ivan Iliev Georgiev', '9510104512', 'Sofia-Liylin', '0894123456', '11') ,
  ('Elena Petrova Petrova', '9505052154', 'Sofia-Mladost 3', '0897852412', '11') ,
  ('Ivan Iliev Iliev', '9510104542', 'Sofia-Mladost 3', '0894123457', '11') ,
  ('Maria Hristova Dimova', '9510104547', 'Sofia-Mladost 4', '0894123442', '11') ,
  ('Antoaneta Ivanova Georgieva', '9411104547', 'Sofia-Krasno selo', '0874526235', '10');

INSERT INTO sportGroups
VALUES 	(NULL, 'Sofia-Mladost 1', 'Monday', '08:00:00', 1, 1 ) ,
  (NULL, 'Sofia-Mladost 1', 'Monday', '09:30:00', 1, 2 ) ,
  (NULL, 'Sofia-Liylin 7', 'Sunday', '08:00:00', 2, 1) ,
  (NULL, 'Sofia-Liylin 7', 'Sunday', '09:30:00', 2, 2) ,
  (NULL, 'Plovdiv', 'Monday', '12:00:00', '1', '1');

INSERT INTO student_sport
VALUES 	(1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 2),
  (6, 2),
  (1, 3),
  (2, 3),
  (3, 3);

INSERT INTO `school_sport_clubs`.`taxespayments`
VALUES	(NULL, '1', '1', '200', '1', 2015, now()),
  (NULL, '1', '1', '200', '2', 2015, now()),
  (NULL, '1', '1', '200', '3', 2015, now()),
  (NULL, '1', '1', '200', '4', 2015, now()),
  (NULL, '1', '1', '200', '5', 2015, now()),
  (NULL, '1', '1', '200', '6', 2015, now()),
  (NULL, '1', '1', '200', '7', 2015, now()),
  (NULL, '1', '1', '200', '8', 2015, now()),
  (NULL, '1', '1', '200', '9', 2015, now()),
  (NULL, '1', '1', '200', '10', 2015, now()),
  (NULL, '1', '1', '200', '11', 2015, now()),
  (NULL, '1', '1', '200', '12', 2015, now()),
  (NULL, '2', '1', '250', '1', 2015, now()),
  (NULL, '2', '1', '250', '2', 2015, now()),
  (NULL, '2', '1', '250', '3', 2015, now()),
  (NULL, '2', '1', '250', '4', 2015, now()),
  (NULL, '2', '1', '250', '5', 2015, now()),
  (NULL, '2', '1', '250', '6', 2015, now()),
  (NULL, '2', '1', '250', '7', 2015, now()),
  (NULL, '2', '1', '250', '8', 2015, now()),
  (NULL, '2', '1', '250', '9', 2015, now()),
  (NULL, '2', '1', '250', '10', 2015, now()),
  (NULL, '2', '1', '250', '11', 2015, now()),
  (NULL, '2', '1', '250', '12', 2015, now()),
  (NULL, '3', '1', '250', '1', 2015, now()),
  (NULL, '3', '1', '250', '2', 2015, now()),
  (NULL, '3', '1', '250', '3', 2015, now()),
  (NULL, '3', '1', '250', '4', 2015, now()),
  (NULL, '3', '1', '250', '5', 2015, now()),
  (NULL, '3', '1', '250', '6', 2015, now()),
  (NULL, '3', '1', '250', '7', 2015, now()),
  (NULL, '3', '1', '250', '8', 2015, now()),
  (NULL, '3', '1', '250', '9', 2015, now()),
  (NULL, '3', '1', '250', '10', 2015, now()),
  (NULL, '3', '1', '250', '11', 2015, now()),
  (NULL, '3', '1', '250', '12', 2015, now()),
  (NULL, '1', '2', '200', '1', 2015, now()),
  (NULL, '1', '2', '200', '2', 2015, now()),
  (NULL, '1', '2', '200', '3', 2015, now()),
  (NULL, '1', '2', '200', '4', 2015, now()),
  (NULL, '1', '2', '200', '5', 2015, now()),
  (NULL, '1', '2', '200', '6', 2015, now()),
  (NULL, '1', '2', '200', '7', 2015, now()),
  (NULL, '1', '2', '200', '8', 2015, now()),
  (NULL, '1', '2', '200', '9', 2015, now()),
  (NULL, '1', '2', '200', '10', 2015, now()),
  (NULL, '1', '2', '200', '11', 2015, now()),
  (NULL, '1', '2', '200', '12', 2015, now()),
  (NULL, '4', '2', '200', '1', 2015, now()),
  (NULL, '4', '2', '200', '2', 2015, now()),
  (NULL, '4', '2', '200', '3', 2015, now()),
  (NULL, '4', '2', '200', '4', 2015, now()),
  (NULL, '4', '2', '200', '5', 2015, now()),
  (NULL, '4', '2', '200', '6', 2015, now()),
  (NULL, '4', '2', '200', '7', 2015, now()),
  (NULL, '4', '2', '200', '8', 2015, now()),
  (NULL, '4', '2', '200', '9', 2015, now()),
  (NULL, '4', '2', '200', '10', 2015, now()),
  (NULL, '4', '2', '200', '11', 2015, now()),
  (NULL, '4', '2', '200', '12', 2015, now()),
  /**2014**/
  (NULL, '1', '1', '200', '1', 2014, now()),
  (NULL, '1', '1', '200', '2', 2014, now()),
  (NULL, '1', '1', '200', '3', 2014, now()),
  (NULL, '1', '1', '200', '4', 2014, now()),
  (NULL, '1', '1', '200', '5', 2014, now()),
  (NULL, '1', '1', '200', '6', 2014, now()),
  (NULL, '1', '1', '200', '7', 2014, now()),
  (NULL, '1', '1', '200', '8', 2014, now()),
  (NULL, '1', '1', '200', '9', 2014, now()),
  (NULL, '1', '1', '200', '10', 2014, now()),
  (NULL, '1', '1', '200', '11', 2014, now()),
  (NULL, '1', '1', '200', '12', 2014, now()),
  (NULL, '2', '1', '250', '1', 2014, now()),
  (NULL, '2', '1', '250', '2', 2014, now()),
  (NULL, '2', '1', '250', '3', 2014, now()),
  (NULL, '2', '1', '250', '4', 2014, now()),
  (NULL, '2', '1', '250', '5', 2014, now()),
  (NULL, '2', '1', '250', '6', 2014, now()),
  (NULL, '2', '1', '250', '7', 2014, now()),
  (NULL, '2', '1', '250', '8', 2014, now()),
  (NULL, '2', '1', '250', '9', 2014, now()),
  (NULL, '2', '1', '250', '10', 2014, now()),
  (NULL, '2', '1', '250', '11', 2014, now()),
  (NULL, '2', '1', '250', '12', 2014, now()),
  (NULL, '3', '1', '250', '1', 2014, now()),
  (NULL, '3', '1', '250', '2', 2014, now()),
  (NULL, '3', '1', '250', '3', 2014, now()),
  (NULL, '3', '1', '250', '4', 2014, now()),
  (NULL, '3', '1', '250', '5', 2014, now()),
  (NULL, '3', '1', '250', '6', 2014, now()),
  (NULL, '3', '1', '250', '7', 2014, now()),
  (NULL, '3', '1', '250', '8', 2014, now()),
  (NULL, '3', '1', '250', '9', 2014, now()),
  (NULL, '3', '1', '250', '10', 2014, now()),
  (NULL, '3', '1', '250', '11', 2014, now()),
  (NULL, '3', '1', '250', '12', 2014, now()),
  (NULL, '1', '2', '200', '1', 2014, now()),
  (NULL, '1', '2', '200', '2', 2014, now()),
  (NULL, '1', '2', '200', '3', 2014, now()),
  (NULL, '1', '2', '200', '4', 2014, now()),
  (NULL, '1', '2', '200', '5', 2014, now()),
  (NULL, '1', '2', '200', '6', 2014, now()),
  (NULL, '1', '2', '200', '7', 2014, now()),
  (NULL, '1', '2', '200', '8', 2014, now()),
  (NULL, '1', '2', '200', '9', 2014, now()),
  (NULL, '1', '2', '200', '10', 2014, now()),
  (NULL, '1', '2', '200', '11', 2014, now()),
  (NULL, '1', '2', '200', '12', 2014, now()),
  (NULL, '4', '2', '200', '1', 2014, now()),
  (NULL, '4', '2', '200', '2', 2014, now()),
  (NULL, '4', '2', '200', '3', 2014, now()),
  (NULL, '4', '2', '200', '4', 2014, now()),
  (NULL, '4', '2', '200', '5', 2014, now()),
  (NULL, '4', '2', '200', '6', 2014, now()),
  (NULL, '4', '2', '200', '7', 2014, now()),
  (NULL, '4', '2', '200', '8', 2014, now()),
  (NULL, '4', '2', '200', '9', 2014, now()),
  (NULL, '4', '2', '200', '10', 2014, now()),
  (NULL, '4', '2', '200', '11', 2014, now()),
  (NULL, '4', '2', '200', '12', 2014, now()),
  /**2016**/
  (NULL, '1', '1', '200', '1', 2016, now()),
  (NULL, '1', '1', '200', '2', 2016, now()),
  (NULL, '1', '1', '200', '3', 2016, now()),
  (NULL, '2', '1', '250', '1', 2016, now()),
  (NULL, '3', '1', '250', '1', 2016, now()),
  (NULL, '3', '1', '250', '2', 2016, now()),
  (NULL, '1', '2', '200', '1', 2016, now()),
  (NULL, '1', '2', '200', '2', 2016, now()),
  (NULL, '1', '2', '200', '3', 2016, now()),
  (NULL, '4', '2', '200', '1', 2016, now()),
  (NULL, '4', '2', '200', '2', 2016, now());


SELECT students.name, students.class, sportgroups.id
FROM students
  JOIN sportgroups ON students.id IN (
    SELECT student_id FROM student_sport
    WHERE students.id = sportgroups.id
  );



DELIMITER $
DROP DATABASE IF EXISTS group35 $
CREATE PROCEDURE group35()
  BEGIN
    SELECT sports.name, sportGroups.location
      FROM sports JOIN sportGroups
        ON sports.id = sportGroups.sport_id;
  END $
DELIMITER ;
CALL group35();

#MySQK ima globalni promenlivi
#ima li @ znachi e globalna promenlia, ako nqma - ne e

/*DELIMITER $
DROP DATABASE IF EXISTS testProc $
CREATE PROCEDURE testProc(INOUT coachName VARCHAR(255))
  BEGIN
    SELECT coachName;
    SET coachName = 'Ivan Petrov';
    SELECT coachName;

  END $
DELIMITER ;
SET @coach = 'Georgi Ivanov';
CALL testProc (@coach);
SELECT @coach;*/

use school_sport_clubs;
#drop procedure checkMothTax;
delimiter |
CREATE procedure checkMothTax(IN studId INT, IN groupId INT, IN paymentMonth INT, IN paymentYear INT)
  BEGIN
    DECLARE result char(1);
    SET result = 0;
    IF( (SELECT paymentAmount
         FROM taxespayments
         WHERE student_id = studId
               AND group_id = groupId
               AND MONTH = paymentMonth
               AND year = paymentYear) IS NOT NULL)
    THEN
      SET result = 1;
    ELSE
      SET result = 0;
    END IF;

    SELECT result as IsTaxPayed;
  end;
|
delimiter ;
CALL `school_sport_clubs`.`checkMothTax`(1, 1,1,2015);

# count* sus * broi i praznite redove


use school_sport_clubs;

#drop procedure getPaymentPeriod;
delimiter |
CREATE procedure getPaymentPeriod(IN studId INT, IN groupId INT, IN paymentYear INT)
  BEGIN
    DECLARE countOfMonths tinyint;
    DECLARE monthStr VARCHAR(10);
    DECLARE yearStr varchar(10);
    SET monthStr = 'MONTH';
    SET yearStr = 'YEAR';

    SELECT COUNT(*)
    INTO countOfMonths
    FROM taxespayments
    WHERE student_id = studId
          AND group_id = groupId
          AND year = paymentYear;

    CASE countOfMonths
      WHEN 0 THEN SELECT 'This student has not paid for this group/year!' as PAYMENT_PERIOD;
      WHEN 1 THEN SELECT concat('ONE_', monthStr) as PAYMENT_PERIOD;
      WHEN 3 THEN SELECT concat('THREE_',monthStr, 'S') as PAYMENT_PERIOD;
      WHEN 6 THEN SELECT concat('SIX_',monthStr,'S') as PAYMENT_PERIOD;
      WHEN 12 THEN SELECT yearStr as PAYMENT_PERIOD;
    ELSE
      SELECT 	concat(countOfMonths,monthStr,'S') as PAYMENT_PERIOD;
    END CASE;
  END;
|
DELIMITER ;

CALL getPaymentPeriod(1,1, 2016);



#drop procedure getAllPaymentsAmount;
delimiter |
CREATE procedure getAllPaymentsAmount(IN firstMonth INT, IN secMonth INT, IN paymentYear INT, IN studId INT)
  BEGIN
    DECLARE iterator int;
    IF(firstMonth >= secMonth)
    THEN
      SELECT 'Please enter correct months!' as RESULT;
    ELSE IF((SELECT COUNT(*)
             FROM taxesPayments
             WHERE student_id =studId ) = 0)
    THEN SELECT 'Please enter correct student_id!' as RESULT;
    ELSE

      SET ITERATOR = firstMonth;

      WHILE(iterator >= firstMonth AND iterator <= secMonth)
      DO
        SELECT student_id, group_id, paymentAmount, month
        FROM taxespayments
        WHERE student_id = studId
              AND year = paymentYear
              AND month = iterator;

        SET iterator = iterator + 1;
      END WHILE;
    END IF;

    END IF;
  END;
|
DELIMITER ;

CALL getAllPaymentsAmount(1,6,2015,1);



use school_sport_clubs;
drop procedure getAllPaymentsAmountOptimized;
delimiter |
CREATE procedure getAllPaymentsAmountOptimized(IN firstMonth INT, IN secMonth INT, IN paymentYear INT, IN studId INT)
  BEGIN
    DECLARE iterator int;
    CREATE TEMPORARY TABLE tempTbl(
      student_id int,
      group_id int,
      paymentAmount double,
      month int
    ) ENGINE = Memory;


    IF(firstMonth >= secMonth)
    THEN
      SELECT 'Please enter correct months!' as RESULT;
    ELSE IF((SELECT COUNT(*)
             FROM taxesPayments
             WHERE student_id =studId ) = 0)
    THEN SELECT 'Please enter correct student_id!' as RESULT;
    ELSE

      SET ITERATOR = firstMonth;

      WHILE(iterator >= firstMonth AND iterator <= secMonth)
      DO
        INSERT INTO tempTbl
          SELECT student_id, group_id, paymentAmount, month
          FROM taxespayments
          WHERE student_id = studId
                AND year = paymentYear
                AND month = iterator;

        SET iterator = iterator + 1;
      END WHILE;
    END IF;

    END IF;
    SELECT *
    FROM tempTbl;
    DROP TABLE tempTbl;
  END;
|
DELIMITER ;
CALL getAllPaymentsAmountOptimized(1,6,2015,1);


/*DELIMITER $
DROP PROCEDURE IF EXISTS proced $
CREATE PROCEDURE proced (IN coachName VARCHAR(255))
  BEGIN
  SELECT sports.name, students.name, students.phone, sportGroups.location, sportGroups.hourOfTraining, sportGroups.dayOfWeek
  FROM students JOIN sports
ON students.id IN (
      SELECT student_id FROM sportGroups WHERE sportGroups.sport_id = sports.id
    )

    END $
DELIMITER ;


DELIMITER $
DROP PROCEDURE IF EXISTS transactionProc $
CREATE PROCEDURE transactionProc()
BEGIN
START TRANSACTION
  UPDATE

END $
DELIMITER ;*/
#           09.05.2019
use school_sport_clubs;
drop procedure if exists testProc;
delimiter $$
CREATE PROCEDURE  testProc(IN param int)
    out_block:
  BEGIN
    DECLARE res int;
    SET res = param;
      inner_block:
    BEGIN
      IF (res = 1)
      THEN
        LEAVE inner_block;
      END IF;
      SELECT 'This will be excuted only if param is 0';
    END inner_block;
    SELECT 'End of program';
  END out_block;
$$
delimiter ;




alter table coaches
  add month_salary decimal;

alter table coaches
  add hour_salary decimal;


UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='1200', `hour_salary`='24' WHERE `id`='1';
UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='1300', `hour_salary`='25' WHERE `id`='2';
UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='1800', `hour_salary`='28' WHERE `id`='3';
UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='2000', `hour_salary`='30' WHERE `id`='4';
UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='1450', `hour_salary`='26' WHERE `id`='5';



create table coach_work(
  id int auto_increment primary key,
  coach_id int not null,
  group_id int not null,
  number_of_hours int not null default 1,
  date Datetime not null,
  foreign key (coach_id) references coaches(id),
  foreign key (group_id) references sportgroups(id)
);


INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2016-03-07 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2016-03-14 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2016-03-21 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2016-03-28 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2016-04-04 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2016-04-11 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2016-03-07 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2016-03-14 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2016-03-21 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2016-03-28 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2016-04-04 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2016-04-11 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '3', '2', '2016-04-02 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '3', '2', '2016-04-09 08:45:55');



ALTER TABLE coach_work

  ADD isPayed BOOLEAN NOT NULL DEFAULT 0;
#курсори
use school_sport_clubs;
drop procedure if exists  CursorTest;
delimiter |
create procedure CursorTest()
  begin
    declare finished int;
    declare tempName varchar(100);
    declare tempEgn varchar(10);
    declare coachCursor CURSOR for
      SELECT name, egn
      from coaches
      where month_salary is not null;
    declare continue handler FOR NOT FOUND set finished = 1;
    set finished = 0;
    OPEN coachCursor;
    coach_loop: while( finished = 0)
    DO
      FETCH coachCursor INTO tempName,tempEgn;
      IF(finished = 1)
      THEN
        LEAVE coach_loop;
      END IF;
      SELECT tempName,tempEgn; # or do something with these variables...
    end while;
    CLOSE coachCursor;
    SET finished = 0;
    SELECT 'Finished!';
  end;
|
delimiter |


use school_sport_clubs;
drop table if exists salarypayments_log;
create table salarypayments_log(
  id int auto_increment primary key,
  operation ENUM('INSERT','UPDATE','DELETE') not null,
  old_coach_id int,
  new_coach_id int,
  old_month int,
  new_month int,
  old_year int,
  new_year int,
  old_salaryAmount decimal,
  new_salaryAmount decimal,
  old_dateOfPayment datetime,
  new_dateOfPayment datetime,
  dateOfLog datetime
)Engine = Innodb;

INSERT INTO `school_sport_clubs`.`salarypayments`
(`coach_id`, `month`, `year`, `salaryAmount`, `dateOfPayment`)
VALUES ('4', '4', 2016, '-1450', '2016-04-22 11:45:08');

UPDATE `school_sport_clubs`.`salarypayments` SET `month`='4' WHERE `id`='15';







INSERT INTO `school_sport_clubs`.`coaches` (`name`, `egn`, `month_salary`, `hour_salary`) VALUES ('Ivan Iordanov Petrov', '7452', '1500', '14');
DROP TRIGGER if exists before_coaches_insert;
delimiter |
CREATE TRIGGER before_coaches_insert BEFORE INSERT ON coaches
FOR EACH ROW
  BEGIN
    IF(CHAR_LENGTH(NEW.egn) < 10)
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The egn must be 10 characters.';
    end if;
  END;

delimiter ;




DELIMITER |
CREATE TRIGGER studentNamePhoneEGN_checker BEFORE INSERT ON students
FOR EACH ROW
  BEGIN
    IF(CHAR_LENGTH(new.egn)<10)
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'the EGN must be 10 char';
    END IF;

      IF(CHAR_LENGTH(new.name)<15)
      THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'the NAME must be min 15 char';
      END IF;

        IF(CHAR_LENGTH(new.phone)<10)
        THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'the PHONE must be 10 char';
        END IF;

END ;|
DELIMITER ;




INSERT INTO students(egn, name, phone) VALUES ('2040204555', 'Georggfffffgfgfdg', '05995935');

DROP EVENT IF EXISTS monthly_Payment;
delimiter |
CREATE EVENT monthly_Payment
  ON SCHEDULE EVERY 1 MONTH
  STARTS '2016-05-01 06:05:00'
DO
  BEGIN
    CALL studentNamePhoneEGN_checker(MONTH(NOW()),YEAR(NOW()));
  END;
|
delimiter ;

SHOW PROCESSLIST