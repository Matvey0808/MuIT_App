import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serviceapp/models/colors_model.dart';
import 'package:serviceapp/widgets/custom_sign_up_widget.dart';

class RegistrationView extends StatelessWidget {
  final ColorsApp colors;

  const RegistrationView({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.16),
                Center(
                  child: SvgPicture.asset(
                    "assets/images/Logo.svg",
                    width: constraints.maxHeight * 0.2,
                    colorFilter: ColorFilter.mode(
                      colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.03),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Welcome to MuIT",
                        style: TextStyle(
                          fontSize: constraints.maxHeight * 0.05,
                          color: colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.07),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.black0xFF141718,
                          padding: EdgeInsets.symmetric(
                            vertical: constraints.maxWidth * 0.05,
                            horizontal: constraints.maxHeight * 0.21,
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.02,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.03),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.white0xFFE3E3E3,
                          padding: EdgeInsets.symmetric(
                            vertical: constraints.maxWidth * 0.05,
                            horizontal: constraints.maxHeight * 0.2,
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.02,
                            color: colors.black26,
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      CustomSignUpWidget(colors: colors),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      Text(
                        "Continue With Accounts",
                        style: TextStyle(
                          fontSize: constraints.maxHeight * 0.025,
                          color: colors.black38,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.03),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(65, 212, 69, 56),
                          padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxHeight * 0.08,
                            vertical: constraints.maxWidth * 0.04,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Google",
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.05,
                            color: Color(0xFFD44638),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
