# Analysis_of_a_banking_system.sql
Denormalized table containing customer behavioral indicators


Bank System Analysis

Description:
This project focuses on analyzing a bank system by extracting behavioral indicators from transactional data and product ownership. The objective is to create feature sets for potential supervised machine learning models.

The project utilizes a MySQL database consisting of the following tables:

1. Customer (cliente): Contains customer information such as customer ID, name, surname, and date of birth.
2. Account (conto): Stores account details including account ID, customer ID, and account type ID.
3. Account Type (tipo_conto): Defines different types of accounts with their respective IDs and descriptions.
4. Transaction Type (tipo_transazione): Defines various transaction types with their IDs, descriptions, and signs.
5. Transactions (transazioni): Stores transactional data including date, transaction type ID, amount, and account ID.

To create the denormalized table for behavioral analysis, the following indicators are calculated for each customer:

1. Age
2. Number of outgoing transactions across all accounts
3. Number of incoming transactions across all accounts
4. Total outgoing amount across all accounts
5. Total incoming amount across all accounts
6. Total number of accounts owned by the customer
7. Number of accounts owned by type (an indicator for each account type)
8. Number of outgoing transactions by type (an indicator for each transaction type)
9. Number of incoming transactions by type (an indicator for each transaction type)
10. Total outgoing amount by account type (an indicator for each account type)
11. Total incoming amount by account type (an indicator for each account type)

The resulting denormalized table, named "AnalisiSistemaBancario" in the MySQL database, provides a consolidated view of customer behavioral indicators, facilitating further analysis and modeling tasks.
