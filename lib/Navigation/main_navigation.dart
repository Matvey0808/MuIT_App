import 'package:flutter/material.dart';
import 'package:muit_app/view/home_view.dart';
import 'package:muit_app/view/profile_view.dart';
import 'package:muit_app/view/settings_view.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int cur = 0;
  @override
  Widget build(BuildContext context) {
    final iconNavBar = [
      Icons.settings,
      Icons.chrome_reader_mode,
      Icons.person
    ];

    final view = [SettingsView(), HomeView(), ProfileView()];

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: cur, children: view),
          Positioned(
            left: 68,
            right: 68,
            bottom: 30,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(iconNavBar.length, (index) {
                  final selected = index == cur;
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        cur = index;
                      });
                    },
                    icon: Icon(
                      iconNavBar[index],
                      size: 32,
                      color: selected ? Colors.black54 : Colors.black26,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
