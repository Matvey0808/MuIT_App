import 'package:flutter/material.dart';

class VacancyWidget extends StatelessWidget {
  const VacancyWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.black12,
      elevation: 0,
      child: SizedBox(
        height: height * 0.25,
        child: Text(name),
      ),
    );
  }
}