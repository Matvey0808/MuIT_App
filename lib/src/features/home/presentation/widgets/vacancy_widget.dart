import 'package:flutter/material.dart';
import 'package:muit_app/src/features/home/data/models/vacancy_state.dart';
import 'package:muit_app/utils/ui_utils.dart';

class VacancyWidget extends StatelessWidget {
  const VacancyWidget({
    super.key,
    required this.vacancy
  });
  
  final VacancyState vacancy;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.black12,
      elevation: 0,
      child: SizedBox(
        height: height * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(vacancy.name, style: UIStyle.averageText),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("От ${vacancy.pay}", style: UIStyle.averageText),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(vacancy.city, style: UIStyle.averageText),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Откликнуться",
                  style: UIStyle.averageText
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
