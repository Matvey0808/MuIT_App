import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/bloc/vacancy_state.dart';

class VacancyCubit extends Cubit<List<VacancyState>> {
  VacancyCubit() : super([
    VacancyState(name: "Android Developer", pay: "90 000", city: "Барнаул"),
    VacancyState(name: "IOS Developer", pay: "110 000", city: "Москва"),
    VacancyState(name: "ML Engineer", pay: "130 000", city: "Москва"),
  ]);

  List<VacancyState> allVacancy = [
    VacancyState(name: "Android Developer", pay: "90 000", city: "Барнаул"),
    VacancyState(name: "IOS Developer", pay: "110 000", city: "Москва"),
    VacancyState(name: "ML Engineer", pay: "130 000", city: "Москва"),
  ];

  void search(TextEditingController controllerSearch) {
    List filteredVacancy = [];

    filteredVacancy = allVacancy.where((vacancy) {
      final nameLower = vacancy.name.toLowerCase();
      return nameLower.contains(controllerSearch.text.toLowerCase());
    }).toList();

    emit([...filteredVacancy]);
  }
}
