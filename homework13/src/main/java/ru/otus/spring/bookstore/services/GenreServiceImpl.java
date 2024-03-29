package ru.otus.spring.bookstore.services;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import ru.otus.spring.bookstore.dtos.GenreDto;
import ru.otus.spring.bookstore.mappers.DtoMapper;
import ru.otus.spring.bookstore.repositories.GenreRepository;

import java.util.List;

@RequiredArgsConstructor
@Service
public class GenreServiceImpl implements GenreService {

    private final GenreRepository genreRepository;

    private final DtoMapper mapper;

    @PreAuthorize("{hasAuthority('READ')} && {hasAuthority('GENRES_ACCESS')}")
    @Override
    public List<GenreDto> findAll() {
        return genreRepository.findAll().stream().map(mapper::genreToGenreDto).toList();
    }
}
