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

    return Container(width: width * 1, height: height * 0.0096, child: Card());
  }
}
