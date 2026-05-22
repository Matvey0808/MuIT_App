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
    "Ios": false,
    "Web": false,
  };
  List<String> filtersName = ["Android", "Ios", "Web"];
  List<String> emptyList = [];
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
                    isActive[filters] = value!;
                    if (!emptyList.contains(filters)) {
                      print("В списке есть $filters");
                      emptyList.add(filters);
                      print(emptyList);
                    } else {
                      emptyList.remove(filters);
                      print(emptyList);
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
          child: ElevatedButton(onPressed: () {}, child: Text("Применить")),
        ),
      ],
    );
  }
}
