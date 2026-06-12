import 'package:flutter/material.dart';
import 'package:muit_app/src/features/home/presentation/bloc/vacancy_cubit.dart';

void showDialogFilter(BuildContext context, VacancyCubit cubit) {
  final List<String> savedFiltersList = List<String>.from(
    cubit.selectedVacancy,
  );
  showDialog(
    context: context,
    builder: (dialogFilter) {
      return DialogFilteredWidget(cubit: cubit);
    },
  ).then((value) {
    if (value == null || value == false) {
      final copyFiltersList = List<String>.from(cubit.selectedVacancy);

      for (var filters in copyFiltersList) {
        if (cubit.selectedVacancy.contains(filters)) {
          cubit.toggleFilter(filters);
        }
      }

      for (var filters in savedFiltersList) {
        if (!cubit.selectedVacancy.contains(filters)) {
          cubit.toggleFilter(filters);
          cubit.applyFilter();
        }
      }

      if (value == false) {
        for (var resetFilters in savedFiltersList) {
          if (cubit.selectedVacancy.contains(resetFilters)) {
            cubit.resetFilter();
            cubit.toggleFilter(resetFilters);
          }
        }
      }
    }
  });
}

class DialogFilteredWidget extends StatelessWidget {
  const DialogFilteredWidget({super.key, required this.cubit});
  final VacancyCubit cubit;

  static const List<String> filtersName = ["Android", "iOS", "Web"];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 10), child: Text("Фильтры")),
          Divider(height: 0, color: Colors.black),
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: filtersName.map((filters) {
                  return CheckboxListTile(
                    title: Text(filters),
                    value: cubit.selectedVacancy.contains(filters),
                    onChanged: (bool? value) {
                      setState(() {
                        cubit.toggleFilter(filters);
                      });
                    },
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            cubit.applyFilter();
            Navigator.pop(context, false);
          },
          child: Text("Сбросить"),
        ),
        ElevatedButton(
          onPressed: () {
            cubit.applyFilter();
            Navigator.pop(context, true);
          },
          child: Text("Применить"),
        ),
      ],
    );
  }
}
