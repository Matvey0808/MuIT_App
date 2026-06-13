import 'package:flutter/material.dart';

class UIStyle {
  static const OutlineInputBorder focusedAndEnable = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(width: 2, color: Colors.black12),
  );

  static const TextStyle averageText = TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w400
  );
}
