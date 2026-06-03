import 'package:flutter/material.dart';
import 'package:muit_app/widget/card_profile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: StatusCard(status: "Активно ищу", city: "Казань", target: "Поиск работы"),
            )
          ],
        )
      ),
    );
  }
}
