video link: https://youtu.be/oT_ev6R_2jA


# Video Game Parlour Database System

## Overview
This project involves designing and implementing a database system to manage sessions, staff, customers, games, consoles, and bookings for a video game parlour.

## Database Structure

### Tables and Attributes

- **SessionType**: SessionTypeID, SessionTypeName
- **Session**: SessionNumber, SessionDay, StartTime, EndTime, SessionTypeID, Floor, Price
- **Staff**: StaffID, StaffName
- **SessionStaff**: SessionNumber, StaffID, RoleName
- **Customer**: CustomerID, FirstName, Surname, Address, MembershipTypeID, JoinDate, DateOfBirth
- **MembershipType**: MembershipTypeID, MembershipTypeName, Fee
- **Booking**: BookingID, SessionNumber, CustomerID, BookingDate, FeePrePaid, Fee
- **Game**: GameID, GameName, PEGI
- **Machine**: MachineNumber, GameID, Year, Floor
- **Console**: ConsoleID, ConsoleName
- **GameConsole**: GameID, ConsoleID, Quantity
- **SessionConsole**: SessionNumber, ConsoleID, Quantity, Date

## Normalization
All tables are normalized up to the Third Normal Form (3NF) to ensure data integrity and eliminate redundancy.

## Technologies Used
- MySQL
- SQL

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/username/video-game-parlour.git
