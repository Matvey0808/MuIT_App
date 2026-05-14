import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/bloc/vacancy_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  static final TextEditingController controllerSearch = TextEditingController();

  static final focusedAndEnableBorderTF = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(width: 2, color: Colors.black12)
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerSearch,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        hintText: "search",
        focusedBorder: focusedAndEnableBorderTF,
        enabledBorder: focusedAndEnableBorderTF
      ),
      onChanged: (value) {
        context.read<VacancyCubit>().search(controllerSearch);
      },
    );
  }
}