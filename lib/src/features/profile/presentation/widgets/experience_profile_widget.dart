import 'package:flutter/material.dart';
import 'package:muit_app/src/features/profile/data/models/experience_model.dart';
import 'package:muit_app/utils/ui_utils.dart';

class ExperienceProfile extends StatelessWidget {
  const ExperienceProfile({super.key, this.exp});

  final Experience? exp;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: CircleAvatar(backgroundColor: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Компания: ${UIStyle.getValueOrEmpty(exp?.company)}\n${UIStyle.getValueOrEmpty(exp?.experience)}",
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: CircleAvatar(radius: 6, backgroundColor: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "${UIStyle.getValueOrEmpty(exp?.work)}\n${UIStyle.getValueOrEmpty(exp?.period)}",
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Описание: ${UIStyle.getValueOrEmpty(exp?.description, notSpecified: "Отсутствует")}",
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: ElevatedButton(
                style: UIStyle.styleButtonProfile,
                onPressed: () {},
                child: Text("Редактировать", style: UIStyle.styleProfileText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
