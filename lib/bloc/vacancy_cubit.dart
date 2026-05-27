import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/bloc/vacancy_state.dart';

class VacancyCubit extends Cubit<List<VacancyState>> {
  static final List<VacancyState> allVacancy = [
    VacancyState(name: "Android Developer", pay: "90 000", city: "Барнаул"),
    VacancyState(name: "IOS Developer", pay: "110 000", city: "Москва"),
    VacancyState(name: "ML Engineer", pay: "130 000", city: "Москва"),
  ];

  VacancyCubit() : super([...allVacancy]);

  void search(String searchTitle) {
    List searchVacancy = [];
    searchVacancy = allVacancy.where((vacancy) {
      final nameLower = vacancy.name.toLowerCase();
      return nameLower.contains(searchTitle.toLowerCase());
    }).toList();

    emit([...searchVacancy]);
  }

  void toggleFilter(String filtersName, List selectedVacancy) {
    if (!selectedVacancy.contains(filtersName)) {
      selectedVacancy.add(filtersName);
    } else {
      selectedVacancy.remove(filtersName);
    }

    emit(state);
  }

  void applyFilter(List selectedVacancy) {
    if (selectedVacancy.isEmpty) {
      emit(List.from(allVacancy));
      return;
    }
    
    final filtered = allVacancy.where((vacancy) {
      final nameLower = vacancy.name.toLowerCase();

      return selectedVacancy.any((filter) {
      return nameLower.contains(filter.toLowerCase());
      });
    }).toList();
    emit(filtered);
  }
}
