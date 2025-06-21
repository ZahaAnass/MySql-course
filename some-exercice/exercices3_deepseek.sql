-- drop database Social_Media;
create database Social_Media;
use Social_Media;
set autocommit = off;

create table users(
	user_id int primary key auto_increment,
    username varchar(50) unique,
    joined_date date default (current_date())
);

create table posts(
	post_id int primary key auto_increment,
    user_id int,
    content text not null,
    post_date datetime default now(),
    foreign key(user_id) references users(user_id) on delete cascade
);

create table comments(
	comment_id int primary key auto_increment,
    post_id int,
    user_id int,
    comment_text text not null,
    comment_date datetime default now(),
    foreign key(post_id) references posts(post_id) on delete cascade,
    foreign key(user_id) references users(user_id) on delete cascade
);

create table post_likes(
	like_id int primary key auto_increment,
    post_id int,
    user_id int,
    like_date datetime default now(),
    foreign key(post_id) references posts(post_id) on delete cascade,
    foreign key(user_id) references users(user_id) on delete cascade
);


create table follows(
	follower_id int,
    followed_id int,
    follow_date date default (current_date()) ,
    primary key(follower_id, followed_id),
    foreign key(follower_id) references users(user_id) on delete cascade,
    foreign key(followed_id) references users(user_id) on delete cascade
);

insert into users(username, joined_date)
values  ("alex", "2025-01-20"),
		("andrew", "2025-01-25"),
        ("john", "2025-01-30");
        
insert into posts(user_id, content, post_date)
values (1, "Mysql is a powerful language", "2025-01-20 14:30:00"),
       (1, "I love PYTHON", "2025-01-23 07:30:50"),
       (2, "I hate PHP", "2025-01-26 11:30:00"),
       (2, "I'm learning JavaScript", "2025-01-29 18:20:00"),
       (3, "I'm working with React", "2025-01-31 12:59:59");
       
insert into posts(user_id, content)
value (3, "I love Linux, exactly i love work Arch Linux");

insert into comments(post_id, user_id, comment_text)
values (1, 2, "i prefere work with postgre sql"),
       (1, 3, "yes Mysql is powerful and fast"),
       (2, 3, "yes python is a powerful language"),
       (2, 3, "you can do everithing with python like the back-end in web development"),
       (2, 2, "but i perefere c++ is more usable and faster"),
       (6, 1, "btw i use arch"),
       (6, 2, "i'm ubuntu user"),
       (5, 3, "i'm learning react native to create mobile application"),
       (4, 1, "good luck bro"),
       (4, 3, "when you finish go to node.js and react");

insert into post_likes(post_id, user_id)
values (1, 1),
	   (1, 2),
       (1, 3),
       (6, 1),
       (6, 2),
       (6, 3),
       (2, 3),
       (3, 3),
       (5, 3),
       (4, 2),
       (4, 1),
       (3, 2),
       (4, 1);

insert into follows(follower_id, followed_id)
values (1, 3),
	   (2, 3),
       (3, 1),
       (2, 1),
       (3, 2);

select * from users;
select * from posts;
select * from comments order by post_id;
select * from post_likes order by post_id;
select * from follows;


select * from posts inner join users
on posts.user_id = users.user_id
where username = "john";

select count(distinct post_likes.like_id) as number_of_likes,
	   count(distinct comments.comment_id) as number_of_comments,
       posts.post_id, 
       posts.content
from posts 
left join post_likes on posts.post_id = post_likes.post_id
left join comments on posts.post_id = comments.post_id
group by posts.post_id;

select count(follower_id) as "number_of_followers" , followed_id as "user"
from follows
group by followed_id
having count(follower_id) > 1;

commit;

delete from users
where username = "andrew";

rollback;

