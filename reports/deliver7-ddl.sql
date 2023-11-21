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
    ('U5', 'B8, B9', 'Michael Lee', 'T10, T11');

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
    ('B9', 100.00, 'Entertainment', 'A17, A18', '2023-03');

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
    ('A9', 'T17, T18', 'B9', '2023-03');

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
    ('T9', 50.50, 'Hobbies', 'A9', '2023-03-03');
