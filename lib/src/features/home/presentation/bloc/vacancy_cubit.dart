import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/src/features/home/data/models/vacancy_state.dart';

class VacancyCubit extends Cubit<List<VacancyState>> {
  static final List<VacancyState> _allVacancy = [
    VacancyState(name: "Android Developer", pay: "90 000", city: "Барнаул"),
    VacancyState(name: "IOS Developer", pay: "110 000", city: "Москва"),
    VacancyState(name: "ML Engineer", pay: "130 000", city: "Москва"),
    VacancyState(name: "Frontend JS", pay: "70 000", city: "Казань"),
  ];
  final Set<String> _selectedVacancy = <String>{};

  Set<String> get selectedVacancy => _selectedVacancy;
  List<VacancyState> get allVacancy => _allVacancy;

  VacancyCubit() : super([..._allVacancy]);

  void search(String searchTitle) {
    List searchVacancy = [];
    searchVacancy = _allVacancy.where((vacancy) {
      final nameLower = vacancy.name.toLowerCase();
      return nameLower.contains(searchTitle.toLowerCase());
    }).toList();

    emit([...searchVacancy]);
  }

  void toggleFilter(String filtersName) {
    if (!_selectedVacancy.contains(filtersName)) {
      _selectedVacancy.add(filtersName);
    } else {
      _selectedVacancy.remove(filtersName);
    }
    emit(state);
  }

  void applyFilter() {
    if (_selectedVacancy.isEmpty) {
      emit(List.from(_allVacancy));
      return;
    }

    final filtered = _allVacancy.where((vacancy) {
      final nameLower = vacancy.name.toLowerCase();

      return _selectedVacancy.any((filter) {
        return nameLower.contains(filter.toLowerCase());
      });
    }).toList();
    emit(filtered);
  }
  void restoreFilters(dynamic value, List<String> copyFilters) {
    if (value == null || value == false) {
      final copyFiltersList = List<String>.from(selectedVacancy);

      for (var filters in copyFiltersList) {
        if (selectedVacancy.contains(filters)) {
          toggleFilter(filters);
        }
      }

      for (var filters in copyFilters) {
        if (!selectedVacancy.contains(filters)) {
          toggleFilter(filters);
          applyFilter();
        }
      }

      if (value == false) {
        for (var resetFilters in copyFilters) {
          if (selectedVacancy.contains(resetFilters)) {
            emit([..._allVacancy]);
            toggleFilter(resetFilters);
          }
        }
      }
    }
  }

  void resetFilters() {
    emit([..._allVacancy]);
  }
}
