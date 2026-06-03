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
