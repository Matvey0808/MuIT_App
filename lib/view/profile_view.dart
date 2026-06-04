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
          scrollDirection: Axis.vertical,
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
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 60,
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        ContactCard(
                          number: "+7 923 912 76 12",
                          connection: "Телефон",
                          iconConnection: Icon(Icons.phone)
                        ),
                        SizedBox(width: 10)
                      ],
                    );
                  },
                )
              )
            ),
          ],
        )
      ),
    );
  }
}
