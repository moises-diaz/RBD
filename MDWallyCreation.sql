DROP DATABASE IF EXISTS MDWally;

CREATE database MDWally;

USE MDWally;

DROP TABLE IF EXISTS `tCustomers`;

CREATE TABLE `tCustomers` (
	`customerID` INT (12) NOT NULL,
    `firstName`	VARCHAR (15) NOT NULL,
    `lastName`	VARCHAR (15) NOT NULL,
    `phoneNumber` VARCHAR (12) NOT NULL,
	 PRIMARY KEY (customerID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tOrder`;

CREATE TABLE `tOrder` (
	`orderID` INT (12) NOT NULL,
    `CustomerID` INT (12) NOT NULL,
    `date` VARCHAR (20) NOT NULL,
	`sPrice` DECIMAL (7) NOT NULL,
    `wPrice` DECIMAL (7) NOT NULL,
    `vin` VARCHAR (10) NOT NULL,
	 INDEX `fk_wprice_torder` (`wPrice` ASC),
	 PRIMARY KEY (orderID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ALTER TABLE `tOrder` --
-- DROP FOREIGN KEY `fk_customerid_tcustomers`; --

ALTER TABLE `tOrder`
ADD CONSTRAINT `fk_customerid_tcustomers`
FOREIGN KEY (customerID) references tCustomers (customerID)
ON DELETE CASCADE
ON UPDATE CASCADE;

DROP TABLE IF EXISTS `tVehicle`;

CREATE TABLE `tVehicle` (
	`vin` INT (17) NOT NULL,
    `colour` VARCHAR (10) NOT NULL,
    `kms` VARCHAR (18) NOT NULL,
	`inStock` BOOL NOT NULL,
    `year` YEAR NOT NULL,
    `wPrice` DECIMAL (7) NOT NULL,
    `dealershipID` INT (12) NOT NULL,
    PRIMARY KEY (vin),
    FOREIGN KEY (dealershipID) references tdealership (dealershipID)

)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ALTER TABLE `tVehicle` --
-- DROP FOREIGN KEY `fk_wprice_torder`; --

ALTER TABLE `tVehicle`
ADD CONSTRAINT `fk_wprice_torder`
FOREIGN KEY (wPrice) references tOrder (wPrice)
ON DELETE CASCADE
ON UPDATE CASCADE;

DROP TABLE IF EXISTS `tStatus`;

-- ALTER TABLE `tCustomers` --!
-- DROP FOREIGN KEY `fk_customerid_tcustomers`; --!

CREATE TABLE `tStatus` (
	`statusID` VARCHAR (5) NOT NULL,
	`customerID` INT (12) NOT NULL,
	`orderID` INT (12) NOT NULL,
	`vin` INT (17) NOT NULL,
    PRIMARY KEY (statusID),
    FOREIGN KEY (customerID) references tCustomers (customerID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `tStatus`

ADD CONSTRAINT `fk_orderid_torder`
FOREIGN KEY (orderID) references tOrder (orderID)
ON DELETE CASCADE
ON UPDATE CASCADE,

ADD CONSTRAINT `fk_vin_tvehicle`
FOREIGN KEY (vin) references tVehicle (vin)
ON DELETE CASCADE
ON UPDATE CASCADE;

DROP TABLE IF EXISTS `tOrderLine`;

CREATE TABLE `tOrderLine` (
	`orderLineID` INT (12) NOT NULL,
    `orderID` INT (12) NOT NULL,
    `statusID` VARCHAR (5) NOT NULL,
    PRIMARY KEY (orderLineID),
    FOREIGN KEY (orderID) references tOrder (orderID),
    FOREIGN KEY (statusID) references tStatus (statusID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tDealership`;   

CREATE TABLE `tDealership` (
	`dealershipID` INT (12) NOT NULL,
    `dealershipName` VARCHAR (12) NOT NULL,
	PRIMARY KEY (dealershipID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tModel`;

CREATE TABLE `tModel` (
	`modelID` INT (4) NOT NULL,
	`description` VARCHAR (15) NOT NULL,
    `makeID` INT (4) NOT NULL,
     PRIMARY KEY (modelID),
	 FOREIGN KEY (makeID) references tMake (makeID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tMake`;

CREATE TABLE `tMake` (
	`makeID` INT (4) NOT NULL,
	`name` VARCHAR (15) NOT NULL,
    PRIMARY KEY (makeID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tInventory`;

CREATE TABLE `tInventory` (
	`quantity` INT (10) NOT NULL,
    `makeID` INT (4) NOT NULL,
    `modelID` INT (4) NOT NULL,
    FOREIGN KEY (makeID) references tMake (makeID),
    FOREIGN KEY (modelID) references tModel (modelID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Sample Data --

INSERT INTO `tCustomers` (`customerID`, `firstName`, `lastName`, `phoneNumber`) VALUES
(1, "", "Wally's World of Wheels Inc.", "519-555-0000");

INSERT INTO `tDealership` (`dealershipID`, `dealershipName`) VALUES
(0000, "Guelph Automall", "Waterloo");

INSERT INTO `tMake` (`makeID`, `name`) VALUES
(1, "Honda"),
(2, "Ford"),
(3, "Volkswagen"),
(4, "Dodge");

INSERT INTO `tModel` (`modelID`, `makeID`, `description`) VALUES
(1, 1, "Civic"),
(2, 2, "Focus"),
(3, 3, "Jetta"),
(4, 4, "Ram");

INSERT INTO `tInventory` (`quantity`, `makeID`, `modelID`) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4);

INSERT INTO `tVehicle` (`vin`, `dealershipID`, `colour`, `year`, `kms`, `inStock`, `wPrice`) VALUES
("58847722BRB", 1, "Blue", 2010, 120332, true, 6500),
("26663747GTG", 2, "Black", 2009, 89221, true, 8950),
("99277544LOL", 3, "Silver", 2012, 156233, true, 13450),
("27764534RTB", 1, "Red", 2013, 211023, true, 10900);