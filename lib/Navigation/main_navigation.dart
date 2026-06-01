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
  int cur = 1;

  @override
  Widget build(BuildContext context) {
    final iconNavBar = [Icons.settings, Icons.chrome_reader_mode, Icons.person];

    final view = [
      SettingsView(key: ValueKey(cur)),
      HomeView(key: ValueKey(cur)),
      ProfileView(key: ValueKey(cur)),
    ];

    final animNavView = view.map((anim) {
      return AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -4),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: FadeTransition(opacity: animation, child: child),
        ),
        child: view[cur],
      );
    }).toList();

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: cur, children: animNavView),
          Positioned(
            left: 98,
            right: 98,
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
                  return AnimatedSlide(
                    offset: selected ? Offset(0, -0.1) : Offset(0, 0),
                    duration: const Duration(milliseconds: 130),
                    child: AnimatedScale(
                      scale: selected ? 1.5 : 1.3,
                      duration: const Duration(milliseconds: 130),
                      child: IconButton(
                        style: IconButton.styleFrom(
                          highlightColor: Colors.transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            cur = index;
                          });
                        },
                        icon: Icon(
                          iconNavBar[index],
                          color: selected ? Colors.black54 : Colors.black26,
                        ),
                      ),
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
