import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serviceapp/models/splash_model.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/viewmodels/splash_view_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashView extends StatelessWidget {
  final SplashModels model;

  const SplashView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final isTable = width >= 600;
    final viewModel = context.watch<SplashViewModel>();

    if (!viewModel.isLoading && viewModel.nextRoute != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, viewModel.nextRoute!);
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: SvgPicture.asset(
                  model.logo,
                  width: isTable ? 220 : 160,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  viewModel.isLoading
                      ? SpinKitCircle(
                        color: Colors.black,
                        size: width * 0.09,
                        )
                      : Text(""),
                  Text(
                    model.title,
                    style: GoogleFonts.acme(
                      fontSize: isTable ? 110 : 50,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    model.version,
                    style: GoogleFonts.acme(
                      fontSize: isTable ? 30 : 15,
                      color: Colors.black,
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
