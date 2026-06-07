import 'package:flutter/material.dart';
import 'package:muit_app/model/profile_model.dart';

class InfoProfileCard extends StatelessWidget {
  const InfoProfileCard({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "${profile.name}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, this.status, this.city, this.target});

  final String? status;
  final String? city;
  final String? target;

  @override
  Widget build(BuildContext context) {
    final statusText = (status != null) ? status : "Не указано";
    final cityText = (city != null) ? city : "Не указано";
    final targetText = (target != null) ? target : "Не указано";

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Статус поиска: $statusText"),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Город проживания: $cityText"),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Что интересно: $targetText"),
            ),
          ),
          SizedBox(height: 30),
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

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.userConnection,
    required this.connection,
    required this.iconConnection,
  });

  final String userConnection;
  final String connection;
  final Icon iconConnection;

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
          Padding(padding: EdgeInsets.only(left: 5), child: iconConnection),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("$connection\n$userConnection"),
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
