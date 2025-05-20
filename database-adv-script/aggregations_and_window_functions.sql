-- ================================================
-- Project: SQL Aggregation and Window Function Use
-- Author: Ibiniyi Timothy
-- Description: Count bookings per user and rank properties
-- ================================================

-- 1. Total Number of Bookings Made by Each User
SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM 
    bookings
GROUP BY 
    user_id;

-- ================================================

-- 2. Rank Properties Based on Total Number of Bookings
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM 
    bookings
GROUP BY 
    property_id;

