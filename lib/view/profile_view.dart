import 'package:flutter/material.dart';
import 'package:muit_app/widget/card_profile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.experience});

  final String? experience;

  @override
  Widget build(BuildContext context) {
    final experienceText = (experience != null) ? experience : "Не указан";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text("Профиль"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: InfoProfileCard(name: "Matvey Gavrilyuk"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Статус работы",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: StatusCard(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Контакты",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 60,
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ContactCard(
                      userConnection: "+7 923 912 76 12",
                      connection: "Телефон",
                      iconConnection: Icon(Icons.phone, size: 34),
                    ),
                    SizedBox(width: 10),
                    ContactCard(
                      userConnection: "mgavr26@gmail.com",
                      connection: "Почта",
                      iconConnection: Icon(Icons.email, size: 34),
                    ),
                    SizedBox(width: 10),
                    ContactCard(
                      userConnection: "@mutablevariable",
                      connection: "Telegram",
                      iconConnection: Icon(Icons.telegram, size: 34),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Опыт работы: $experienceText",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ExperienceCard(
                experience: "2 года",
                work: "DevOps",
                period: "Июль 2023 - август 2025",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
