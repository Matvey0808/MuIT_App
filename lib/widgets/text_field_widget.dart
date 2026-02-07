import 'package:flutter/material.dart';
import 'package:serviceapp/models/colors_model.dart';

class TextFieldWidgetName extends StatefulWidget {
  final ColorsApp colors;

  const TextFieldWidgetName({super.key, required this.colors});

  @override
  State<TextFieldWidgetName> createState() => _TextFieldWidgetNameState();
}

class _TextFieldWidgetNameState extends State<TextFieldWidgetName> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerName = TextEditingController();

    final size = MediaQuery.of(context).size;
    final width = size.width;

    final isTable = width >= 600;

    return TextField(
      controller: _controllerName,
      cursorColor: Colors.blueGrey[400],
      decoration: InputDecoration(
        hintText: "Full Name",
        hintStyle: TextStyle(
          fontSize: isTable ? width * 0.08 : width * 0.04,
          color: widget.colors.black38,
        ),
        prefixIcon: Icon(
          Icons.person_outline,
          size: width * 0.06,
          color: widget.colors.black38,
        ),
        filled: true,
        fillColor: widget.colors.white0xFFE3E3E3,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 0,
            color: widget.colors.white0xFFE3E3E3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 0,
            color: widget.colors.white0xFFE3E3E3,
          ),
        ),
      ),
    );
  }
}

class TextFieldWidgetEmail extends StatefulWidget {
  final ColorsApp colors;

  const TextFieldWidgetEmail({super.key, required this.colors});

  @override
  State<TextFieldWidgetEmail> createState() => _TextFieldWidgetEmailState();
}

class _TextFieldWidgetEmailState extends State<TextFieldWidgetEmail> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerEmail = TextEditingController();
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final isTable = width >= 600;

    return TextField(
      controller: _controllerEmail,
      cursorColor: Colors.blueGrey[400],
      decoration: InputDecoration(
        hintText: "Enter Your Email",
        hintStyle: TextStyle(
          fontSize: isTable ? width * 0.08 : width * 0.04,
          color: widget.colors.black38,
        ),
        prefixIcon: Icon(
          Icons.email_outlined,
          size: width * 0.06,
          color: widget.colors.black38,
        ),
        filled: true,
        fillColor: widget.colors.white0xFFE3E3E3,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 0,
            color: widget.colors.white0xFFE3E3E3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 0,
            color: widget.colors.white0xFFE3E3E3,
          ),
        ),
      ),
    );
  }
}

class TextFieldWidgetPassword extends StatefulWidget {
  final ColorsApp colors;

  const TextFieldWidgetPassword({super.key, required this.colors});

  @override
  State<TextFieldWidgetPassword> createState() =>
      _TextFieldWidgetPasswordState();
}

class _TextFieldWidgetPasswordState extends State<TextFieldWidgetPassword> {
  bool isPasswordVisible = true;
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final isTable = width >= 600;

    return TextField(
      controller: _controllerPassword,
      obscureText: isPasswordVisible,
      cursorColor: Colors.blueGrey[400],
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          fontSize: isTable ? width * 0.08 : width * 0.04,
          color: widget.colors.black38,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            size: width * 0.06,
            color: widget.colors.black38,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          size: width * 0.06,
          color: widget.colors.black38,
        ),
        filled: true,
        fillColor: widget.colors.white0xFFE3E3E3,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 0,
            color: widget.colors.white0xFFE3E3E3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 0,
            color: widget.colors.white0xFFE3E3E3,
          ),
        ),
      ),
    );
  }
}
