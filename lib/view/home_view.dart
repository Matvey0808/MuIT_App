import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/bloc/vacancy_cubit.dart';
import 'package:muit_app/bloc/vacancy_state.dart';
import 'package:muit_app/widget/vacancy_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return VacancyCubit();
      },
      child: Scaffold(
        body: BlocBuilder<VacancyCubit, List<VacancyState>>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final object = state[index];
                return VacancyWidget(
                  name: object.name,
                  pay: object.pay,
                  city: object.city
                );
              },
            );
          },
        ),
      ),
    );
  }
}
