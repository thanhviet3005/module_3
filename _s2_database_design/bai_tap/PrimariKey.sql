use primary_key;

CREATE TABLE users(
user_id int auto_increment primary key,
user_name varchar(40),
user_pass varchar(255),
email varchar(255)
);
CREATE TABLE roles(
roles_id int auto_increment,
roles_name varchar(50),
primary key(roles_id)
);
CREATE TABLE userroles(
user_id int not null,
roles_id int not null,
primary key(user_id, roles_id)
);

