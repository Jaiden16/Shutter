DROP DATABASE IF EXISTS database;

CREATE DATABASE database;

\c database

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR UNIQUE,
    email VARCHAR,
    profileImage VARCHAR
);

CREATE TABLE images (
    id SERIAL PRIMARY KEY, 
    poster_name VARCHAR REFERENCES users (username), 
    image_url VARCHAR,
    caption VARCHAR,
    alt VARCHAR
);

CREATE TABLE likes (
    image_id INT REFERENCES images (id),
    liker_name VARCHAR REFERENCES users (username)
);

CREATE TABLE hashtags (
    hashtag VARCHAR,
    image_id INT REFERENCES images (id)
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY, 
    comment VARCHAR, 
    image_id INT REFERENCES images (id),
    commentors_name VARCHAR REFERENCES users (username)
);

INSERT INTO users (username, email, profileImage)
    VALUES ('JonathanFagan', 'JFagan@project.com', 'https://scontent-lga3-1.cdninstagram.com/v/t51.2885-19/s320x320/23161732_153227468754449_5016057889425457152_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com&_nc_ohc=ewXV9KsoJnsAX9jFSsw&oh=f6debec9edd595cc3668de39dfbcc9db&oe=5E9D6D06'),
           ('BriahanaMaugé', 'BMauge@project.com', 'https://scontent-lga3-1.cdninstagram.com/v/t51.2885-19/s320x320/77192473_512897456245737_8807788785090691072_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com&_nc_ohc=fPfdm8wfsFAAX-6LyAB&oh=644393466af580517c9c897941a5644d&oe=5EBF4FCC'),
           ('KadijahWilson', 'KWilson@project.com', 'https://scontent-lga3-1.cdninstagram.com/v/t51.2885-19/s320x320/67972965_716653765474069_1437860166283296768_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com&_nc_ohc=xc6umcOzIOQAX_bBeRD&oh=1dab5612ff9b8b9694acd8a8b6b34803&oe=5EA78B15'),
           ('PeterFiorentino', 'PFiorentino@project.com', 'http://localhost:3001/images/1578534325613-DSC02759.JPG');

INSERT INTO images (poster_name, image_url, caption, alt)
    VALUES ('JonathanFagan', 'https://newyorkknicksmemesdotcom.files.wordpress.com/2013/08/tmac.jpg', 'My favorite player.', 'Basketball player for the Knicks.'),
           ('BriahanaMaugé', 'https://i.ytimg.com/vi/EUbAaeohpiA/maxresdefault.jpg', 'I do not just think he is cute. I like his music!', 'Chris Breezy!'),
           ('KadijahWilson', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/fulani-braids-1569510184.png?crop=0.503xw:1.00xh;0,0&resize=640:*', 'That is cute', 'Black and blue ombré braids'),
           ('PeterFiorentino', 'https://www.rollingstone.com/wp-content/uploads/2018/06/rs-the-last-word-billy-joel-e7209123-22e1-4a8f-acff-136584bdb016.jpg?resize=900,600&w=450', 'The king.', 'Large Billy Joel sitting at a tiny piano'),
           ('PeterFiorentino', 'https://images.radio.com/aiu-media/GettyImages691922810-32154aa3-ff16-4387-87b7-4c7c33dbf207.jpg?width=800', 'Rocketman', 'Elton');

INSERT INTO likes (image_id, liker_name)
    VALUES (1,'BriahanaMaugé'),
           (2,'JonathanFagan'),
           (3,'PeterFiorentino'),
           (4,'KadijahWilson');


INSERT INTO hashtags (hashtag, image_id)
    VALUES ('betterAsARocket', 1),
           ('nothingButHits', 2),
           ('blueBraids', 3),
           ('pianoMan', 4),
           ('theGOAT', 4);

INSERT INTO comments (comment, image_id, commentors_name)
    VALUES ('His cousin is better.', 1, 'PeterFiorentino'),
           ('You just like him cause hes cute', 2, 'JonathanFagan'),
           ('Can you do this to me?', 3, 'BriahanaMaugé'),
           ('Who is this?', 4, 'KadijahWilson'),
           ('Lebron >>>>', 1, 'KadijahWilson');

SELECT * FROM users;