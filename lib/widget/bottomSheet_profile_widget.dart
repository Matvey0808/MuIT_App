import 'package:flutter/material.dart';

class BottomSheetProfile extends StatelessWidget {
  const BottomSheetProfile({super.key, required this.iconContacts});

  final Icon iconContacts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: iconContacts,
      ),
    );
  }
}