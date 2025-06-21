-- drop database library;  
create database library;
use library;

create table members(
	member_id int primary key auto_increment,
    member_name varchar(50),
    email varchar(50) unique,
    join_date date
);

create table books(
   book_id INT PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(100) NOT NULL,
   author VARCHAR(50),
   published_year INT,
   isbn VARCHAR(13) UNIQUE
);

create table borrowed_books(
	loan_id int primary key auto_increment,
    book_id int,
    member_id int,
    loan_date date,
    return_date date,
    foreign key(book_id) references books(book_id),
    foreign key(member_id) references members(member_id)
);

insert into members (member_name, email, join_date)
values ("anass" ,"anass@gmail.com", "2025-01-28"),
	   ("walid" ,"walid@gmail.com", "2025-01-29"),
       ("ahmed" ,"ahmed@gmail.com", "2025-01-30");
       
insert into books (title, author, published_year, isbn)
values ("Moby-dick", "George Orwell", 1615, "AB123"), 
	   ("To kill a mockingbird", "Harper Lee", 2015, "CD456"), 
       ("Odyssey", "Homer", 2001, "EF789"),
       ("Harry Potter", "Rowling", 2014, "GH012"),
       ("Lord of the Rings", "John Ronald Reuel Tolkien", 1949, "IJ345");
       
insert into borrowed_books (book_id, member_id, loan_date, return_date) 
values (2, 1, "2025-01-28", "2025-02-01"),
	   (5, 2, "2025-01-29", "2025-02-03");
       
select * from books
where published_year > 2000;
       
select * from members
where join_date > "2025-01-28";

select * from borrowed_books inner join members
on borrowed_books.member_id = members.member_id;
    
update members
set email = "fake@gmail.com"
where member_id = 3;
    
delete from books
where book_id = 1;
    
select * from members;
select * from books;
select * from borrowed_books;