import 'package:flutter/material.dart';
import 'package:muit_app/src/features/profile/data/models/contact_model.dart';

class ContactProfile extends StatelessWidget {
  const ContactProfile({super.key, required this.contacts});

  final Contacts contacts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 5, right: 15),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: contacts.iconContact,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("${contacts.label}\n${contacts.value}"),
          ),
        ],
      ),
    );
  }
}
