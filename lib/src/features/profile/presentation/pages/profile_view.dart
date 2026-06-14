import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/src/features/profile/data/models/contact_model.dart';
import 'package:muit_app/src/features/profile/presentation/bloc/contact_cubit.dart';
import 'package:muit_app/src/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:muit_app/src/features/profile/data/models/profile_appbar_model.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/appbar_opacity_widget.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/bottomSheet_profile_widget.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/contacts_profile_widget.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/experience_profile_widget.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/info_user_widget.dart';
import 'package:muit_app/src/features/profile/presentation/widgets/status_profile_widget.dart';
import 'package:muit_app/utils/ui_utils.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, this.experience});

  final String? experience;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();

  void scroll() {
    context.read<ProfileCubit>().updateOpacityAppBar(_scrollController.offset);
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
    context.read<ProfileCubit>().updateOpacityAppBar(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileAppBar>(
        builder: (context, state) {
          final opacityAppBar = ProfileAppBar(
            name: state.name,
            appBarOpacity: state.appBarOpacity,
          );
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
                                style: UIStyle.styleProfileText,
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
                                style: UIStyle.styleProfileText,
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
                                            final contactCubit =
                                                contextBottomSheet
                                                    .read<ContactCubit>();
                                            return BottomSheetDialog(
                                              cubit: contactCubit,
                                            );
                                          },
                                        );
                                      }
                                      final obj = state[index];
                                      return Row(
                                        children: [
                                          ContactProfile(contacts: obj),
                                          SizedBox(width: 10),
                                        ],
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
                                "Опыт работы: ${UIStyle.getValueOrEmpty(widget.experience, notSpecified: "Не указан")}",
                                style: UIStyle.styleProfileText,
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
                AppBarOpacity(profileAppBar: opacityAppBar),
              ],
            ),
          );
        },
      ),
    );
  }
}
