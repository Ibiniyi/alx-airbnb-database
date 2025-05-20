-- ==========================================
-- Project: Subquery Practice
-- Author: Ibiniyi Timothy
-- Description: Uses both non-correlated and correlated subqueries
-- ==========================================

-- 1. NON-CORRELATED SUBQUERY
-- Find all properties where the average rating is greater than 4.0

SELECT 
    p.*
FROM 
    properties p
WHERE 
    p.id IN (
        SELECT 
            r.property_id
        FROM 
            reviews r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    );

-- ==========================================

-- 2. CORRELATED SUBQUERY
-- Find all users who have made more than 3 bookings

SELECT 
    u.*
FROM 
    users u
WHERE 
    (
        SELECT 
            COUNT(*)
        FROM 
            bookings b
        WHERE 
            b.user_id = u.id
    ) > 3;

