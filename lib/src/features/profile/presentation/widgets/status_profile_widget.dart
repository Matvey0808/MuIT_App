import 'package:flutter/material.dart';
import 'package:muit_app/src/features/profile/data/models/status_model.dart';

class StatusProfile extends StatelessWidget {
  const StatusProfile({super.key, this.status});

  final Status? status;

  @override
  Widget build(BuildContext context) {
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
              child: (status?.status != null)
                  ? Text("Статус поиска: ${status?.status}")
                  : Text("Статус поиска: Не указано"),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (status?.city != null)
                  ? Text("Город проживания: ${status?.city}")
                  : Text("Город проживания: Не указано"),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (status?.target != null) ? Text("Что интересно: ${status?.target}") : Text("Что интересно: Не указано"),
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
