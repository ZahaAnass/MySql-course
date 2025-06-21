drop database gestion_hotels;
create database gestion_hotels;
use gestion_hotels;

create table hotels (
	hotel_id int primary key auto_increment,
    hotel_name varchar(25) not null,
    city varchar(25) not null,
	country varchar(25) not null
);

create table rooms (
	room_id int primary key auto_increment,
    hotel_id int not null,
    room_number int unique not null,
    capacity int not null,
    price_per_night int not null,
    foreign key(hotel_id) references hotels(hotel_id)
);

create table customers (
	customer_id int primary key auto_increment,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    email char(50) unique not null,
    phone_number double not null
);

create table bookings (
	booking_id int primary key auto_increment,
    customer_id int not null,
    room_id int not null,
    check_in_date date not null, 
    check_out_date date not null,
    total_price double,
    foreign key(customer_id) references customers(customer_id),
    foreign key(room_id) references rooms(room_id)
);

create table payments(
	payment_id int primary key auto_increment,
    booking_id int not null,
    payment_date date not null,
    amount double not null,
    payment_method varchar(25)
);

-- Insert data into hotels table
INSERT INTO hotels (hotel_name, city, country) VALUES
('Grand Plaza', 'Paris', 'France'),
('Ocean View', 'Barcelona', 'Spain'),
('Mountain Retreat', 'Zurich', 'Switzerland'),
('City Central', 'New York', 'USA'),
('Palm Paradise', 'Dubai', 'UAE'),
('Sakura Inn', 'Tokyo', 'Japan'),
('Royal Gardens', 'London', 'UK'),
('Sunset Beach', 'Sydney', 'Australia'),
('Alpine Lodge', 'Innsbruck', 'Austria'),
('Golden Sands', 'Cancun', 'Mexico');

-- Insert data into rooms table
INSERT INTO rooms (hotel_id, room_number, capacity, price_per_night) VALUES
(1, 101, 2, 150),
(1, 205, 4, 280),
(2, 112, 2, 175),
(2, 301, 3, 220),
(3, 105, 2, 190),
(4, 401, 4, 320),
(5, 208, 2, 240),
(6, 110, 3, 210),
(7, 506, 2, 195),
(8, 304, 4, 260);

-- Insert data into customers table
INSERT INTO customers (first_name, last_name, email, phone_number) VALUES
('John', 'Smith', 'john.smith@email.com', 1234567890),
('Maria', 'Garcia', 'maria.garcia@email.com', 2345678901),
('Li', 'Wei', 'li.wei@email.com', 3456789012),
('Anna', 'Kowalski', 'anna.kowalski@email.com', 4567890123),
('James', 'Johnson', 'james.johnson@email.com', 5678901234),
('Sofia', 'Martinez', 'sofia.martinez@email.com', 6789012345),
('Ahmed', 'Mahmoud', 'ahmed.mahmoud@email.com', 7890123456),
('Yuki', 'Tanaka', 'yuki.tanaka@email.com', 8901234567),
('Oliver', 'Brown', 'oliver.brown@email.com', 9012345678),
('Emma', 'Wilson', 'emma.wilson@email.com', 1234509876);

-- Insert data into bookings table
INSERT INTO bookings (customer_id, room_id, check_in_date, check_out_date) VALUES
(1, 1, '2025-04-10', '2025-04-14'),
(2, 3, '2025-04-15', '2025-04-18'),
(3, 5, '2025-04-12', '2025-04-16'),
(4, 2, '2025-04-20', '2025-04-24'),
(5, 7, '2025-04-22', '2025-04-25'),
(6, 4, '2025-04-14', '2025-04-19'),
(7, 8, '2025-04-18', '2025-04-22'),
(8, 6, '2025-04-25', '2025-04-30'),
(9, 9, '2025-04-21', '2025-04-23'),
(10, 10, '2025-04-12', '2025-04-17');

-- Insert data into payments table
INSERT INTO payments (booking_id, payment_date, amount, payment_method) VALUES
(1, '2025-03-25', 600, 'Credit Card'),
(2, '2025-03-28', 525, 'Debit Card'),
(3, '2025-03-30', 760, 'PayPal'),
(4, '2025-04-02', 1120, 'Credit Card'),
(5, '2025-04-05', 720, 'Bank Transfer'),
(6, '2025-03-29', 1100, 'Credit Card'),
(7, '2025-04-01', 840, 'Debit Card'),
(8, '2025-04-10', 1600, 'Credit Card'),
(9, '2025-04-08', 390, 'PayPal'),
(10, '2025-03-27', 1300, 'Credit Card');

update bookings as b
inner join rooms as r
on b.room_id = r.room_id
set b.total_price = r.price_per_night * (b.check_out_date - b.check_in_date);

select * from hotels;
select * from customers;
select * from rooms;
select * from bookings;
select * from payments;


select h.hotel_name, h.city, h.country, r.room_id, r.capacity from hotels as h
inner join rooms as r 
on h.hotel_id = r.hotel_id;

select concat(c.first_name, " ", c.last_name) as client_name, h.hotel_name
from bookings as b
inner join customers as c
on b.customer_id = c.customer_id
inner join rooms as r
on b.room_id = r.room_id
inner join hotels as h
on h.hotel_id = r.hotel_id;

-- You need to review this task
delimiter $$  
create procedure find_available_room(in f_date date, in l_date date)  
begin  
    select * from rooms as r  
    where r.room_id not in (  
        select b.room_id from bookings as b  
        where (b.check_in_date <= l_date AND b.check_out_date >= f_date)  
    );  
end $$  
delimiter ;  

call find_avariable_room("2025-04-10", "2025-04-11");

select h.*, sum(total_price) as "total revenu"
from bookings as b
inner join rooms as r
on b.room_id = r.room_id
inner join hotels as h
on h.hotel_id = r.hotel_id
group by h.hotel_id;

select concat(c.first_name, " ", c.last_name) as client_name, max(p.amount) as high_price
from payments as p
inner join bookings as b
on p.booking_id = b.booking_id
inner join customers as c
on b.customer_id = c.customer_id
group by p.payment_id 
order by high_price DESC
limit 1;

update rooms as r 
inner join hotels as h 
on r.hotel_id = h.hotel_id
set r.price_per_night = r.price_per_night + (r.price_per_night * 10) / 100
where h.country = "France" or h.country = "Spain" or h.country = "Switzerland";

delete from bookings
where check_out_date < date_sub(current_date(), interval 2 year);

