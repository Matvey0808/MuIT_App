import 'package:flutter/material.dart';
import 'package:muit_app/widget/card_profile_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, this.experience});

  final String? experience;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ScrollController _scrollController = ScrollController();
  double appBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(scroll);
  }

  void scroll() {
    double maxScroll = 100.0;

    double newOpacity = _scrollController.offset / maxScroll;
    newOpacity = newOpacity.clamp(0.0, 1.0);

    if (newOpacity != appBarOpacity) {
      setState(() {
        appBarOpacity = newOpacity;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(scroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final experienceText = (widget.experience != null)
        ? widget.experience
        : "Не указан";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: InfoProfileCard(name: "Matvey Gavrilyuk"),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "Статус работы",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: StatusCard(),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "Контакты",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                            itemCount: 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  ContactCard(
                                    userConnection: "+7 923 912 76 12",
                                    connection: "Телефон",
                                    iconConnection: Icon(Icons.phone, size: 34),
                                  ),
                                  SizedBox(width: 10),
                                  ContactCard(
                                    userConnection: "mgavr26@gmail.com",
                                    connection: "Почта",
                                    iconConnection: Icon(Icons.email, size: 34),
                                  ),
                                  SizedBox(width: 10),
                                  ContactCard(
                                    userConnection: "@mutablevariable",
                                    connection: "Telegram",
                                    iconConnection: Icon(
                                      Icons.telegram,
                                      size: 34,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "Опыт работы: $experienceText",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ExperienceCard(
                          experience: "2 года",
                          work: "DevOps",
                          period: "Июль 2023 - август 2025",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ExperienceCard(
                          experience: "2 года",
                          work: "DevOps",
                          period: "Июль 2023 - август 2025",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ExperienceCard(
                          experience: "2 года",
                          work: "DevOps",
                          period: "Июль 2023 - август 2025",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ExperienceCard(
                          experience: "2 года",
                          work: "DevOps",
                          period: "Июль 2023 - август 2025",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: appBarOpacity),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black.withValues(alpha: appBarOpacity),
                      width: 0.5
                    )
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Профиль",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withValues(alpha: appBarOpacity)
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Matvey Gavrilyuk",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withValues(alpha: appBarOpacity)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
