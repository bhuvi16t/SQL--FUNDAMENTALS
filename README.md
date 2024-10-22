# SQL--FUNDAMENTALS
SQL (Structured Query Language) is the backbone of interacting with databases. It’s a powerful language that allows you to retrieve, manipulate, and manage data efficiently. Here's a simple breakdown of the key SQL fundamentals you should know:


What are Databases?
A Database is a shared collection of logically 
related data and description of these data, 
designed to meet the information needs ofan 
organization


Data Storage : A database is used to store large 
amounts of structured data,
making it easily accessible, searchable, and 
retrievable.


Data Analysis : A database can be used to 
perform complex data analysis,
generate reports, and provide insights into the 
data.


Record Keeping : A database is often used to 
keep track of important records,
such as financial transactions, customer 
information, and inventory levels.
Web Applications: Databases are an essential 
component of many web
applications, providing dynamic content and user 
management.



➔ In Database basically we do the most 4 
common operation 
 
 CRUD 
Create retrieved Update delete
4. Properties of an Ideal Database
1. Integrity → accuracy + consistency
2. Availability → 24/7 Available 
3. Security → only access by authorized person 
4. Independent of Application : Database should be 
same for webapp And mobile App
5. Concurrency : Database should be accessible for 
more than person at a same time.
5. Types of Databases
1. Relational Databases -
Also known as SQL databases, these databases use a 
relational model to organize data into tables with rows 
and columns.
2. NoSQL Databases -
These databases are designed to handle large amounts 
of unstructured or semi-structured data, such as 
documents, images, or videos. (MongoDB)
 3. Column Databases -
These databases store data in columns rather than 
rows, making them well-suited for data warehousing 
and analytical applications. (Amazon Redshift,Google 
BigQuery)
4. Graph Databases -
These databases are used to store and query graphstructured data, such as
social network connections or recommendation 
systems. (Neo4j, Amazon
Neptune)
5. Key-value databases -
These databases store data as a collection of keys and 
values, making them
well-suited for caching and simple data storage needs 
(Redis and Amazon
DynamoDB)
 Relational Databases
Also known as SQL databases, these databases use 
a relational model
to organize data into tables with rows and 
columns.
7. What is a DBMS
• A database management system (DBMS) is a 
software system that provides the interfaces 
and tools needed to store, organize, and 
manage data in a database. 
• A DBMS acts as an intermediary between the 
database and the applications or users
• that access the data stored in the database.
8. Core Functionalities of a DBMS
Functions of DBMS
Data Management - Store, retrieve and modify 
data
Integrity - Maintain accuracy of data
Concurrency - Simultaneous data access for 
multiple users
Transaction - Modification to database must either 
be successful or
must not happen at all
Security - Access to authorized users only
Utilities - Data import/export, user management, 
backup, logging
9.Practical – you can use Mysql or Xampp
10. Database Keys
A key in a database is an attribute or a set of attributes 
that uniquely identifies a
tuple (row) in a table. Keys play a crucial role in ensuring 
the integrity and
reliability of a database by enforcing unique constraints 
on the data and
establishing relationships between tables.
1. Super Key -
A Super key is a combination of columns that uniquely 
identifies any row
within a relational database management system 
(RDBMS) table
2. Candidate key -
A candidate key is a minimal Super key, meaning it has 
no redundant
attributes. In other words, it's the smallest set of 
attributes that can be used to
uniquely identify a tuple (row) in the table
3. Primary Key -
A primary key is a unique identifier for each tuple in a 
table. There can only be
one primary key in a table, and it cannot contain null 
values.
4. Alternate Key -
An alternate key is a candidate key that is not used as 
the primary key.
5. Composite Key -
A composite key is a primary key that is made up of two 
or more attributes.
Composite keys are used when a single attribute is not 
sufficient to uniquely
identify a tuple in a table.
6. Surrogate Key – custom primary key or key in 
majboori.
7. Foreign Key -
A foreign key is a primary key from one table that is used 
to establish a
relationship with another table.
11. Cardinality of Relationships
Cardinality in database relationships refers to the number 
of occurrences of an
entity in a relationship with another entity. Cardinality 
defines the number of
instances of one entity that can be associated with a 
single instance of the related
entity.
Examples
1. Person -> Driving License Number
2. Student -> college branch
3. Restaurants -> orders
4. Restaurants -> menu
5. Students -> courses
12. Drawbacks of Databases
• Complexity: Setting up and maintaining a database 
can be complex and time-consuming, especially for 
large and complex systems.
• Cost: The cost of setting up and maintaining a 
database, including hardware ,software, and 
personnel, can be high.
• Scalability: As the amount of data stored in a 
database grows, it can become more difficult to 
manage, leading to performance and scalability 
issues.
• Data Integrity: Ensuring the accuracy and 
consistency of data stored in a database can be a 
challenge, especially when multiple users are 
updating the data simultaneously.
• Security: Securing a database from unauthorized 
access and protecting sensitive information can be 
difficult, especially with the increasing threat of cyber 
attacks.
• Data Migration: Moving data from one database to 
another or upgrading to a new database can be a 
complex and time-consuming process.
