CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    autor_name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT REFERENCES authors(author_id),
    publication_year INTEGER NOT NULL,
	genre VARCHAR(100) NOT NULL,
    books_count INTEGER NOT NULL,
	available BOOLEAN NOT NULL
);

CREATE TABLE workers (
    worker_id SERIAL PRIMARY KEY,
    workers_name VARCHAR(100) NOT NULL,
    workers_position VARCHAR(100) NOT NULL,
    salary INTEGER NOT NULL
);

CREATE TABLE users (
    users_id SERIAL PRIMARY KEY,
    users_name VARCHAR(100) NOT NULL,
	phone_number VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(200)
);
 
CREATE TABLE book_loans (
    loans_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id) NOT NULL,
    users_id INT REFERENCES users(users_id) NOT NULL,
	worker_id INT REFERENCES workers(worker_id) NOT NULL,
    loan_date DATE NOT NULL,
	return_date DATE
);

INSERT INTO authors(autor_name) VALUES 
	('Джейн Остін'),
	('Джоан Роулінг'),
	(' Шарлотта Бронте'),
	(' Марґарет Мітчелл'),
	(' Джордж Оруелл' );

INSERT INTO books(title, author_id, publication_year, genre, books_count, available) VALUES 
	('Скотний двір', 5, 1987, 'казка', 3, true),
	('Гаррі Поттер і філософський камінь» ', 2, 2006, 'роман', 5, true),
	('Гаррі Поттер і таємна кімната', 2, 2007, 'роман', 1, false),
	('Джейн Ейр', 3, 1991, 'роман', 3, true),
	('Звіяні вітром', 4, 1991, 'роман', 5, true),
	('Гордість і упередження', 1, 1989, 'роман', 4, true);

INSERT INTO workers(workers_name, workers_position, salary) VALUES 
	('Петро Іванов', 'Бібліотекар ', 6500),
	('Марія Петренко', 'Адміністратор', 9000),
	('Олександр Коваль', 'Прибиральник', 5000);

INSERT INTO users(users_name, phone_number, email, address) VALUES 
	('Олена Іванова', '+380991234567', 'olena@example.com', 'вул. Пушкіна, 10'),
	('Іван Петров', '+380992345678', 'ivan@example.com', 'вул. Пушкіна, 10'),
	('Марина Сидорова', '+380993456789', 'marina@example.com', 'вул. Гоголя, 20');

INSERT INTO book_loans(book_id, users_id, worker_id, loan_date, return_date) VALUES 
	(1, 1, 1, '2024-05-01', '2024-06-01'),
	(3, 2, 1, '2024-05-03', '2024-06-03'),
	(5, 3, 2, '2024-05-05', '2024-06-05');