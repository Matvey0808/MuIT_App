import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/bloc/profile_cubit.dart';
import 'package:muit_app/model/profile_model.dart';
import 'package:muit_app/widget/card_profile_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, this.experience});

  final String? experience;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with WidgetsBindingObserver{
  final ScrollController _scrollController = ScrollController();
  late final ProfileCubit cubit;

  void scroll() {
    cubit.updateOpacityAppBar(_scrollController.offset);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    cubit = ProfileCubit();
    _scrollController.addListener(scroll);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    cubit.updateOpacityAppBar(0.0);
  }

  @override
  Widget build(BuildContext context) {
    final experienceText = (widget.experience != null)
        ? widget.experience
        : "Не указан";
    return BlocProvider.value(
      value: cubit,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<ProfileCubit, Profile>(
            builder: (context, state) {
              return Stack(
                children: [
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InfoProfileCard(profile: state),
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
                                  itemCount: 4,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final contacts = [
                                      ContactCard(
                                        userConnection: "+7 923 912 76 12",
                                        connection: "Телефон",
                                        iconConnection: Icon(
                                          Icons.phone,
                                          size: 34,
                                        ),
                                      ),
                                      ContactCard(
                                        userConnection: "mgavr26@gmail.com",
                                        connection: "Почта",
                                        iconConnection: Icon(
                                          Icons.email,
                                          size: 34,
                                        ),
                                      ),
                                      ContactCard(
                                        userConnection: "@mutablevariable",
                                        connection: "Telegram",
                                        iconConnection: Icon(
                                          Icons.telegram,
                                          size: 34,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(Icons.add, size: 28),
                                          ),
                                        ),
                                      ),
                                    ];
                                    return Row(
                                      children: [
                                        contacts[index],
                                        SizedBox(width: 10),
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
                        color: Colors.white.withValues(
                          alpha: state.appBarOpacity,
                        ),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black.withValues(
                              alpha: state.appBarOpacity,
                            ),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Профиль",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withValues(
                                  alpha: state.appBarOpacity,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "${state.name}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withValues(
                                  alpha: state.appBarOpacity,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
