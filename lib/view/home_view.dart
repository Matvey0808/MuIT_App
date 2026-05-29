import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/bloc/vacancy_cubit.dart';
import 'package:muit_app/bloc/vacancy_state.dart';
import 'package:muit_app/widget/dialog_filtered_widget.dart';
import 'package:muit_app/widget/search_widget.dart';
import 'package:muit_app/widget/vacancy_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                            Expanded(
                              child: SearchWidget(),
                            ),
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
                            ? Center(child: Text("Ничего не найдено"))
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
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Container(
              height: 60,
              width: width * 0.5,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, size: 30)
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.chrome_reader_mode, size: 30)
                  )  
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
