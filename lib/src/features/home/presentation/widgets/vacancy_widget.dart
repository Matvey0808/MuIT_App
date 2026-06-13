import 'package:flutter/material.dart';
import 'package:muit_app/utils/ui_utils.dart';

class VacancyWidget extends StatelessWidget {
  const VacancyWidget({
    super.key,
    required this.name,
    required this.pay,
    required this.city,
  });
  final String name;
  final String pay;
  final String city;

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
              child: Text(name, style: UIStyle.averageText),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("От $pay", style: UIStyle.averageText),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(city, style: UIStyle.averageText),
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
