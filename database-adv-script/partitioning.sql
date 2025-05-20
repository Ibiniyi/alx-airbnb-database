-- ================================================
-- File: partitioning.sql
-- Description: Partition the bookings table by year
--              based on the start_date column
-- DB: PostgreSQL (supports native table partitioning)
-- ================================================

-- 1. Rename original table to keep the data
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create partitioned bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_date DATE NOT NULL,
    -- Add other columns here
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(id)
) PARTITION BY RANGE (start_date);

-- 3. Create yearly partitions
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. (Optional) Insert data from old table into new partitioned table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, booking_date)
SELECT id, user_id, property_id, start_date, end_date, booking_date
FROM bookings_old;

-- 5. (Optional) Drop old table if data is successfully migrated
-- DROP TABLE bookings_old;

