ii# Airbnb Database Requirements

## Entities and Attributes

### 1. User
- user_id (UUID, Primary Key, Indexed)
- first_name (VARCHAR, NOT NULL)
- last_name (VARCHAR, NOT NULL)
- email (VARCHAR, UNIQUE, NOT NULL)
- password_hash (VARCHAR, NOT NULL)
- phone_number (VARCHAR, NULL)
- role (ENUM: guest, host, admin, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 2. Property
- property_id (UUID, Primary Key, Indexed)
- host_id (UUID, Foreign Key → User(user_id))
- name (VARCHAR, NOT NULL)
- description (TEXT, NOT NULL)
- location (VARCHAR, NOT NULL)
- pricepernight (DECIMAL, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### 3. Booking
- booking_id (UUID, Primary Key, Indexed)
- property_id (UUID, Foreign Key → Property(property_id))
- user_id (UUID, Foreign Key → User(user_id))
- start_date (DATE, NOT NULL)
- end_date (DATE, NOT NULL)
- total_price (DECIMAL, NOT NULL)
- status (ENUM: pending, confirmed, canceled, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 4. Payment
- payment_id (UUID, Primary Key, Indexed)
- booking_id (UUID, Foreign Key → Booking(booking_id))
- amount (DECIMAL, NOT NULL)
- payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

### 5. Review
- review_id (UUID, Primary Key, Indexed)
- property_id (UUID, Foreign Key → Property(property_id))
- user_id (UUID, Foreign Key → User(user_id))
- rating (INTEGER, CHECK rating >= 1 AND rating <= 5, NOT NULL)
- comment (TEXT, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 6. Message
- message_id (UUID, Primary Key, Indexed)
- sender_id (UUID, Foreign Key → User(user_id))
- recipient_id (UUID, Foreign Key → User(user_id))
- message_body (TEXT, NOT NULL)
- sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Relationships
- A **User** can host many **Properties** (1:N)
- A **User** can make many **Bookings** (1:N)
- A **Booking** is for one **Property** and made by one **User**
- A **Booking** has one **Payment** (1:1)
- A **User** can send and receive many **Messages** (N:N)
- A **User** can leave many **Reviews** on **Properties** (N:N)
- A **Property** can have many **Reviews** (1:N)

---

## Constraints
- **Unique**: `email` in User table
- **NOT NULL**: for required fields
- **ENUMs**: roles, booking status, payment method
- **CHECK**: rating must be between 1 and 5

---

## Indexing
- **Primary Keys** are indexed automatically
- Additional Indexes:
  - `email` in User
  - `property_id` in Property and Booking
  - `booking_id` in Booking and Payment

