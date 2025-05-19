-- 1. INNER JOIN: Get all bookings and the users who made those bookings
SELECT 
    bookings.*,
    users.*
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

-- 2. LEFT JOIN: Get all properties and their reviews, including properties with no reviews
SELECT 
    properties.*,
    reviews.*
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;

-- 3. FULL OUTER JOIN: Get all users and all bookings, even if not connected
-- If your database doesn't support FULL OUTER JOIN (like MySQL), use the UNION version below
SELECT 
    users.*,
    bookings.*
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;

-- Alternate FULL OUTER JOIN version using UNION (for MySQL or similar)
-- Uncomment the lines below if your DB doesn't support FULL OUTER JOIN

-- SELECT 
--     users.*,
--     bookings.*
-- FROM 
--     users
-- LEFT JOIN 
--     bookings ON users.id = bookings.user_id
-- 
-- UNION
-- 
-- SELECT 
--     users.*,
--     bookings.*
-- FROM 
--     users
-- RIGHT JOIN 
--     bookings ON users.id = bookings.user_id;

