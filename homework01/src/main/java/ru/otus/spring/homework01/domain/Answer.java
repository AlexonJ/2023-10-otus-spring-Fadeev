package ru.otus.spring.homework01.domain;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class Answer {

    private String text;

    private Boolean isCorrect;

}