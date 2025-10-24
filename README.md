# Snowflake Data Engineering

Notes and codes written during the Snowflake Data Engineering course, from Coursera.

https://www.coursera.org/professional-certificates/snowflake-data-engineering

## Module 01

- Snowsight
- SQL Worksheets
- Virtual warehouses
- Databases
 - Schemas
 - Tables
 - Views
    - Store queries
 - Materialized Views
    - Automarically run when the underlying table they are based on is updated
- Semi-structred data
- Snowflake's architecture

## Module 02

- Tables
  - Permanent tables
    - CREATE TABLE
  - Transient tables
    - Lasts until they're dropped
  - Temporary tables
    - Persisits as long as the session is active

### Clone

When we clone an object, we're creating a new version of it that is zero copy. It means that at the time we create the clone, the clone relies on the same stored data, the same micro partition as the object we copied. Obce we start making changes to the clone, the Snowflake keeps track of the changes made to the clone.

### RBAC

Main Concepts

- Secure objects
- Privileges
- Roles
- Users

Role `accountadmin`. Is one of the six main roles that automatically exist in every account. We never had to create it.

Privileges - ability to do something can be assigned to roles.
Those roles can be assigned to users.

We can also assign roles to other roles.

Automatically generated roles

Org admin
Security admin - `securityadmin`
User admin     - `useradmin`
Sys admin      - `sysadmin`
Public         - `public`
