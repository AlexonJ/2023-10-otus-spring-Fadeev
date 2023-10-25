package ru.otus.spring.testapplication.config;

import java.util.ArrayList;
import java.util.Locale;

public interface LocaleProvider {
    Locale getDefaultLocale();
    Locale getCurrentLocale();
    void setCurrentLocale(Locale locale);
    ArrayList<Locale> getPossibleLocales();
}
