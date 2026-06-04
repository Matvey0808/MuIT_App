import 'package:flutter/material.dart';

class InfoProfileCard extends StatelessWidget {
  const InfoProfileCard({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(elevation: 0, child: SizedBox(width: 70, height: 70)),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.status,
    required this.city,
    required this.target,
  });

  final String status;
  final String city;
  final String target;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Статус поиска: $status"),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Город проживания: $city"),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Что интересно: $target"),
                ),
              ),
            ],
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
  });

  final String? company;
  final String? experience;
  final String? work;
  final String? period;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(backgroundColor: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Компания: $company\n$experience"),
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
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text("$work\n$period"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Описание: Отсутствует"),
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}
