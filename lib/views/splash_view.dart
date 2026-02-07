import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serviceapp/models/colors_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashView extends StatefulWidget {
  final ColorsApp colors;

  const SplashView({super.key, required this.colors});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool _isLoading = true;

  void initState() {
    super.initState();
    isLoading();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final isTable = width >= 600;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/Logo.svg",
                  width: isTable ? 220 : 160,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    widget.colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _isLoading
                      ? SpinKitCircle(
                          color: widget.colors.black,
                          size: width * 0.09,
                        )
                      : Text(""),
                  Text(
                    "MuIT",
                    style: TextStyle(
                      fontSize: isTable ? 110 : 50,
                      color: widget.colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Version 0.1",
                    style: TextStyle(
                      fontSize: isTable ? 30 : 16,
                      color: widget.colors.black,
                      fontWeight: FontWeight.w400,
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

  Future<void> isLoading() async {
    await Future.delayed(Duration(seconds: 3));
    _isLoading = false;

    if (_isLoading == false) {
      Navigator.pushNamed(context, '/registration');
    }
  }
}
