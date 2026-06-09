import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/model/profile_model.dart';

class ContactCubit extends Cubit<List<Contacts>> {
  ContactCubit() : super([
    Contacts(
      contact: "Телефон",
      userContact: "+7 923 912 76 12",
      iconContact: Icon(Icons.phone),
    ),
    Contacts(
      contact: "Телефон",
      userContact: "+7 923 912 76 12",
      iconContact: Icon(Icons.phone),
    ),
  ]);

  void addContacts() {

  }
}