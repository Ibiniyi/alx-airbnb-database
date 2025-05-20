Measure Performance with EXPLAIN
Before Adding Indexes
Run your query like this:

sql
Copy
Edit
EXPLAIN
SELECT 
    property_id,
    COUNT(*) 
FROM 
    bookings
GROUP BY 
    property_id;
Note the query plan — you’ll likely see sequential scans (Seq Scan) if no indexes exist.

After Adding Indexes
Re-run:

sql
Copy
Edit
EXPLAIN
SELECT 
    property_id,
    COUNT(*) 
FROM 
    bookings
GROUP BY 
    property_id;
This time, you should see Index Scan or Bitmap Index Scan, showing the query uses the index and runs faster (especially on large data).
