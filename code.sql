


CREATE TABLE hero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    tagline VARCHAR(255)
);
CREATE TABLE about (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL
);
CREATE TABLE education (
    id INT AUTO_INCREMENT PRIMARY KEY,
    degree VARCHAR(100),
    institution VARCHAR(100),
    year YEAR
);
CREATE TABLE certifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    issuer VARCHAR(100),
    date DATE
);
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    image_url VARCHAR(255),
    github_link VARCHAR(255),
    live_link VARCHAR(255)
);

CREATE TABLE project_languages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    language VARCHAR(50),
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);
CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    category ENUM('frontend', 'backend', 'database', 'tool') NOT NULL,
    rating INT CHECK (rating >= 0 AND rating <= 100) -- for line percentage
);

CREATE TABLE soft_skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT
);
CREATE TABLE contact_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    phone VARCHAR(20),
    location VARCHAR(100),
    github VARCHAR(100),
    linkedin VARCHAR(100)
);
