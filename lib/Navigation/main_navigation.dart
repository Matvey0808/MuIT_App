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

    final views = [
      FadeSlideTransition(
        visible: cur == 0,
        child: const SettingsView(key: PageStorageKey('settings')),
      ),
      FadeSlideTransition(
        visible: cur == 1,
        child: const HomeView(key: PageStorageKey('home')),
      ),
      FadeSlideTransition(
        visible: cur == 2,
        child: const ProfileView(key: PageStorageKey('profile')),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: cur, children: views),
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

// FIXME: Временный класс анимации при переключении экранов. Нужно заменить на свой
class FadeSlideTransition extends StatefulWidget {
  const FadeSlideTransition({
    super.key,
    required this.child,
    required this.visible,
  });

  final Widget child;
  final bool visible;

  @override
  State<FadeSlideTransition> createState() => _FadeSlideTransitionState();
}

class _FadeSlideTransitionState extends State<FadeSlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    if (widget.visible) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant FadeSlideTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.visible == widget.visible) return;
    if (widget.visible) {
      _controller.forward(from: 0.5);
    } else {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: widget.child,
      ),
    );
  }
}
