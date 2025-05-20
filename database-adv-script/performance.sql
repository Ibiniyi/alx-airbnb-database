-- ===============================================
-- File: performance.sql
-- Description: Retrieve all bookings with user,
--              property, and payment details
-- ===============================================

SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.user_id,
    b.property_id,

    -- User Details
    u.first_name,
    u.last_name,
    u.email,

    -- Property Details
    p.name AS property_name,
    p.location,
    p.price_per_night,

    -- Payment Details
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status

FROM 
    bookings b

-- Join with users table
JOIN users u ON b.user_id = u.id

-- Join with properties table
JOIN properties p ON b.property_id = p.id

-- Join with payments table
LEFT JOIN payments pay ON pay.booking_id = b.id;

