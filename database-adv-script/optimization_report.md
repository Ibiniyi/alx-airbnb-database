Step 1: Run EXPLAIN on the Query
Use the following command in your SQL tool:

sql
Copy
Edit
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.user_id,
    b.property_id,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id;
✅ Step 2: Understand the EXPLAIN Output
You’ll get a query plan like this (simplified):

pgsql
Copy
Edit
Nested Loop  
  -> Hash Join  
       -> Seq Scan on bookings  
       -> Hash  
            -> Seq Scan on users  
  -> Nested Loop  
       -> Index Scan on properties  
       -> Index Scan on payments
🔍 Performance Bottlenecks to Watch For:
Sign in Output	What It Means	Optimization Tip
Seq Scan on bookings	Full scan on large table	Create index on user_id, property_id
Seq Scan on users	Full scan on user table	Index id in users
Nested Loop joins	May be slow on large datasets	Use Hash Join or Merge Join if better
No index used on joins	Look for Index Scan instead of Seq Scan	Add indexes on foreign key columns

✅ Suggested Indexes (if not already created)
If your EXPLAIN plan shows many sequential scans, create these indexes:

sql
Copy
Edit
-- Optimize join conditions
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- These are often primary keys, but index explicitly if not
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_properties_id ON properties(id);
🧪 After Adding Indexes
Re-run EXPLAIN ANALYZE to check for:

Index Scan or Bitmap Index Scan (✅ good)

Lower cost numbers (like Total runtime)

Reduced loops and row counts


