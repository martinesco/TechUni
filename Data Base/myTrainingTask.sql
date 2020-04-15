DROP DATABASE IF EXISTS games;
CREATE DATABASE games;
USE games;

CREATE TABLE games.studio(
  id INT AUTO_INCREMENT PRIMARY KEY,
  foundingYear YEAR DEFAULT NULL,
  name VARCHAR(20) NOT NULL
);

CREATE TABLE games.worker(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  egn VARCHAR(10) NOT NULL,
  telephone VARCHAR(13) DEFAULT NULL,
  position ENUM('Junior','Senior','Intern') NOT NULL,
  studio2_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY(studio2_id)
  REFERENCES studio(id)
);

CREATE TABLE games.monthlyPayment(
  id INT AUTO_INCREMENT PRIMARY KEY,
  worker_id INT NOT NULL,
  dateOfPayment DATETIME NOT NULL,
  amount DOUBLE NOT NULL,
  CONSTRAINT FOREIGN KEY(worker_id)
  REFERENCES worker(id)
);

CREATE TABLE games.games(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  genre ENUM('Action','Adventure','Horror'),
  income INT NOT NULL,
  studio_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY(studio_id)
  REFERENCES studio(id)
);

INSERT INTO studio VALUES
  (NULL, 1994, 'Ubisoft Montreal'),
  (NULL, 2005, 'Ubisoft Sofia'),
  (NULL, 2001, 'Gameloft'),
  (NULL, 1995, 'Valve'),
  (NULL, 1994, 'EA');

INSERT INTO worker VALUES
  (NULL, 'Ivan Ivanov', 9302018238, 0895556732, 'Senior', 2),
  (NULL, 'Peter Gabriel', 8803015678, 0653214562, 'Senior', 1),
  (NULL, 'Francois France', 9903015698, 0763128731, 'Intern', 1),
  (NULL, 'Gabe Newell', 7701049234, 0883129087, 'Senior', 4),
  (NULL, 'Todor Georgiev', 9731048244, 0894445123, 'Junior', 2);

INSERT INTO games VALUES
  (NULL, 'Assassins Creed 3', 'Adventure', 10000, 1),
  (NULL, 'Half Life 2', 'Action', 40000, 4),
  (NULL, 'Tom Clancy Splinter Cell', 'Horror', 35000, 1),
  (NULL, 'Division 2', 'Action', 5000, 2);

INSERT INTO monthlyPayment VALUES
  (NULL, 1, now(), 3000),
  (NULL, 2, now(), 5000),
  (NULL, 3, now(), 2500),
  (NULL, 4, now(), 7000),
  (NULL, 5, now(), 3000);



CREATE VIEW internGames AS SELECT games.name AS game,  worker.name, worker.telephone
  FROM worker

  JOIN games ON worker.studio2_id IN (
      SELECT id FROM studio WHERE worker.studio2_id = games.studio_id) ;
  #WHERE worker.position='senior' AND games.income>20000
  #ORDER BY games.name , worker.name;
/*godina i ime na studio, ime,egn,zaplata na rabotnicite v suotvetnoto studio,||||||
 zaqvkata da se otnasq samo za rabotnici nad 4000 i da e podredena otnosno godinata na osnovavane na studioto */

SELECT monthlyPayment.dateOfPayment, games.name
FROM monthlyPayment
JOIN games ON monthlyPayment.worker_id IN (
    SELECT id FROM worker WHERE worker.studio2_id IN (
      SELECT id FROM studio WHERE studio.id = games.studio_id
    )
  );

SELECT games.name, monthlyPayment.amount,
          2000 * count(monthlyPayment.amount)
FROM games
JOIN monthlyPayment ON games.studio_id IN (
    SELECT id FROM studio
    WHERE studio.id IN (
      SELECT studio2_id FROM worker
      WHERE worker.id = monthlyPayment.worker_id
    )
  )
  GROUP BY monthlyPayment.id
HAVING monthlyPayment.amount
;

UPDATE games
SET games.income = games.income + 1000 * count(games.income);

CREATE VIEW studioWorker AS
    SELECT studio.foundingYear, studio.name AS studio, worker.name, worker.egn, monthlyPayment.amount
  FROM worker
  JOIN studio ON worker.studio2_id = studio.id
  JOIN monthlyPayment ON worker.id = monthlyPayment.worker_id
  WHERE monthlyPayment.amount>4000
  ORDER BY studio.foundingYear;


#da dobavim 1000 dohod kum igra koqto ima dohod pod 20000
#zapochava s BEGIN i zavurshva s COMMIT
/* SELECT * FROM games predi i sled tranzakciqta za da vidq vidimo rezultata */
BEGIN;
UPDATE games
SET income = income - 1000
WHERE income < 20000;
COMMIT;


