import 'package:flutter/material.dart';
import 'package:muit_app/src/features/profile/data/models/profile_appbar_model.dart';

class AppBarOpacity extends StatelessWidget {
  const AppBarOpacity({super.key, required this.profileAppBar});

  final ProfileAppBar profileAppBar;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: profileAppBar.appBarOpacity),
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withValues(alpha: profileAppBar.appBarOpacity),
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Профиль",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withValues(alpha: profileAppBar.appBarOpacity),
                ),
              ),
            ),
            Center(
              child: Text(
                profileAppBar.name,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: profileAppBar.appBarOpacity),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
