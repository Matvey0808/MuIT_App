import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/src/features/home/presentation/bloc/vacancy_cubit.dart';
import 'package:muit_app/src/features/home/data/models/vacancy_state.dart';
import 'package:muit_app/src/features/home/presentation/widgets/dialog_filtered_widget.dart';
import 'package:muit_app/src/features/home/presentation/widgets/search_widget.dart';
import 'package:muit_app/src/features/home/presentation/widgets/vacancy_widget.dart';
import 'package:muit_app/utils/ui_utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return VacancyCubit();
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocBuilder<VacancyCubit, List<VacancyState>>(
              builder: (context, state) {
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(child: SearchWidget()),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: IconButton(
                                onPressed: () {
                                  final cubit = context.read<VacancyCubit>();
                                  showDialogFilter(context, cubit);
                                },
                                icon: Icon(Icons.filter_alt_outlined, size: 28),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: state.isEmpty
                            ? Center(
                                child: Text(
                                  "Ничего не найдено",
                                  style: UIStyle.averageText,
                                ),
                              )
                            : ListView.builder(
                                itemCount: state.length,
                                itemBuilder: (context, index) {
                                  final object = state[index];
                                  return VacancyWidget(
                                    name: object.name,
                                    pay: object.pay,
                                    city: object.city,
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
