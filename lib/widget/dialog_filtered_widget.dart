import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  static List<String> filtersName = ["Android", "iOS", "Web"];
  static List<String> selectedVacancy = [];

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
                    onChanged: (bool? value) {
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
            onPressed: () => Navigator.pop(context),
            child: Text("Применить"),
          ),
        ),
      ],
    );
  }
}
