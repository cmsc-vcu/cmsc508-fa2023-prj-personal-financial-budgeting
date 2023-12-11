# deliver7-ddl.sql
# CMSC 508 - Group 44

# Section 1
# Drops all tables.

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS actuals;
DROP TABLE IF EXISTS budgets;
DROP TABLE IF EXISTS users;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create users( userID, budget, name, transaction )

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    userID VARCHAR(255) NOT NULL,
    budget VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    transaction VARCHAR(255),
    PRIMARY KEY (userID)
);

# Section 3
# Populate users

INSERT INTO users (userID, budget, name, transaction) VALUES
    ('U1', 'B1, B2', 'John Doe', 'T1, T2, T3'),
    ('U2', 'B3', 'Jane Smith', 'T4, T5'),
    ('U3', 'B4, B5', 'Robert Johnson', 'T6, T7'),
    ('U4', 'B6, B7', 'Emily Brown', 'T8, T9'),
    ('U5', 'B8, B9', 'Michael Lee', 'T10, T11'),
    ('U6', 'B10', 'Phillip Castor', 'T12, T13, T14, T15'),
    ('U7', 'B11, B12, B13', 'Amelia Turner', 'T16, T17, T18, T19, T20, T21, T22, T23'),
    ('U8', 'B14', 'Benjamin Martinez', 'T24, T25, T26, T27, T28, T29'),
    ('U9', 'B15', 'Chloe Murphy', ''),
    ('U10', 'B16, B17, B18', 'Dylan Anderson', 'T30, T31, T32, T33, T34'),
    ('U11', 'B19, B20', 'Emma Bennett', 'T35, T36, T37, T38, T39, T40'),
    ('U12', 'B21, B22, B23', 'Gavin Parker', 'T41, T42, T43, T44, T45'),
    ('U13', 'B24', 'Isabella Ross', 'T46, T47, T48, T49, T50'),
    ('U14', 'B25', 'Jackson Mitchell', 'T51, T52'),
    ('U15', '', 'Olivia Jenkins', '');

# Section 4
# Create budgets( budgetID, priceGain, source, actual, timePeriod )

DROP TABLE IF EXISTS budgets;
CREATE TABLE budgets (
    budgetID VARCHAR(255) NOT NULL,
    priceGain DOUBLE(10, 2),
    source VARCHAR(255) NOT NULL,
    actual VARCHAR(255),
    timePeriod VARCHAR(255),
    PRIMARY KEY (budgetID)
);

# Section 5
# Populate budgets

INSERT INTO budgets (budgetID, priceGain, source, actual, timePeriod) VALUES
    ('B1', 3000.50, 'Job', 'A1, A2', '2023-01'),
    ('B2', 150.00, 'Gifts', 'A3, A4', '2023-02'),
    ('B3', 500.75, 'Side Hustle', 'A5, A6', '2023-03'),
    ('B4', 1200.25, 'Entertainment', 'A7, A8', '2023-01'),
    ('B5', 600.00, 'Transportation', 'A9, A10', '2023-02'),
    ('B6', 2500.00, 'Necessities', 'A11, A12', '2023-03'),
    ('B7', 750.50, 'Medical', 'A13, A14', '2023-01'),
    ('B8', 400.75, 'Job', 'A15, A16', '2023-02'),
    ('B9', 100.00, 'Entertainment', 'A17, A18', '2023-03'),
    ('B10', 150.25, 'Entertainment', 'A19, A20', '2023-03'),
    ('B11', 75.50, 'Transportation', 'A21, A22', '2023-04'),
    ('B12', 200.00, 'Necessities', 'A23, A24', '2023-05'),
    ('B13', 30.00, 'Medical', 'A25, A26', '2023-06'),
    ('B14', 120.75, 'Job', 'A27, A28', '2023-07'),
    ('B15', 50.50, 'Gifts', 'A29, A30', '2023-08'),
    ('B16', 80.00, 'Side Hustle', 'A31, A32', '2023-09'),
    ('B17', 95.25, 'Other', 'A33, A34', '2023-10'),
    ('B18', 110.50, 'Entertainment', 'A35, A36', '2023-11'),
    ('B19', 45.75, 'Transportation', 'A37, A38', '2023-12'),
    ('B20', 180.00, 'Necessities', 'A39, A40', '2024-01'),
    ('B21', 25.00, 'Medical', 'A41, A42', '2024-02'),
    ('B22', 135.75, 'Job', 'A43, A44', '2024-03'),
    ('B23', 60.50, 'Gifts', 'A45, A46', '2024-04'),
    ('B24', 75.00, 'Side Hustle', 'A47, A48', '2024-05'),
    ('B25', 90.25, 'Other', 'A49, A50', '2024-06');


