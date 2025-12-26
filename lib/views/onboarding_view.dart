import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          onboardingPage("assets/images/testSprite.png", "xuy"),
          onboardingPage("assets/images/testSprite.png", "xuy"),
          onboardingPage("assets/images/testSprite.png", "xuy")
        ],
      ),
    );
  }

  Widget onboardingPage(String imagePath, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300),
        const SizedBox(height: 20),
        Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
