create database airline;
use airline;

create table airports(
	airport_id int primary key auto_increment,
    airport_name varchar(50),
    city varchar(50),
    country varchar(50)
);

create table airplanes(
	airplane_id int primary key auto_increment,
    model varchar(50),
    capacity int,
    manufacturer varchar(50)
);

create table flights(
	flight_id int primary key auto_increment,
    airplane_id int,
    departure_airport int,
    arrival_airport int,
    departure_time datetime,
    arrival_time datetime,
    price decimal(10, 2),
    foreign key(airplane_id) references airplanes(airplane_id),
    foreign key(departure_airport) references airports(airport_id),
    foreign key(arrival_airport) references airports(airport_id)
);

create table passengers(
	passenger_id int primary key auto_increment,
    first_name varchar(25),
    last_name varchar(25),
    email varchar(50) unique,
    phone_number varchar(25)
);

create table bookings(
	booking_id int primary key auto_increment,
	passenger_id int,
    flight_id int,
    booking_date datetime default current_timestamp,
    seat_number varchar(10) unique,
    foreign key(passenger_id) references passengers(passenger_id),
    foreign key(flight_id) references flights(flight_id)
);

create table payments(
	payment_id int primary key auto_increment,
    booking_id int,
    payment_date datetime default current_timestamp,
    amount decimal(10, 2),
    payment_method varchar(20),
    foreign key(booking_id) references bookings(booking_id)
);

INSERT INTO airports (airport_name, city, country) VALUES
('Charles de Gaulle Airport', 'Paris', 'France'),
('John F. Kennedy International Airport', 'New York', 'United States'),
('Heathrow Airport', 'London', 'United Kingdom'),
('Dubai International Airport', 'Dubai', 'United Arab Emirates'),
('Tokyo Haneda Airport', 'Tokyo', 'Japan'),
('Singapore Changi Airport', 'Singapore', 'Singapore');

INSERT INTO airplanes (model, capacity, manufacturer) VALUES
('Boeing 747', 366, 'Boeing'),
('Airbus A380', 853, 'Airbus'),
('Boeing 787 Dreamliner', 296, 'Boeing'),
('Airbus A350', 440, 'Airbus'),
('Boeing 777', 396, 'Boeing'),
('Airbus A320', 186, 'Airbus');

INSERT INTO flights (airplane_id, departure_airport, arrival_airport, departure_time, arrival_time, price) VALUES
(1, 1, 2, '2025-03-01 08:00:00', '2025-03-01 18:00:00', 850.00), 
(2, 3, 1, '2025-03-02 10:30:00', '2025-03-02 13:15:00', 320.50), 
(3, 2, 4, '2025-03-03 14:45:00', '2025-03-04 09:20:00', 1200.75),
(4, 5, 3, '2025-03-04 23:15:00', '2025-03-05 07:30:00', 975.25), 
(5, 4, 6, '2025-03-05 11:45:00', '2025-03-05 19:10:00', 560.80), 
(6, 6, 5, '2025-03-06 16:20:00', '2025-03-07 05:45:00', 680.30); 

INSERT INTO flights (airplane_id, departure_airport, arrival_airport, departure_time, arrival_time, price) VALUES
(1, 1, 2, '2025-03-01 08:00:00', '2025-03-01 18:00:00', 850.00);


INSERT INTO passengers (first_name, last_name, email, phone_number) VALUES
('John', 'Smith', 'john.smith@email.com', '+1-555-123-4567'),
('Emma', 'Johnson', 'emma.johnson@email.com', '+44-20-1234-5678'),
('Pierre', 'Dubois', 'pierre.dubois@email.com', '+33-1-23-45-67-89'),
('Hiroshi', 'Tanaka', 'hiroshi.tanaka@email.com', '+81-3-1234-5678'),
('Maria', 'Garcia', 'maria.garcia@email.com', '+34-91-123-4567'),
('Ahmed', 'Al-Farsi', 'ahmed.alfarsi@email.com', '+971-4-123-4567');

INSERT INTO bookings (passenger_id, flight_id, booking_date, seat_number) VALUES
(3, 1, '2025-02-10 14:30:00', '12A'), 
(1, 3, '2025-02-12 09:15:00', '24B'), 
(2, 2, '2025-02-15 11:45:00', '8C'),  
(4, 4, '2025-02-18 16:20:00', '15D'), 
(5, 5, '2025-02-20 10:05:00', '19F'), 
(6, 6, '2025-02-22 13:40:00', '5E');  

INSERT INTO payments (booking_id, payment_date, amount, payment_method) VALUES
(1, '2025-02-10 14:35:00', 850.00, 'Credit Card'),
(2, '2025-02-12 09:20:00', 1200.75, 'PayPal'),
(3, '2025-02-15 11:50:00', 320.50, 'Debit Card'),
(4, '2025-02-18 16:25:00', 975.25, 'Credit Card'),
(5, '2025-02-20 10:10:00', 560.80, 'Bank Transfer'),
(6, '2025-02-22 13:45:00', 680.30, 'Credit Card');

select * from airports;
select * from airplanes;
select * from flights;
select * from passengers;
select * from bookings;
select * from payments;

select * from flights as a 
inner join airports as b
on a.departure_airport = b.airport_id 
inner join airports as c 
on a.arrival_airport = c.airport_id
where b.airport_name = "Charles de Gaulle Airport" and c.airport_name = "John F. Kennedy International Airport";

select * from passengers as a
inner join bookings as b
on a.passenger_id = b.passenger_id
where b.booking_date >= now() - interval 30 day ;

select sum(price) from flights;

select departure_airport, count(departure_airport) as "nombre des departure" from flights
group by departure_airport;

select airplane_id, count(airplane_id) as "used n time" from flights
group by airplane_id
order by airplane_id asc
limit 3;

select p.passenger_id, concat(p.first_name," ",p.last_name) as 'passanger who spent most money', amount 
from passengers as p
inner join bookings as b
on p.passenger_id = b.passenger_id
inner join payments as pa
on b.booking_id = pa.booking_id
where pa.amount = (select max(amount) from payments);

update flights 
set price = price + (price * 0.1)
where DAYOFWEEK(departure_time) = 7 or DAYOFWEEK(departure_time) = 1;

delete from flights
where departure_time <= now() - interval 1 year;