# Section 6
# Create actuals( actualID, transaction, budget, timePeriod )

DROP TABLE IF EXISTS actuals;
CREATE TABLE actuals (
    actualID VARCHAR(255) NOT NULL,
    transaction VARCHAR(255),
    budget VARCHAR(255),
    timePeriod VARCHAR(255),
    PRIMARY KEY (actualID)
);

# Section 7
# Populate actuals

INSERT INTO actuals (actualID, transaction, budget, timePeriod) VALUES
    ('A1', 'T1, T2', 'B1', '2023-01'),
    ('A2', 'T3, T4', 'B2', '2023-02'),
    ('A3', 'T5, T6', 'B3', '2023-03'),
    ('A4', 'T7, T8', 'B4', '2023-01'),
    ('A5', 'T9, T10', 'B5', '2023-02'),
    ('A6', 'T11, T12', 'B6', '2023-03'),
    ('A7', 'T13, T14', 'B7', '2023-01'),
    ('A8', 'T15, T16', 'B8', '2023-02'),
    ('A19', 'T12, T13', 'B10', '2023-03'),
    ('A20', 'T14, T15', 'B10', '2023-03'),
    ('A21', 'T16, T17, T18', 'B11', '2023-04'),
    ('A22', '', 'B11', '2023-04'),
    ('A23', 'T19', 'B12', '2023-05'),
    ('A24', 'T20, T21', 'B12', '2023-05'),
    ('A25', 'T22', 'B13', '2023-06'),
    ('A26', 'T23', 'B13', '2023-06'),
    ('A27', 'T24,', 'B14', '2023-07'),
    ('A28', 'T25, T26, T27, T28, T29', 'B14', '2023-07'),
    ('A29', '', 'B15', '2023-08'),
    ('A30', '', 'B15', '2023-08'),
    ('A31', 'T30', 'B16', '2023-09'),
    ('A32', '', 'B16', '2023-09'),
    ('A33', 'T31', 'B17', '2023-10'),
    ('A34', 'T32', 'B17', '2023-10'),
    ('A35', '', 'B18', '2023-11'),
    ('A36', 'T33, T34', 'B18', '2023-11'),
    ('A37', 'T35, T36', 'B19', '2023-12'),
    ('A38', 'T37, T38', 'B19', '2023-12'),
    ('A39', 'T39, T40', 'B20', '2024-01'),
    ('A40', '', 'B20', '2024-01'),
    ('A41', '', 'B21', '2024-02'),
    ('A42', 'T41', 'B21', '2024-02'),
    ('A43', 'T42', 'B22', '2024-03'),
    ('A44', 'T43', 'B22', '2024-03'),
    ('A45', '', 'B23', '2024-04'),
    ('A46', 'T44, T45', 'B23', '2024-04'),
    ('A47', 'T46, T47', 'B24', '2024-05'),
    ('A48', 'T48, T49, T50', 'B24', '2024-05'),
    ('A49', 'T51', 'B25', '2024-06'),
    ('A50', 'T52', 'B25', '2024-06');

# Section 8
# Create transactions( transID, priceGain, source, actual, date )

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
    transID VARCHAR(255) NOT NULL,
    priceGain DOUBLE(10, 2),
    source VARCHAR(255) NOT NULL,
    actual VARCHAR(255),
    date VARCHAR(255),
    PRIMARY KEY (transID)
);

# Section 9
# Populate transactions

