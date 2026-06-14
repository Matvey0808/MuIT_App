import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/src/features/home/presentation/bloc/vacancy_cubit.dart';
import 'package:muit_app/utils/ui_utils.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  static final TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerSearch,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        hintText: "search",
        focusedBorder: UIStyle.focusedAndEnable,
        enabledBorder: UIStyle.focusedAndEnable,
      ),
      onChanged: (value) {
        context.read<VacancyCubit>().search(controllerSearch.text);
      },
    );
  }
}