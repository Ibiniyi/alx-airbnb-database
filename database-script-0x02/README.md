Script Details
The script contains INSERT statements for the following tables:

1. User Table (User)
Adds multiple users including guests, hosts, and an admin.

Each user has attributes like user_id, first_name, last_name, email, and role.

2. Property Table (Property)
Populates listings with various property types (Beachfront Villa, Cozy Apartment, Mountain Retreat, Luxury Penthouse).

Properties are linked to hosts and include pricing information.

3. Booking Table (Booking)
Inserts multiple reservations for different properties.

Each booking tracks check-in/out dates and booking status (pending, confirmed, canceled).

4. Payment Table (Payment)
Records transactions made for bookings.

Supports multiple payment methods (credit card, PayPal, Stripe).

5. Review Table (Review)
Users leave reviews for properties.

Includes ratings (1-5) and comments describing experiences.

6. Message Table (Message)
Stores communication between users.

Tracks sender and recipient details.
