-- Create the database
CREATE DATABASE VideoGameParlourDB;

-- Use the newly created database
USE VideoGameParlourDB;

-- Create the MembershipType table
CREATE TABLE MembershipType (
    MembershipTypeID INT PRIMARY KEY,
    MembershipTypeName VARCHAR(50) NOT NULL,
    Fee DECIMAL(10, 2) NOT NULL
);

-- Insert data into the MembershipType table
INSERT INTO MembershipType (MembershipTypeID, MembershipTypeName, Fee) VALUES
(1, 'STANDARD', 1500),
(2, 'PREMIUM', 20000);

-- Create the SessionType table
CREATE TABLE SessionType (
    SessionTypeID INT PRIMARY KEY,
    SessionTypeName VARCHAR(50) NOT NULL
);

-- Insert data into the SessionType table
INSERT INTO SessionType (SessionTypeID, SessionTypeName) VALUES
(1, 'FREE'),
(2, 'SPECIAL');

-- Create the Staff table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100) NOT NULL
);

-- Insert data into the Staff table
INSERT INTO Staff (StaffID, StaffName) VALUES
(1, 'SAGAR ARYAL'),
(2, 'BIKESH KHAGDI'),
(3, 'SAROJ SAPKOTA'),
(4, 'JONATHAN SHRESTHA'),
(5, 'ROHAN CHAUDHARY'),
(6, 'RAJEEV KARMACHARYA');

-- Create the Session table
CREATE TABLE Session (
    SessionNumber INT PRIMARY KEY,
    SessionDay VARCHAR(20) NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    SessionTypeID INT NOT NULL,
    Floor INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SessionTypeID) REFERENCES SessionType(SessionTypeID)
);

-- Insert data into the Session table
INSERT INTO Session (SessionNumber, SessionDay, StartTime, EndTime, SessionTypeID, Floor, Price) VALUES
(1, 'SUNDAY', '09:00', '21:00', 1, 1, 1500),
(2, 'SUNDAY', '09:00', '21:00', 1, 2, 1000),
(3, 'SATURDAY', '09:00', '21:00', 1, 1, 1500),
(4, 'FRIDAY', '18:00', '22:00', 2, 2, 1000);

