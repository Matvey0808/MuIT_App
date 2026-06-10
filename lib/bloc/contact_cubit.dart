import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muit_app/model/profile_model.dart';

class ContactCubit extends Cubit<List<Contacts>> {
  ContactCubit() : super(_initialContacts);

  static final _initialContacts = <Contacts>[
    Contacts(
      type: ContactType.phone,
      iconContact: Icon(Icons.phone, size: 34),
      label: "Телефон",
      value: "Не указано"
    ),
    Contacts(
      type: ContactType.email,
      iconContact: Icon(Icons.email, size: 34),
      label: "Почта",
      value: "Не указано"
    ),
    Contacts(
      type: ContactType.telegram,
      iconContact: Icon(Icons.telegram, size: 34),
      label: "Telegram",
      value: "Не указано"
    ),
  ];

  void addContacts(ContactType type, String newValue) {
    final update = state.map((contacts) {
      if(contacts.type == type) {
        return contacts.copyWith(
          value: newValue,
        );
      } else {
        return contacts;
      }
    }).toList();
    emit(update);
  }
}