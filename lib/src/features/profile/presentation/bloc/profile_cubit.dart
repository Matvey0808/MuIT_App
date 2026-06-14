import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/src/features/profile/data/models/profile_appbar_model.dart';

class ProfileCubit extends Cubit<ProfileAppBar> {
  ProfileCubit() : super(
    ProfileAppBar(name: "Matvey Gavrilyuk", appBarOpacity: 0.0)
  );

  void updateOpacityAppBar(double offset) {
    double maxScroll = 100.0;

    double newOpacity = offset / maxScroll;
    newOpacity = newOpacity.clamp(0.0, 1.0);

    if ((newOpacity - state.appBarOpacity).abs() > 0.01) {
      emit(state.copyWith(appBarOpacity: newOpacity));
    }
  }
}