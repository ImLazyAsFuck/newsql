use ss6;
-- Tạo bảng Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất của người dùng
    username VARCHAR(50) NOT NULL,         -- Tên tài khoản người dùng
    email VARCHAR(100) UNIQUE NOT NULL,    -- Email của người dùng
    created_at DATETIME NOT NULL           -- Thời gian tạo tài khoản
);
-- Tạo bảng Posts
CREATE TABLE Posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY, 
    user_id INT NOT NULL,                   
    content TEXT NOT NULL,                  
    created_at DATETIME NOT NULL,           
    likes_count INT DEFAULT 0,              
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- Thêm dữ liệu vào bảng Users
INSERT INTO Users (username, email, created_at)
VALUES
    ('john_doe', 'john.doe@example.com', '2025-01-01 10:00:00'),
    ('jane_smith', 'jane.smith@example.com', '2025-01-02 11:00:00'),
    ('alice_wonder', 'alice.wonder@example.com', '2025-01-03 12:00:00'),
    ('bob_marley', 'bob.marley@example.com', '2025-01-04 13:00:00'),
    ('charlie_brown', 'charlie.brown@example.com', '2025-01-05 14:00:00');
-- Thêm dữ liệu vào bảng Posts
INSERT INTO Posts (user_id, content, created_at, likes_count)
VALUES
    (1, 'Hello world!', '2025-01-10 10:00:00', 10),
    (2, 'Love this platform!', '2025-01-11 11:00:00', 20),
    (1, 'Had a great day today.', '2025-01-12 12:00:00', 15),
    (3, 'Exploring new ideas!', '2025-01-13 13:00:00', 25),
    (4, 'Check out my new blog.', '2025-01-14 14:00:00', 30);

-- 2
select p.user_id,u.username,count(p.user_id) as total_posts,sum(p.likes_count) as total_likes from Posts p
join Users u on p.user_id = u.user_id
group by p.user_id,u.username
having sum(p.likes_count) > 20;	

-- 3
select p.user_id,u.username,p.post_id,p.content,max(p.likes_count) as max_likes from Posts p
join Users u on p.user_id = u.user_id
group by p.user_id,u.username,p.post_id
having max(p.likes_count) >= 20;

-- 4
select p.user_id,u.username,count(p.user_id) as total_posts,sum(p.likes_count) as total_likes from Posts p
join Users u on p.user_id = u.user_id
group by p.user_id,u.username
having count(p.user_id) > 1;

-- 5
select p.user_id,u.username,p.post_id,p.content,min(p.likes_count) as min_likes from Posts p
join Users u on p.user_id = u.user_id
group by p.user_id,u.username,p.post_id
having min(p.likes_count) < 15;