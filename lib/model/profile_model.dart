import 'package:flutter/material.dart';

class Profile {
  final String name;
  final double appBarOpacity;

  Profile({required this.name, required this.appBarOpacity});

  Profile copyWith({String? name, double? appBarOpacity}) {
    return Profile(
      name: name ?? this.name,
      appBarOpacity: appBarOpacity ?? this.appBarOpacity,
    );
  }
}

class Contacts {
  final String contact;
  final String userContact;
  final Icon iconContact;

  Contacts({
    required this.contact,
    required this.userContact,
    required this.iconContact,
  });

  Contacts copyWith({String? contact, String? userContact, Icon? iconContact}) {
    return Contacts(
      contact: contact ?? this.contact,
      userContact: userContact ?? this.contact,
      iconContact: iconContact ?? this.iconContact,
    );
  }
}
