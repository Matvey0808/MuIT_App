import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/src/features/profile/presentation/bloc/contact_cubit.dart';
import 'package:muit_app/src/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:muit_app/src/features/profile/data/models/profile_model.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/bottomSheet_profile_widget.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/contacts_profile_widget.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/experience_profile_widget.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/info_user_widget.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/status_profile_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, this.experience});

  final String? experience;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  late final ProfileCubit cubit;

  void scroll() {
    cubit.updateOpacityAppBar(_scrollController.offset);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => ContactCubit()),
      ],
      child: SafeArea(
        child: BlocBuilder<ProfileCubit, Profile>(
          builder: (context, state) {
            return Scaffold(
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
                              child: InfoUserProfile(profile: state),
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
                              child: StatusProfile(),
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
                            BlocBuilder<ContactCubit, List<Contacts>>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: SizedBox(
                                    height: 60,
                                    child: ListView.builder(
                                      itemCount: state.length + 1,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        if (index == state.length) {
                                          return Builder(
                                            builder: (contextBottomSheet) {
                                              final contactCubit = contextBottomSheet.read<ContactCubit>();
                                              return BottomSheetDialog(cubit: contactCubit);
                                            },
                                          );
                                        }
                                        final obj = state[index];
                                        return Row(
                                          children: [
                                            ContactProfile(
                                              contacts: obj
                                            ),
                                            SizedBox(width: 10),
                                          ]
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
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
                              child: ExperienceProfile(),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
