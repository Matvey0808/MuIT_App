import 'package:flutter/material.dart';

void showDialogFilter(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogFilter) {
      return DialogFilteredWidget();
    },
  );
}

class DialogFilteredWidget extends StatefulWidget {
  const DialogFilteredWidget({super.key});

  @override
  State<DialogFilteredWidget> createState() => _DialogFilteredWidgetState();
}

class _DialogFilteredWidgetState extends State<DialogFilteredWidget> {
  final Map<String, bool> isActive = {
    "Android": false,
    "iOS": false,
    "Web": false,
  };
  List<String> filtersName = ["Android", "iOS", "Web"];
  List<String> selectedVacancy = [];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 10), child: Text("Фильтры")),
          Divider(height: 0, color: Colors.black),
          Column(
            children: filtersName.map((filters) {
              return CheckboxListTile(
                title: Text(filters),
                value: isActive[filters]!,
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null) {
                      isActive[filters] = value;
                      if (!selectedVacancy.contains(filters)) {
                        selectedVacancy.add(filters);
                      } else {
                        selectedVacancy.remove(filters);
                      }
                    } else {
                      throw Exception("Ошибка: value == null");
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Применить")
          ),
        ),
      ],
    );
  }
}
