# Database Normalization for Airbnb Clone

## Objective
To ensure the database design follows the principles of normalization and reaches **Third Normal Form (3NF)** to reduce redundancy and improve data integrity.

---

## First Normal Form (1NF)

- All attributes contain atomic values (no arrays or lists).
- Each record is unique and has a primary key.
- No repeating groups or multi-valued fields.

**Status**: ✅ All tables meet 1NF.

---

## Second Normal Form (2NF)

- The database is already in 1NF.
- No partial dependencies exist (all non-key columns depend on the full primary key).
- All tables use a single-column primary key, so no partial dependencies are possible.

**Status**: ✅ All tables meet 2NF.

---

## Third Normal Form (3NF)

- The database is already in 2NF.
- No transitive dependencies exist (non-key attributes do not depend on other non-key attributes).
- Derived data like `total_price` is stored for performance but documented as derived from property price and stay length.

**Status**: ✅ All tables meet 3NF.

---

## Notes

- All foreign key relationships are valid and help avoid redundancy.
- `total_price` in the Booking table is a calculated value (`pricepernight * number of nights`) and is stored intentionally for performance.
`
