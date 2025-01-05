# Bank_Application_JSP

This is a **web-based banking application** that allows users to manage core account operations such as **deposit**, **withdrawal**, and **fund transfers** between users. The application updates account balances in real-time, provides options to deactivate accounts, and uses **HTML**, **CSS**, **JSP**, **JDBC**, and **SQL** for its development. It is deployed on the **Apache Tomcat** server to provide a seamless banking experience.

---

## Features

- **Deposit Funds**: Users can deposit money into their bank accounts. The application updates the account balance instantly.
- **Withdraw Funds**: Users can withdraw money from their bank accounts, and the balance is updated in real-time.
- **Fund Transfer**: Users can transfer funds to other users' accounts within the system. The balance of both sender and recipient is updated immediately.
- **Account Deactivation**: Users have the option to deactivate their accounts, which disables any further operations (deposits, withdrawals, or transfers).
- **Real-time Balance Updates**: All account operations reflect changes in balance in real-time, ensuring users always see the most accurate account information.
- **Responsive Interface**: The application features a user-friendly and responsive design built with **HTML** and **CSS**, ensuring a smooth experience across different devices.

---

## Tech Stack

- **Frontend**:
  - **HTML**: Provides the structure for the web pages.
  - **CSS**: Used for styling the user interface and creating a responsive layout.
  - **JSP (JavaServer Pages)**: Handles dynamic content generation and interaction with backend logic.
  
- **Backend**:
  - **JDBC (Java Database Connectivity)**: Enables communication with the database for handling user transactions (deposits, withdrawals, transfers, etc.).
  
- **Database**:
  - **SQL (MySQL or similar)**: Stores user information, transaction details, and account balances.

- **Server**:
  - **Apache Tomcat**: A widely used Java servlet container that hosts the application.

---

## Installation and Setup

### Prerequisites

Before you can set up the application, make sure you have the following tools installed:

- **Apache Tomcat**: To run the application on a Java servlet container.
- **JDK 1.8 or higher**: For compiling and running the Java components of the application.
- **MySQL** (or another relational database): For storing and managing users' account information and transactions.
- **IDE (e.g., Eclipse, IntelliJ IDEA)**: For writing, editing, and deploying the project.

