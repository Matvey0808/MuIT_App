import 'package:flutter/material.dart';
import 'package:serviceapp/models/colors_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatefulWidget {
  final ColorsApp colors;

  const SignUpView({super.key, required this.colors});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    bool _password = true;

    @override
    void dispose() {
      super.dispose();
      _controller.dispose();
    }

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final isTable = width >= 600;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.15),
            Padding(
              padding: EdgeInsets.only(right: width * 0.35),
              child: Text(
                "Create your\nAccount",
                style: GoogleFonts.acme(
                  fontSize: isTable ? width * 0.2 : width * 0.1,
                  color: widget.colors.black,
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: TextField(
                controller: _controller,
                cursorColor: Colors.blueGrey[400],
                decoration: InputDecoration(
                  hintText: "full name",
                  hintStyle: GoogleFonts.acme(
                    fontSize: isTable ? width * 0.08 : width * 0.04,
                    color: widget.colors.black38
                  ),
                  filled: true,
                  fillColor: widget.colors.white0xFFE3E3E3,
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 0, color: widget.colors.white0xFFE3E3E3)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 0, color: widget.colors.white0xFFE3E3E3)
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
