import 'package:flutter/material.dart';
import 'package:muit_app/src/features/profile/data/models/status_model.dart';
import 'package:muit_app/utils/ui_utils.dart';

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
              child: Text("Статус поиска: ${UIStyle.getValueOrEmpty(status?.status)}")
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Город проживания: ${UIStyle.getValueOrEmpty(status?.city)}")
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Что интересно: ${UIStyle.getValueOrEmpty(status?.target)}")
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: ElevatedButton(
                style: UIStyle.styleButtonProfile,
                onPressed: () {},
                child: Text(
                  "Редактировать",
                  style: UIStyle.styleProfileText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
