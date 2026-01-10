import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serviceapp/models/colors_model.dart';
import 'package:serviceapp/models/registration_model.dart';

class RegistrationView extends StatelessWidget {
  final RegistrationModels model;
  final ColorsApp colors;

  const RegistrationView({super.key, required this.model, required this.colors});

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
            SizedBox(height: height * 0.16),
              Center(
                child: SvgPicture.asset(
                  model.logo,
                  width: isTable ? width * 0.7 : width * 0.4,
                  colorFilter: ColorFilter.mode(
                    colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
            Expanded(
              child: Column(
                children: [
                  Text(
                    model.title1,
                    style: GoogleFonts.acme(
                      fontSize: isTable ? width * 0.2 : width * 0.1,
                      color: colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.08),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.black0xFF141718,
                      padding: EdgeInsets.symmetric(
                        vertical: width * 0.05,
                        horizontal: height * 0.17
                      ),
                      elevation: 0
                    ),
                    child: Text(
                      model.buttonLogIn,
                      style: TextStyle(
                        fontSize: height * 0.018,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.white0xFFE3E3E3,
                      padding: EdgeInsets.symmetric(
                        vertical: width * 0.05,
                        horizontal: height * 0.165
                      ),
                      elevation: 0
                    ),
                    child: Text(
                      model.buttonSignUp,
                      style: TextStyle(
                        fontSize: height * 0.018,
                        color: colors.black26
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Text(
                    model.title2,
                    style: TextStyle(
                      fontSize: height * 0.018,
                      color: colors.black38
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(65, 212, 69, 56),
                      padding: EdgeInsets.symmetric(
                        horizontal: height * 0.07,
                        vertical: width * 0.03
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 0
                    ),
                    child: Text(
                      model.buttonGoogle,
                      style: TextStyle(
                        fontSize: height * 0.017,
                        color: Color(0xFFD44638)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
