-- Authors
insert into authors(full_name)
values ('George Orwell'), ('Jane Austen'), ('F. Scott Fitzgerald'), ('Harper Lee'),
       ('Ernest Hemingway'), ('J.K. Rowling'), ('Leo Tolstoy'), ('Agatha Christie');

-- Genres
insert into genres(name)
values ('Science Fiction'), ('Romance'), ('Classic'), ('Mystery'), ('Adventure'),
       ('Fantasy'), ('Historical Fiction'), ('Crime');

-- Books
insert into books(title, author_id)
values ('1984', 1), ('Pride and Prejudice', 2), ('The Great Gatsby', 3),
       ('To Kill a Mockingbird', 4), ('The Old Man and the Sea', 5),
       ('Harry Potter and the Philosopher''s Stone', 6), ('War and Peace', 7),
       ('Murder on the Orient Express', 8), ('The Catcher in the Rye', 5),
       ('Crime and Punishment', 7), ('Harry Potter and the Chamber of Secrets', 6),
       ('Harry Potter and the Prisoner of Azkaban', 6), ('The Adventures of Sherlock Holmes', 8);

-- Comments
insert into comments(book_id, content)
values (1, 'Recommended to read'),
       (2, 'Have already been read');

-- Books Genres
insert into books_genres(book_id, genre_id)
values (1, 1), (2, 2), (2, 3), (3, 3), (4, 4), (5, 5), (5, 3),
       (6, 6), (7, 3), (7, 7), (8, 8), (9, 7), (9, 8), (10, 3), (10, 7),
       (11, 6), (11, 3), (12, 3), (12, 6), (13, 4), (13, 7);

-- Users
insert into users(username, password)
values ('admin', '$2y$10$fsBa.mRJCU7YUC9msaasXOyHQlVIWj0F6i5W.yeUpc7OF..dDNLWe'), -- password: pwd
       ('customer', '$2y$10$FD2GIs/aKP46U5aCD.jKyeJPbxanvN6Tk0NHO2jrBTsO/fvwMPQW.'), -- password: usr
       ('manager', '$2y$10$FD2GIs/aKP46U5aCD.jKyeJPbxanvN6Tk0NHO2jrBTsO/fvwMPQW.'), -- password: usr
       ('auditor', '$2y$10$FD2GIs/aKP46U5aCD.jKyeJPbxanvN6Tk0NHO2jrBTsO/fvwMPQW.'); -- password: usr

-- Roles
insert into roles(role_name)
values ('READ'), ('WRITE'), ('DELETE'), ('BOOKS_ACCESS'), ('AUTHORS_ACCESS'), ('GENRES_ACCESS');

-- users_roles
insert into users_roles(user_id, role_id)
--    + READ  + WRITE +DELETE +BOOKS  +AUTHORS+GENRES+
values (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6),       -- admin    - all roles
       (2, 1), (2, 2),         (2, 4),                       -- customer - can read and edit books
       (3, 1), (3, 2),                 (3, 5), (3, 6),       -- manager  - read and edit authors and genres
       (4, 1),                 (4, 4), (4, 5), (4, 6);       -- auditor  - read everything