
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('1e8a1f6e-df32-4b28-9e95-86d6c71d3a12', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_123', '1234567890', 'guest', NOW()),
('3f9c3b2e-ad44-4b1b-bc3d-40e5ea82e2a1', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_456', '0987654321', 'host', NOW()),
('5a2e42b4-c49f-44e6-bc8c-7635df0f7a9a', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password_789', NULL, 'admin', NOW()),
('7a9e1b3c-a715-4d34-823b-92ecf7d7b24e', 'Charlie', 'Brown', 'charlie.b@example.com', 'hashed_password_321', '9876543210', 'guest', NOW()),
('4f8b2c6d-b213-49a5-b5eb-71cf2d9e589f', 'David', 'Williams', 'david.w@example.com', 'hashed_password_654', '3456789012', 'host', NOW());

-- Populate Property Table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('abc123', '3f9c3b2e-ad44-4b1b-bc3d-40e5ea82e2a1', 'Beachfront Villa', 'A luxurious villa by the beach with stunning views.', 'Lagos, Nigeria', 150.00, NOW(), NOW()),
('xyz789', '3f9c3b2e-ad44-4b1b-bc3d-40e5ea82e2a1', 'Cozy Apartment', 'A comfortable city apartment perfect for short stays.', 'Abuja, Nigeria', 85.00, NOW(), NOW()),
('pqr456', '4f8b2c6d-b213-49a5-b5eb-71cf2d9e589f', 'Mountain Retreat', 'A peaceful cabin in the mountains.', 'Jos, Nigeria', 120.00, NOW(), NOW()),
('lmn678', '4f8b2c6d-b213-49a5-b5eb-71cf2d9e589f', 'Luxury Penthouse', 'A high-end penthouse with a panoramic city view.', 'Lagos, Nigeria', 250.00, NOW(), NOW());

-- Populate Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('bkg101', 'abc123', '1e8a1f6e-df32-4b28-9e95-86d6c71d3a12', '2025-06-10', '2025-06-15', 750.00, 'confirmed', NOW()),
('bkg102', 'xyz789', '1e8a1f6e-df32-4b28-9e95-86d6c71d3a12', '2025-07-01', '2025-07-05', 340.00, 'pending', NOW()),
('bkg103', 'pqr456', '7a9e1b3c-a715-4d34-823b-92ecf7d7b24e', '2025-08-15', '2025-08-20', 600.00, 'confirmed', NOW()),
('bkg104', 'lmn678', '7a9e1b3c-a715-4d34-823b-92ecf7d7b24e', '2025-09-01', '2025-09-05', 1000.00, 'confirmed', NOW());

-- Populate Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay001', 'bkg101', 750.00, NOW(), 'credit_card'),
('pay002', 'bkg102', 340.00, NOW(), 'paypal'),
('pay003', 'bkg103', 600.00, NOW(), 'stripe'),
('pay004', 'bkg104', 1000.00, NOW(), 'credit_card');

-- Populate Review Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('rev901', 'abc123', '1e8a1f6e-df32-4b28-9e95-86d6c71d3a12', 5, 'Amazing place, great views!', NOW()),
('rev902', 'xyz789', '1e8a1f6e-df32-4b28-9e95-86d6c71d3a12', 4, 'Cozy and well-located.', NOW()),
('rev903', 'pqr456', '7a9e1b3c-a715-4d34-823b-92ecf7d7b24e', 5, 'Loved the quiet mountain retreat!', NOW()),
('rev904', 'lmn678', '7a9e1b3c-a715-4d34-823b-92ecf7d7b24e', 3, 'Expensive but great views!', NOW());

-- Populate Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('msg100', '1e8a1f6e-df32-4b28-9e95-86d6c71d3a12', '3f9c3b2e-ad44-4b1b-bc3d-40e5ea82e2a1', 'Hey, is your villa available next weekend?', NOW()),
('msg101', '3f9c3b2e-ad44-4b1b-bc3d-40e5ea82e2a1', '1e8a1f6e-df32-4b28-9e95-86d6c71d3a12', 'Yes! Let me know if you want to book.', NOW()),
('msg102', '7a9e1b3c-a715-4d34-823b-92ecf7d7b24e', '4f8b2c6d-b213-49a5-b5eb-71cf2d9e589f', 'I love your mountain retreat. Can I extend my stay?', NOW()),
('msg103', '4f8b2c6d-b213-49a5-b5eb-71cf2d9e589f', '7a9e1b3c-a715-4d34-823b-92ecf7d7b24e', 'Sure! Let’s arrange it.', NOW());

