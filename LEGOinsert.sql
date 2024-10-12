-- Use the LEGO database
USE LEGO_Organizer;

-- Insert data into the users table
INSERT INTO users (username, password, email, fullName, phoneNumber, role)
VALUES 
('john_doe', 'password123', 'john.doe@example.com', 'John Doe', '1234567890', 'collector'),
('jane_smith', 'password456', 'jane.smith@example.com', 'Jane Smith', '0987654321', 'admirer'),
('mike_jones', 'password789', 'mike.jones@example.com', 'Mike Jones', '1122334455', 'collector'),
('emily_davis', 'password111', 'emily.davis@example.com', 'Emily Davis', '5566778899', 'admirer'),
('edward_jordan', 'password131', 'edward.jordan@example.com', 'Edward Jordan', '6465034681', 'collector');

-- Insert data into the set_categories table
INSERT INTO set_categories (categoryName)
VALUES 
('Technic'),
('City'),
('Friends'),
('Creator'),
('Star Wars'),
('Architecture');

-- Insert data into the lego_sets table
INSERT INTO lego_sets (setName, setNumber, description, categoryID, releaseYear, piecesCount, price, setURL, createdBy)
VALUES 
('LEGO Technic Bugatti Chiron', '42083', 'Build a detailed model of the Bugatti Chiron with working parts and intricate design.', 1, 2018, 3599, 349.99, 'https://www.lego.com/en-us/product/bugatti-chiron-42083', 1),
('LEGO City Police Station', '60246', 'A police station with vehicles and accessories for the ultimate city action scenes.', 2, 2020, 743, 99.99, 'https://www.lego.com/en-us/product/police-station-60246', 1),
('LEGO Friends Central Perk', '21319', 'Recreate the iconic Central Perk coffee shop from the TV show Friends.', 3, 2019, 1070, 59.99, 'https://www.lego.com/en-us/product/central-perk-21319', 5),
('LEGO Creator 3-in-1 Rocket Assembly', '31091', 'Build a rocket, a space shuttle, or a satellite with this 3-in-1 Creator set.', 4, 2018, 235, 19.99, 'https://www.lego.com/en-us/product/rocket-assembly-31091', 5),
('LEGO Star Wars Millennium Falcon', '75257', 'The iconic Millennium Falcon from Star Wars, now in LEGO form!', 5, 2019, 1351, 159.99, 'https://www.lego.com/en-us/product/millennium-falcon-75257', 3),
('LEGO Architecture New York City', '21028', 'Build your own version of New York City with this detailed Architecture set.', 6, 2016, 598, 49.99, 'https://www.lego.com/en-us/product/new-york-city-21028', 3);

-- Insert data into the set_images table
INSERT INTO set_images (setID, imageURL, addedBy)
VALUES 
(1, 'https://www.example.com/bugatti.jpg', 1),
(2, 'https://www.example.com/police_station.jpg', 3),
(3, 'https://www.example.com/central_perk.jpg', 3),
(4, 'https://www.example.com/rocket_assembly.jpg', 1),
(5, 'https://www.example.com/millennium_falcon.jpg', 1),
(6, 'https://www.example.com/new_york_city.jpg', 5);

-- Insert data into user_permissions table
INSERT INTO user_permissions (userID, setID, canAdd, canEdit, canDelete)
VALUES 
(1, 1, TRUE, TRUE, TRUE), 
(2, 2, FALSE, FALSE, FALSE),
(3, 3, TRUE, TRUE, TRUE), 
(4, 4, FALSE, FALSE, FALSE);

-- Insert data into queries table
INSERT INTO queries (userID, userMessage, status, response, answeredAt)
VALUES 
(1, 'Is there any discount on LEGO sets?', 'pending', NULL, NULL),
(2, 'How can I add images to LEGO sets?', 'answered', 'Only collectors can add images to LEGO sets.', '2024-10-11'),
(3, 'Can I combine my points for a discount?', 'pending', NULL, NULL);



