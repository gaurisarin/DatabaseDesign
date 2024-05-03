DROP DATABASE IF EXISTS `GRL`;
CREATE DATABASE IF NOT EXISTS `GRL`;

USE `GRL`;
DROP TABLE IF EXISTS `Branch`;
CREATE TABLE `Branch`
(
    `BranchID` INT NOT NULL,
    `Name` NVARCHAR(160),
    `Address` NVARCHAR(160),
    `Phone Number` INT NOT NULL,
    CONSTRAINT `PK_Branch` PRIMARY KEY  (`BranchID`)
);
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`
(
    `AccountID` INT NOT NULL,
    `DateOpened` INT NOT NULL,
    `CurrentValue` INT NOT NULL,
    `TotalMoney` INT NOT NULL,
    `CollectionStocks` INT NOT NULL,
    CONSTRAINT `PK_Account` PRIMARY KEY  (`AccountID`)
);

DROP TABLE IF EXISTS `Broker`;
CREATE TABLE `Broker`
(
    `EmployeeID` INT NOT NULL,
    `BranchID` INT NOT NULL,
    `AccountID` INT NOT NULL,
    `EmployeeName` NVARCHAR(160),
    `HiringDate` INT NOT NULL,
    `TerminationDate` INT NOT NULL,
    `TelephoneEXtension` INT NOT NULL,
    `MobileNumber` INT NOT NULL,
    `isManager` Boolean,
    CONSTRAINT `PK_Broker` PRIMARY KEY  (`EmployeeID`),
    CONSTRAINT `FK_Employee` FOREIGN KEY (`BranchID`) REFERENCES `Branch`(`BranchID`)
    On update CASCADE On delete CASCADE,
    CONSTRAINT `FK_Manages` FOREIGN KEY (`AccountID`) REFERENCES `Account`(`AccountID`) 
    On update CASCADE On delete CASCADE

);

CREATE TABLE `Client`
(
    `ClientID` INT NOT NULL,
    `AccountID` INT NOT NULL,
    `Name` NVARCHAR(160),
    `DateofBirth` INT NOT NULL,
    `TelephoneNumber` INT NOT NULL,
    `Description` NVARCHAR(160),
    CONSTRAINT `PK_Client` PRIMARY KEY  (`ClientID`),
    CONSTRAINT `FK_Owns` FOREIGN KEY (`AccountID`) REFERENCES `Account`(`AccountID`) 
    On update CASCADE On delete CASCADE
);

CREATE TABLE `PubliclyTradedCompany`
(
    `Ticker` INT NOT NULL,
    `Name` NVARCHAR(160),
    `Current Price` INT NOT NULL,
    `Number of Shares` float NOT NULL,
    CONSTRAINT `PK_PubliclyTradedCompany` PRIMARY KEY  (`Ticker`)
    
);


DROP TABLE IF EXISTS `StockShares`;
CREATE TABLE `StockShares`
(
    `StockID` INT NOT NULL,
    `AccountID` INT NOT NULL,
    `Ticker` INT NOT NULL,
    `DateofPurchase` INT NOT NULL,
    `BrokerID` INT NOT NULL,
    `NumberPurchesed` INT NOT NULL,
    `PurchasePrice` INT NOT NULL,
    CONSTRAINT `PK_StockShares` PRIMARY KEY  (`StockID`),
    CONSTRAINT `FK_Contains` FOREIGN KEY (`AccountID`) REFERENCES `Account`(`AccountID`) 
    On update CASCADE On delete CASCADE,
    CONSTRAINT `FK_StockCompany` FOREIGN KEY (`Ticker`) REFERENCES `PubliclyTradedCompany`(`Ticker`) 
    On update CASCADE On delete CASCADE
    );
    