-- Create the SessionStaff table
CREATE TABLE SessionStaff (
    SessionNumber INT NOT NULL,
    StaffID INT NOT NULL,
    RoleName VARCHAR(50) NOT NULL,
    PRIMARY KEY (SessionNumber, StaffID),
    FOREIGN KEY (SessionNumber) REFERENCES Session(SessionNumber),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Insert data into the SessionStaff table
INSERT INTO SessionStaff (SessionNumber, StaffID, RoleName) VALUES
(1, 1, 'CAFE'),
(1, 2, 'MAINTENANCE'),
(1, 3, 'COUNTER'),
(2, 4, 'COUNTER'),
(2, 5, 'MAINTENANCE'),
(2, 6, 'CAFE');

-- Create the Game table
CREATE TABLE Game (
    GameID INT PRIMARY KEY,
    GameName VARCHAR(100) NOT NULL,
    PEGI VARCHAR(10)
);

-- Insert data into the Game table
INSERT INTO Game (GameID, GameName, PEGI) VALUES
(1, 'COC', NULL),
(2, 'GTA', NULL),
(3, 'SPIDERMAN', NULL),
(4, 'PUBG', NULL),
(5, 'ELDEN RING: SHADOW OF THE ERDTREE', 'PG'),
(6, 'FINAL FANTASY VII REBIRTH', 'PG'),
(7, 'DESTINY 2: THE FINAL SHAPE', 'PG'),
(8, 'TEKKEN 8', 'PG'),
(9, 'PERSONA 3 RELOAD', 'PG'),
(10, 'CAVERN OF DREAMS', '15');

-- Create the Machine table
CREATE TABLE Machine (
    MachineNumber INT PRIMARY KEY,
    GameID INT NOT NULL,
    Year INT NOT NULL,
    Floor INT NOT NULL,
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

-- Insert data into the Machine table
INSERT INTO Machine (MachineNumber, GameID, Year, Floor) VALUES
(23, 1, 2010, 1),
(123, 2, 2013, 1),
(45, 3, 2016, 2),
(1234, 4, 2004, 1);

-- Create the Console table
CREATE TABLE Console (
    ConsoleID INT PRIMARY KEY,
    ConsoleName VARCHAR(100) NOT NULL
);

-- Insert data into the Console table
INSERT INTO Console (ConsoleID, ConsoleName) VALUES
(1, 'XBOX 360'),
(2, 'PS3'),
(3, 'PS2'),
(4, 'NINTENDO 64'),
(5, 'NINTENDO SWITCH');

-- Create the GameConsole table
CREATE TABLE GameConsole (
    GameID INT NOT NULL,
    ConsoleID INT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (GameID, ConsoleID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID),
    FOREIGN KEY (ConsoleID) REFERENCES Console(ConsoleID)
);

-- Insert data into the GameConsole table
INSERT INTO GameConsole (GameID, ConsoleID, Quantity) VALUES
(5, 1, 3),
(6, 2, 1),
(7, 3, 2),
(8, 2, 1),
(9, 4, 1),
(10, 5, 1);

-- Create the SessionConsole table
CREATE TABLE SessionConsole (
    SessionNumber INT NOT NULL,
    ConsoleID INT NOT NULL,
    Quantity INT NOT NULL,
    Date DATE NOT NULL,
    PRIMARY KEY (SessionNumber, ConsoleID, Date),
    FOREIGN KEY (SessionNumber) REFERENCES Session(SessionNumber),
    FOREIGN KEY (ConsoleID) REFERENCES Console(ConsoleID)
);

-- Insert data into the SessionConsole table
INSERT INTO SessionConsole (SessionNumber, ConsoleID, Quantity, Date) VALUES
(1, 3, 2, '2024-07-22'),
(2, 2, 2, '2024-07-22');

-- Create the Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL,
    Address VARCHAR(200),
    MembershipTypeID INT,
    JoinDate DATE,
    DateOfBirth DATE NOT NULL,
    FOREIGN KEY (MembershipTypeID) REFERENCES MembershipType(MembershipTypeID)
);

-- Insert data into the Customer table
INSERT INTO Customer (CustomerID, FirstName, Surname, Address, MembershipTypeID, JoinDate, DateOfBirth) VALUES
(1, 'SAANVI', 'BHATTA', 'BANESHWOR, KATHMANDU', 1, '2024-01-01', '2015-03-01'),
(2, 'BILL', 'GATES', 'MAITIDEVI, KATHMANDU', 2, '2024-07-06', '2001-10-12'),
(3, 'ELON', 'MUSK', 'PUTALISADAK, KATHMANDU', 2, '2024-03-28', '2003-07-20'),
(4, 'KAMALA', 'HARRIS', 'KAPAN, KATHMANDU', 1, '2024-01-05', '1973-05-01'),
(5, 'JACK', 'MA', NULL, NULL, NULL, NULL),
(6, 'RISHI', 'SUNAK', NULL, NULL, NULL, NULL);

-- Create the updated Booking table with the Fee column
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    SessionNumber INT NOT NULL,
    CustomerID INT NOT NULL,
    BookingDate DATE NOT NULL,
    FeePrePaid CHAR(1) NOT NULL CHECK (FeePrePaid IN ('Y', 'N')),
    Fee DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SessionNumber) REFERENCES Session(SessionNumber),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert data into the Booking table
INSERT INTO Booking (BookingID, SessionNumber, CustomerID, BookingDate, FeePrePaid, Fee) VALUES
(1, 1, 1, '2024-07-22', 'N', 0), -- Membership Fee NA
(2, 1, 2, '2024-07-22', 'N', 1500),
(3, 1, 3, '2024-07-22', 'Y', 1000),
(4, 1, 5, '2024-08-25', 'N', 1500),
(5, 2, 4, '2024-07-22', 'N', 1000),
(6, 4, 6, '2024-07-05', 'Y', 1000);
