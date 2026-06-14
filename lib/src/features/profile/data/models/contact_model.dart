import 'package:flutter/material.dart';

enum ContactType { phone, email, telegram }

class Contacts {
  final ContactType type;
  final Icon iconContact;
  final String label;
  final String value;

  Contacts({
    required this.type,
    required this.iconContact,
    required this.label,
    required this.value,
  });

  Contacts copyWith({
    ContactType? type,
    Icon? iconContact,
    String? label,
    String? value,
  }) {
    return Contacts(
      type: type ?? this.type,
      iconContact: iconContact ?? this.iconContact,
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }
}

class ContactsOption {
  final ContactType type;
  final Icon iconContact;

  ContactsOption(this.type, this.iconContact);
}