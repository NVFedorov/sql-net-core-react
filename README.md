This project was bootstrapped with .NET Core 3.1 React Web Application template.

## Initialize database
Create a new database named ```TestData``` in your SQL Server and run the ```init-database.sql``` script.

## Tasks
### Task 1

The stored procedure created for task 1 is ```QUERY_PRODUCTS```. The input parameter is the query type which matches the URL from task 2. 

### Task 2
The client application is <b>bootstrapped</b>, implying that there is some redundand code I didn't remove.

## Assumptions
1. I <b>DID NOT</b> move the DAL layer into a separate project <b><i>on purpose</i></b>. Normally I would do that, but it's a small project so there is no point to complicate it.
2. I assumed that one role may have access to several menu buttons. I assigned the buttons visibility the following way to demonstrate that:
  - Analyst -> Popular
  - Manager -> Relevant
  - Director -> Popular, Relevant, Top 5