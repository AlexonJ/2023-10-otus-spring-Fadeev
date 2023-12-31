package ru.otus.spring.bookstore.services;

import ru.otus.spring.bookstore.dtos.BookDto;

import java.util.List;
import java.util.Optional;

public interface BookService {
    Optional<BookDto> findById(long id);

    List<BookDto> findAll();

    BookDto insert(String title, long authorId, List<Long> genresIds);

    BookDto update(long id, String title, long authorId, List<Long> genresIds);

    void deleteById(long id);
}
