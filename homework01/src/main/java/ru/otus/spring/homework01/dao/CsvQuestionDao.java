package ru.otus.spring.homework01.dao;

import com.opencsv.bean.CsvToBeanBuilder;
import lombok.RequiredArgsConstructor;
import ru.otus.spring.homework01.config.TestFileNameProvider;
import ru.otus.spring.homework01.dao.dto.Mapper;
import ru.otus.spring.homework01.dao.dto.QuestionDto;
import ru.otus.spring.homework01.domain.Question;
import ru.otus.spring.homework01.exceptions.QuestionReadException;
import ru.otus.spring.homework01.service.FileService;

import java.util.List;

@RequiredArgsConstructor
public class CsvQuestionDao implements QuestionDao {

    public static final Character COLUMNS_DELIMITER = ';';

    private final TestFileNameProvider fileNameProvider;

    private final FileService fileService;

    private final Mapper mapper;

    @Override
    public List<Question> findAll() {
        try {
            return new CsvToBeanBuilder<QuestionDto>(fileService.getReader(fileNameProvider.getTestFileName()))
                    .withType(QuestionDto.class).withSkipLines(1).withSeparator(COLUMNS_DELIMITER).build()
                    .stream().map(mapper::questionDtoToQuestion).toList();

        } catch (Exception e) {
            throw new QuestionReadException("An error occurred while reading the file: " + e.getMessage(), e);
        }
    }
}
