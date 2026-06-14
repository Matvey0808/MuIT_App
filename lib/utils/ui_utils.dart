import 'package:flutter/material.dart';

class UIStyle {
  static const OutlineInputBorder focusedAndEnable = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(width: 2, color: Colors.black12),
  );

  static const TextStyle averageText = TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle styleProfileText = TextStyle(
    fontSize: 14,
    color: Colors.black45,
    fontWeight: FontWeight.w600,
  );

  static ButtonStyle styleButtonProfile = ElevatedButton.styleFrom(
    backgroundColor: Colors.white54,
    elevation: 0,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static String getValueOrEmpty(String? value, {String notSpecified = "Не указано"}) {
    return value ?? notSpecified;
  } 
}
