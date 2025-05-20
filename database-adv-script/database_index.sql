-- ==========================================
-- File: database_index.sql
-- Description: Create indexes on high-usage columns
-- ==========================================

-- Index on users.id (Primary Key, usually indexed by default)
CREATE INDEX IF NOT EXISTS idx_users_id ON users(id);

-- Index on bookings.user_id
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);

-- Index on properties.id (Primary Key, usually indexed by default)
CREATE INDEX IF NOT EXISTS idx_properties_id ON properties(id);

-- Index on reviews.property_id
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);