#za studio UBISOFT SOFIQ se uvelichavat zaplatite na rabotnicite s 200. Napishete tranzakciq da dobavq 200lv kum zaplatata samo ako poziciqta e senior
BEGIN;
UPDATE monthlyPayment
JOIN worker ON monthlyPayment.worker_id = worker.id
    JOIN studio ON worker.studio2_id=studio.id
SET amount = amount + 200
WHERE studio.name=('Ubisoft Sofia') AND worker.position=('senior');
COMMIT;
#TOVA RABOTI NO NE E izvestno zashto, shte go napravim sus vlojeni selektova

BEGIN ;
UPDATE monthlyPayment
JOIN worker ON worker_id=worker.id
    JOIN studio ON studio.id
    IN ( SELECT worker.studio2_id FROM worker WHERE monthlyPayment.worker_id = worker.id )
    SET monthlyPayment.amount = monthlyPayment.amount + 200
WHERE studio.name=('Ubisoft Sofia') AND worker.position=('senior');
COMMIT;

#PROCEDURI
#procedura dad uvelichava mesechna zaplata sus 200lv na vseki rabotnik koito raboti v studio s id 2
DELIMITER $
DROP PROCEDURE IF EXISTS test2$
CREATE PROCEDURE test2()
  BEGIN

#     SELECT worker.name, monthlyPayment.amount
#     FROM worker
#       JOIN monthlyPayment
#         ON monthlyPayment.worker_id = worker.id;

    UPDATE monthlyPayment
      JOIN worker ON monthlyPayment.worker_id = worker.id
      SET monthlyPayment.amount = monthlyPayment.amount + 200
    WHERE worker.studio2_id = 2;

#     SELECT worker.name, monthlyPayment.amount
#     FROM worker
#       JOIN monthlyPayment
#         ON monthlyPayment.worker_id = worker.id;

  END $
DELIMITER ;

CALL test2();

#shte promenim procedurata da priema 2 parametura. 1 shte e sumata s koqto uvelichavame zaplata, a 2 shte e imeto na firmata kudet rabotqt

CREATE TABLE monthlyPaymentLog(
  time DATETIME NOT NULL,
  oldAmount DOUBLE NOT NULL ,
  newAmount DOUBLE
);
DROP TRIGGER IF EXISTS beforeAmountUpdate;
DELIMITER $
CREATE TRIGGER beforeAmountUpdate BEFORE UPDATE ON monthlyPayment
FOR EACH ROW
  BEGIN

    INSERT INTO monthlyPaymentLog VALUES (now(), OLD.amount, NEW.amount);
  END; $
DELIMITER ;


DROP PROCEDURE IF EXISTS test3;
DELIMITER $
CREATE PROCEDURE test3(IN salaryChange DOUBLE, IN company VARCHAR(20))             #smenqme imeto i dobavqme parametri, VUTRESHNI
  BEGIN
    START TRANSACTION ;                                            #dobavqme tozi red i nakraq COMMIt i stava na tranzakciq
    UPDATE monthlyPayment
      JOIN studio ON monthlyPayment.worker_id IN (
        SELECT id FROM worker WHERE worker.studio2_id = studio.id
      )
    SET monthlyPayment.amount = monthlyPayment.amount + salaryChange
    WHERE studio.name = company;
    COMMIT ;                                                            #COMMIT
    SELECT * FROM games.monthlyPaymentLog;
  END $
DELIMITER ;

CALL test3('500', 'Ubisoft Sofia');


#                  TRIGEGRI
#da napravim triger da proverqva i izvejda greshka ako na nqkogo zaplatata stane otricatelna

DROP TRIGGER IF EXISTS paymentCheck;
DELIMITER $
CREATE TRIGGER paymentCheck BEFORE UPDATE ON monthlyPayment
  FOR EACH ROW
  BEGIN
IF (NEW.amount <0)THEN SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'amount trebva da e po-golqma ot 0';
  END IF;
  END;$
DELIMITER ;
UPDATE monthlyPayment SET amount = -3000;

#da napravim triger koito da suzdade tablica v koqto izdava otchet kakva
#  e bila stoinostta na zaplata na rabotnika predi i sled promqnata v procedura test3()
# KUDETO podavame parametrite da e tranzakciq
CREATE TABLE monthlyPaymentLog(
  time DATETIME NOT NULL,
  oldAmount DOUBLE NOT NULL ,
  newAmount DOUBLE
);


DROP TRIGGER IF EXISTS beforeAmountUpdate;
DELIMITER $
CREATE TRIGGER beforeAmountUpdate BEFORE UPDATE ON monthlyPayment
FOR EACH ROW
  BEGIN

    INSERT INTO monthlyPaymentLog VALUES (now, OLD.amount, NEW.amount);

  END; $
DELIMITER ;

SHOW PROCESSLIST


