# SQL JOIN Examples

This project contains three SQL queries demonstrating how to use different types of JOINs (`INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`) to retrieve data from a sample Airbnb-like database.

## 🗂 Tables Assumed

- `users`: Contains user information.
- `bookings`: Contains booking records made by users.
- `properties`: Contains property listings.
- `reviews`: Contains reviews written for properties.

---

## 🔍 Query Descriptions

### 1. INNER JOIN: Bookings and Users
This query retrieves all bookings **with the users who made them**. Only bookings that have a matching user are shown.

```sql
SELECT 
    bookings.*,
    users.*
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

