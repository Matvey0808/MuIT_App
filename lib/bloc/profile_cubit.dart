import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/model/profile_model.dart';

class ProfileCubit extends Cubit<Profile> {
  ProfileCubit() : super(
    Profile(name: "Matvey Gavrilyuk")
  );
}