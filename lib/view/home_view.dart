import 'package:flutter/material.dart';
import 'package:muit_app/widget/vacancy_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          VacancyWidget(name: "Android Developer"),
          VacancyWidget(name: "IOS Developer"),
          VacancyWidget(name: "ML Engineer"),
        ],
      )
    );
  }
}
