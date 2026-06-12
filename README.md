# MuIT
Приложение для поиска вакансий.
Создается для индивидуального проекта в колледж.

## Технологии
- UI/Business Logic: Flutter
- Architecture: MVVM

## Цель приложения
Возможность искать вакансии международно а также прямо в приложении можно создать красивое резюме и портфолио.

## Структура проекта
```
lib/
├── src/
│   ├── features/
│   │   ├── home/
│   │   │   ├── presentation/
│   │   │   │   ├── pages/ (home_page.dart)
│   │   │   │   ├── widgets/ (vacancy_widget.dart, dialog_filtered_widget.dart, search_widget.dart)
│   │   │   │   └── bloc/ (vacancy_cubit.dart)
│   │   │   └── data/
│   │   │       └── model/ (vacancy_state.dart)
│   │   ├── profile/
│   │   │   ├── presentation/
│   │   │   │   ├── pages/ (profile_page.dart)
│   │   │   │   ├── widgets/ (bottomSheet_profile_widget.dart, card_profile_widget.dart)
│   │   │   │   └── bloc/ (profile_cubit.dart, contact_cubit.dart)
│   │   │   └── data/
│   │   │       └── model/ (profile_model.dart)
│   │   └── settings/
│   │        ├── presentation/
│   │        │    ├── pages/ (settings_page.dart)
│   │        │    ├── widgets/ (...)
│   │        │    └── bloc/ (...)
│   │        └── data/
│   │             └── model/ (...)
│   └── utils/ (validators_utility.dart, formatters_utility.dart, colors_utility.dart)
├── main_navigation.dart
└── main.dart
```