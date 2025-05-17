Schema Design
1. User Table (User)
Stores information about registered users.

user_id → Unique identifier for each user (Primary Key).

email → Must be unique (Unique Constraint).

role → Defines whether the user is a guest, host, or admin.

2. Property Table (Property)
Represents listings that hosts can rent out.

property_id → Unique property identifier.

host_id → Foreign key linking the property to a host.

pricepernight → Cost per night.

3. Booking Table (Booking)
Tracks reservations made by users for properties.

booking_id → Unique booking identifier.

property_id → Foreign key linking to the property.

user_id → Foreign key linking to the user.

status → Booking status (pending, confirmed, canceled).

4. Payment Table (Payment)
Stores payment details for bookings.

payment_id → Unique identifier for each payment.

booking_id → Links payment to a booking.

payment_method → Enum (credit card, PayPal, Stripe).

5. Review Table (Review)
Stores user feedback on properties.

review_id → Unique identifier for each review.

rating → Must be between 1 to 5 (Check Constraint).

comment → Review text.

6. Message Table (Message)
Handles communication between users.

message_id → Unique identifier for each message.

sender_id → Foreign key linking to the sender.

recipient_id → Foreign key linking to the recipient.
