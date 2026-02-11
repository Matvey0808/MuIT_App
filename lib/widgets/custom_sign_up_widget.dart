import 'package:flutter/material.dart';
import 'package:serviceapp/models/colors_model.dart';

class CustomSignUpWidget extends StatelessWidget {
  final ColorsApp colors;

  const CustomSignUpWidget({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(0)
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.only(bottom: 1)
        ),
      ),
    );
  }
}
