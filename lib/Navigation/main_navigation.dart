import 'package:flutter/material.dart';
import 'package:muit_app/view/home_view.dart';
import 'package:muit_app/view/settings_view.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _cur = 0;
  @override
  Widget build(BuildContext context) {
    final iconNavBar = [
      Icon(Icons.settings, size: 32),
      Icon(Icons.chrome_reader_mode, size: 32),
      Icon(Icons.person, size: 32)
    ];

    final view = [
      SettingsView(),
      HomeView(),
    ];
    return Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: _cur,
              children: view
            ),
            Positioned(
              left: 68,
              right: 68,
              bottom: 30,
              top: 800,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(24)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(iconNavBar.length, (index) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          _cur = index;
                        });
                      },
                      icon: iconNavBar[index],
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      );
  }
}
