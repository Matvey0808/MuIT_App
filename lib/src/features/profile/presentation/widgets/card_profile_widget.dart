import 'package:flutter/material.dart';
import 'package:muit_app/src/features/profile/data/models/profile_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contacts});

  final Contacts contacts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 5, right: 15),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 5), child: contacts.iconContact),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("${contacts.label}\n${contacts.value}"),
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
    this.company,
    this.experience,
    this.work,
    this.period,
    this.description,
  });

  final String? company;
  final String? experience;
  final String? work;
  final String? period;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final companyText = (company != null) ? company : "Не указано";
    final experienceText = (experience != null) ? experience : "Не указано";
    final workText = (work != null) ? work : "Не указано";
    final periodText = (period != null) ? period : "Не указано";
    final descriptionText = (description != null) ? description : "Отсутствует";

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
                child: Text("Компания: $companyText\n$experienceText"),
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
                child: Text("$workText\n$periodText"),
              ),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Описание: $descriptionText"),
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Редактировать",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
