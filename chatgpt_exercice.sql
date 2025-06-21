create database library_db;
use library_db;
create table books(
	book_id int primary key auto_increment,
	title varchar(100) not null,
	author varchar(50) not null,
	genre varchar(30),
	publication_year year,
	price double
);

create table members(
	membre_id int primary key auto_increment,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	email varchar(50) unique,
	membership_type varchar(20),
	join_date date
);

create table borrowings(
	borrow_id int primary key auto_increment,
	book_id int,
	member_id int,
	borrow_date date,
	return_date date,
	foreign key(book_id) references books(book_id),
	foreign key(member_id) references members(member_id)
);

create table categories(
	category_id int primary key auto_increment,
	name varchar(30),
	descreption varchar(100)
);

create table book_category(
	book_id int,
	category_id int,
	primary key(book_id, category_id),
	foreign key(book_id) references books(book_id),
	foreign key(category_id) references categories(category_id)
);


INSERT INTO books (title, author, genre, publication_year, price) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960, 12.99),
('1984', 'George Orwell', 'Dystopian', 1949, 10.50),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, 9.75),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 8.99),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 14.25),
('The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-age', 1951, 11.00),
('Brave New World', 'Aldous Huxley', 'Science Fiction', 1932, 10.25),
('The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 1954, 22.50),
('To the Lighthouse', 'Virginia Woolf', 'Modernist', 1927, 9.50),
('The Alchemist', 'Paulo Coelho', 'Adventure', 1988, 13.75);


INSERT INTO members (first_name, last_name, email, membership_type, join_date) VALUES
('John', 'Smith', 'john.smith@email.com', 'Premium', '2020-01-15'),
('Emily', 'Johnson', 'emily.j@email.com', 'Standard', '2021-03-22'),
('Michael', 'Williams', 'michael.w@email.com', 'Premium', '2019-11-05'),
('Sarah', 'Brown', 'sarah.b@email.com', 'Student', '2022-02-18'),
('David', 'Jones', 'david.j@email.com', 'Standard', '2020-07-30'),
('Jennifer', 'Garcia', 'jennifer.g@email.com', 'Premium', '2021-09-12'),
('Robert', 'Miller', 'robert.m@email.com', 'Senior', '2018-05-25'),
('Lisa', 'Davis', 'lisa.d@email.com', 'Standard', '2022-01-08'),
('Thomas', 'Rodriguez', 'thomas.r@email.com', 'Student', '2021-10-14'),
('Jessica', 'Martinez', 'jessica.m@email.com', 'Premium', '2020-04-19');


INSERT INTO categories (name, description) VALUES
('Fiction', 'Imaginary stories and narratives'),
('Non-Fiction', 'Factual writing based on real events'),
('Science Fiction', 'Futuristic, scientific, and technological themes'),
('Fantasy', 'Magic, supernatural elements, and imaginary worlds'),
('Romance', 'Love stories and emotional relationships'),
('Mystery', 'Stories involving puzzles and investigations'),
('Biography', 'Accounts of people\'s lives'),
('History', 'Records of past events'),
('Self-Help', 'Personal development and improvement'),
('Young Adult', 'Books targeted at teenagers');


INSERT INTO book_category (book_id, category_id) VALUES
(1, 1), (1, 5),  -- To Kill a Mockingbird: Fiction, Romance
(2, 1), (2, 3),  -- 1984: Fiction, Science Fiction
(3, 1), (3, 5),  -- The Great Gatsby: Fiction, Romance
(4, 1), (4, 5),  -- Pride and Prejudice: Fiction, Romance
(5, 1), (5, 4),  -- The Hobbit: Fiction, Fantasy
(6, 1), (6, 10), -- The Catcher in the Rye: Fiction, Young Adult
(7, 1), (7, 3),  -- Brave New World: Fiction, Science Fiction
(8, 1), (8, 4),
(9, 1), (9, 7),
(10, 1), (10, 8);


INSERT INTO borrowings (book_id, member_id, borrow_date, return_date) VALUES
(1, 3, '2023-01-10', '2023-01-24'),
(5, 7, '2023-02-15', '2023-03-01'),
(2, 1, '2023-03-05', '2023-03-19'),
(8, 4, '2023-04-12', NULL),
(3, 2, '2023-05-20', '2023-06-03'),
(6, 5, '2023-06-08', '2023-06-22'),
(4, 9, '2023-07-14', '2023-07-28'),
(7, 6, '2023-08-03', NULL),
(9, 8, '2023-09-11', '2023-09-25'),
(10, 10, '2023-10-09', '2023-10-23');

update 
