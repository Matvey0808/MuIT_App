import 'package:flutter/material.dart';
import 'package:muit_app/utils/ui_utils.dart';

void main() {
  runApp(MaterialApp(home: RegistrationView()));
}

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: size.height * 0.2),
                child: Text("Create account", style: UIStyle.styleAuthTest),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, bottom: 5),
                child: Text("Username"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "username...",
                  focusedBorder: UIStyle.focusedAndEnable,
                  enabledBorder: UIStyle.focusedAndEnable,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 5),
                  child: Text("Password"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "password...",
                  focusedBorder: UIStyle.focusedAndEnable,
                  enabledBorder: UIStyle.focusedAndEnable,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: ElevatedButton(
                  style: UIStyle.styleButtonAuth,
                  onPressed: () {},
                  child: Text("Log in", style: UIStyle.styleAuthText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
