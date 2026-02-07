import 'package:flutter/material.dart';
import 'package:serviceapp/data/colors_data.dart';
import 'package:serviceapp/models/colors_model.dart';
import 'package:serviceapp/widgets/custom_sign_up_widget.dart';
import 'package:serviceapp/widgets/text_field_widget.dart';

class SignInView extends StatefulWidget {
  final ColorsApp colors;

  const SignInView({super.key, required this.colors});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final isTable = width >= 600;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.2),
            Padding(
              padding: EdgeInsets.only(right: width * 0.35),
              child: Text(
                "Login Your\nAccount",
                style: TextStyle(
                  fontSize: isTable ? width * 0.2 : width * 0.1,
                  color: widget.colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: TextFieldWidgetEmail(colors: ColorApp),
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: TextFieldWidgetPassword(colors: ColorApp),
            ),
            SizedBox(height: height * 0.015),
            Padding(
              padding: EdgeInsets.only(left: width * 0.55),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 15,
                    color: widget.colors.black0xFF141718,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: widget.colors.black,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.36,
                  vertical: height * 0.02,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: isTable ? width * 0.08 : width * 0.04,
                  color: widget.colors.white0xFFE3E3E3,
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create New Account?",
                  style: TextStyle(
                    fontSize: isTable ? 0.08 : width * 0.04,
                    color: widget.colors.black26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: width * 0.01),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: isTable ? width * 0.8 : width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.035),
            CustomSignUpWidget(colors: ColorApp),
            SizedBox(height: height * 0.015),
            Text(
              "Continue With Accounts",
              style: TextStyle(
                fontSize: isTable ? width * 0.9 : width * 0.045,
                color: widget.colors.black26,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.02),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(65, 212, 69, 56),
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: height * 0.07,
                  vertical: width * 0.03,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              child: Text(
                "Google",
                style: TextStyle(
                  fontSize: height * 0.017,
                  color: Color(0xFFD44638),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
