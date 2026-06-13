import 'package:flutter/material.dart';
import 'package:muit_app/src/features/profile/data/models/profile_model.dart';
import 'package:muit_app/utils/ui_utils.dart';

class InfoUserProfile extends StatelessWidget {
  const InfoUserProfile({super.key, required this.profile});

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
      ),
    );
  }
}