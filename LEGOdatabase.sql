CREATE DATABASE  IF NOT EXISTS LEGO_Organizer;

USE LEGO_Organizer;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS set_categories;
DROP TABLE IF EXISTS lego_sets;
DROP TABLE IF EXISTS set_images;
DROP TABLE IF EXISTS user_permissions;
DROP TABLE IF EXISTS queries;

 /* Create table for users (collectors and admirers) */
CREATE TABLE users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,  
    email VARCHAR(100) NOT NULL UNIQUE,
    fullName VARCHAR(100),
    phoneNumber VARCHAR(15),
    role ENUM('collector', 'admirer') NOT NULL DEFAULT 'admirer', 
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE set_categories (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(50) NOT NULL UNIQUE
);

/* Create table for LEGO sets */
CREATE TABLE lego_sets (
    setID INT AUTO_INCREMENT PRIMARY KEY,
    setName VARCHAR(100) NOT NULL,
    setNumber VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    categoryID INT,
    releaseYear INT,
    piecesCount INT,
    price DECIMAL(10, 2),
    setURL VARCHAR(400),  /* Link to LEGO or external site */
    createdBy INT,       /* The collector who added the set */
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (createdBy) REFERENCES users (userID),
    FOREIGN KEY (categoryID) REFERENCES set_categories (categoryID)
);

/* Table that stores the images (separate for flexiblity) */
CREATE TABLE set_images (
    imageID INT AUTO_INCREMENT PRIMARY KEY,
    setID INT,
    imageURL VARCHAR(255) NOT NULL,  /* URL or file path for the image */
    addedBy INT,                    /* Collector who uploaded the image */
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (setID) REFERENCES lego_sets (setID) ON DELETE CASCADE,
    FOREIGN KEY (addedBy) REFERENCES users (userID)
);

CREATE TABLE user_permissions (
    permissionID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    setID INT,
    canAdd BOOLEAN DEFAULT FALSE,     /* Permission to add sets */
    canEdit BOOLEAN DEFAULT FALSE,    /* Permission to edit sets */
    canDelete BOOLEAN DEFAULT FALSE,  /* Permission to delete sets */
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES users (userID),
    FOREIGN KEY (setID) REFERENCES lego_sets (setID)
);

CREATE TABLE queries (
    queryID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    userMessage TEXT NOT NULL,         
    submittedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    status ENUM('pending', 'answered') DEFAULT 'pending',  
    response TEXT, 
    answeredAt TIMESTAMP NULL,  
    FOREIGN KEY (userID) REFERENCES users (userID)
);



