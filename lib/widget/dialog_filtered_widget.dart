import 'package:flutter/material.dart';
import 'package:muit_app/bloc/vacancy_cubit.dart';

void showDialogFilter(BuildContext context, VacancyCubit cubit) {
  showDialog(
    context: context,
    builder: (dialogFilter) {
      return DialogFilteredWidget(cubit: cubit);
    },
  );
}

class DialogFilteredWidget extends StatelessWidget {
  const DialogFilteredWidget({super.key, required this.cubit});
  final VacancyCubit cubit;

  static const List<String> filtersName = ["Android", "iOS", "Web"];
  static final List selectedVacancy = [];

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
                    value: selectedVacancy.contains(filters),
                    onChanged: (_) {
                      setState(() {
                        cubit.toggleFilter(filters, selectedVacancy);
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
        Center(
          child: ElevatedButton(
            onPressed: () {
              cubit.applyFilter(
                selectedVacancy
              );
              Navigator.pop(context);
            },
            child: Text("Применить"),
          ),
        ),
      ],
    );
  }
}
