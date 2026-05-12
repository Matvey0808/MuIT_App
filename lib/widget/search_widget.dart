import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  static final focusedAndEnableBorderTF = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(width: 2, color: Colors.black12)
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        hintText: "search",
        focusedBorder: focusedAndEnableBorderTF,
        enabledBorder: focusedAndEnableBorderTF
      ),
    );
  }
}