INSERT INTO transactions (transID, priceGain, source, actual, date) VALUES
    ('T1', 100.50, 'Groceries', 'A1', '2023-01-01'),
    ('T2', 50.00, 'Entertainment', 'A2', '2023-02-01'),
    ('T3', 75.25, 'Transportation', 'A3', '2023-03-01'),
    ('T4', 120.00, 'Hobbies', 'A4', '2023-01-02'),
    ('T5', 40.50, 'Groceries', 'A5', '2023-02-02'),
    ('T6', 20.00, 'Entertainment', 'A6', '2023-03-02'),
    ('T7', 150.75, 'Medical', 'A7', '2023-01-03'),
    ('T8', 300.00, 'Groceries', 'A8', '2023-02-03'),
    ('T9', 50.50, 'Hobbies', 'A9', '2023-03-03'),
    ('T10', 75.25, 'Entertainment', 'A19', '2023-03-03'),
    ('T11', 30.75, 'Transportation', 'A19', '2023-03-03'),
    ('T12', 120.00, 'Entertainment', 'A20', '2023-03-03'),
    ('T13', 45.50, 'Transportation', 'A20', '2023-03-03'),
    ('T14', 100.25, 'Necessities', 'A21', '2023-04-03'),
    ('T15', 60.00, 'Entertainment', 'A21', '2023-04-03'),
    ('T16', 85.75, 'Job', 'A22', '2023-04-03'),
    ('T17', 20.50, 'Job', 'A22', '2023-04-03'),
    ('T18', 45.00, 'Gifts', 'A22', '2023-04-03'),
    ('T19', 80.25, 'Side Hustle', 'A23', '2023-05-03'),
    ('T20', 25.50, 'Medical', 'A24', '2023-05-03'),
    ('T21', 110.75, 'Gifts', 'A24', '2023-05-03'),
    ('T22', 30.00, 'Entertainment', 'A25', '2023-06-03'),
    ('T23', 55.25, 'Medical', 'A26', '2023-06-03'),
    ('T24', 70.50, 'Gifts', 'A27', '2023-07-03'),
    ('T25', 90.25, 'Side Hustle', 'A28', '2023-07-03'),
    ('T26', 40.75, 'Job', 'A28', '2023-07-03'),
    ('T27', 65.00, 'Job', 'A28', '2023-07-03'),
    ('T28', 95.75, 'Job', 'A28', '2023-07-03'),
    ('T29', 35.50, 'Job', 'A28', '2023-07-03'),
    ('T30', 60.75, 'Gifts', 'A28', '2023-07-03'),
    ('T31', 75.00, 'Side Hustle', 'A29', '2023-08-03'),
    ('T32', 85.25, 'Other', 'A29', '2023-08-03'),
    ('T33', 110.50, 'Entertainment', 'A31', '2023-09-03'),
    ('T34', 45.75, 'Transportation', 'A31', '2023-09-03'),
    ('T35', 180.00, 'Necessities', 'A36', '2023-11-03'),
    ('T36', 25.00, 'Medical', 'A36', '2023-11-03'),
    ('T37', 135.75, 'Job', 'A36', '2023-11-03'),
    ('T38', 60.50, 'Gifts', 'A36', '2023-11-03'),
    ('T39', 75.00, 'Side Hustle', 'A37', '2023-12-03'),
    ('T40', 90.25, 'Other', 'A38', '2023-12-03'),
    ('T41', 110.50, 'Entertainment', 'A39', '2024-01-03'),
    ('T42', 45.75, 'Transportation', 'A40', '2024-01-03'),
    ('T43', 180.00, 'Necessities', 'A41', '2024-02-03'),
    ('T44', 25.00, 'Medical', 'A42', '2024-02-03'),
    ('T45', 135.75, 'Job', 'A43', '2024-03-03'),
    ('T46', 60.50, 'Gifts', 'A44', '2024-03-03'),
    ('T47', 75.00, 'Side Hustle', 'A45', '2024-04-03'),
    ('T48', 90.25, 'Other', 'A46', '2024-04-03'),
    ('T49', 110.50, 'Entertainment', 'A47', '2024-05-03'),
    ('T50', 45.75, 'Transportation', 'A48', '2024-05-03'),
    ('T51', 90.00, 'Other', 'A49', '2024-06-03'),
    ('T52', 50.50, 'Hobbies', 'A50', '2024-06-03');
