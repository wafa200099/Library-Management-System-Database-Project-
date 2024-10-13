# Library Management System Database Project

## Project Overview

This project involves designing and implementing a **Library Management System** using **Microsoft SQL Server**. The goal is to create a robust database to manage books, borrowers, and loans for a local library, with the ability to track borrowing trends and automate several processes such as borrower registration and overdue fee calculation.

### Key Features:
- Track books, borrowers, and loan records.
- Automatically calculate overdue fees.
- Stored procedures to streamline library operations.
- Complex SQL queries for insightful data analysis.
- Audit logging for changes in book status.

## Entity Relationship Model (ERM)

The system includes three main entities:
- **Books**: Tracks information about the library's books.
- **Borrowers**: Stores borrower details.
- **Loans**: Tracks the borrowing history of each book.

### ER Model
You can view the detailed ER model diagram in the repository's [ERD folder](./ERD).

## Database Schema

### Tables
1. **Books**
    - `BookID` (Primary Key)
    - `Title`
    - `Author`
    - `ISBN`
    - `PublishedDate`
    - `Genre`
    - `ShelfLocation`
    - `CurrentStatus` (Values: 'Available', 'Borrowed')

2. **Borrowers**
    - `BorrowerID` (Primary Key)
    - `FirstName`
    - `LastName`
    - `Email`
    - `DateOfBirth`
    - `MembershipDate`

3. **Loans**
    - `LoanID` (Primary Key)
    - `BookID` (Foreign Key)
    - `BorrowerID` (Foreign Key)
    - `DateBorrowed`
    - `DueDate`
    - `DateReturned` (Nullable)

### Sample SQL Scripts
The SQL scripts to create the schema and seed the database can be found in the [`sql` folder](./sql). These include:
- `create_tables.sql`: Script to create the Books, Borrowers, and Loans tables.
- `seed_data.sql`: DML script to populate the database with sample data (1000 books, 1000 borrowers, and 1000 loan records).

## Complex Queries and Procedures

This project includes several complex SQL queries and stored procedures for various tasks.

### Queries:
1. **List of Borrowed Books**: Retrieve all books borrowed by a specific borrower, including those currently unreturned.
2. **Active Borrowers with CTEs**: Identify borrowers who've borrowed 2 or more books but haven't returned any.
3. **Borrowing Frequency**: Rank borrowers based on borrowing frequency using window functions.
4. **Popular Genre Analysis**: Identify the most popular genre for a given month using joins and window functions.

### Stored Procedures and Functions:
1. **Add New Borrower** (`sp_AddNewBorrower`): Adds a new borrower to the system and checks for duplicate emails.
2. **Calculate Overdue Fees** (`fn_CalculateOverdueFees`): Computes overdue fees for a loan.
3. **Book Borrowing Frequency** (`fn_BookBorrowingFrequency`): Calculates how many times a book has been borrowed.
4. **Borrowed Books Report** (`sp_BorrowedBooksReport`): Generates a report of books borrowed within a specified date range.

### Trigger:
A trigger is implemented to log changes in a book's status (from 'Available' to 'Borrowed' or vice versa) into an `AuditLog` table, capturing the `BookID`, `StatusChange`, and `ChangeDate`.

## Installation and Setup

### Prerequisites:
- **Microsoft SQL Server**: Ensure you have SQL Server installed locally or on a cloud platform.
- **SQL Server Management Studio (SSMS)**: To run and manage SQL scripts.

### Steps:
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/library-management-system.git
