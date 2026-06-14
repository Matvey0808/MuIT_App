import 'package:flutter/material.dart';
import 'package:muit_app/src/features/profile/data/models/contact_model.dart';
import 'package:muit_app/src/features/profile/presentation/bloc/contact_cubit.dart';
import 'package:muit_app/utils/ui_utils.dart';

class BottomSheetProfileIcon extends StatelessWidget {
  const BottomSheetProfileIcon({super.key, required this.iconContacts});

  final Icon iconContacts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: iconContacts),
    );
  }
}

class BottomSheetDialog extends StatelessWidget {
  const BottomSheetDialog({super.key, required this.cubit});

  final ContactCubit cubit;
  static final TextEditingController _controllerContact = TextEditingController();
  static final options = [
      ContactsOption(ContactType.phone, Icon(Icons.phone, size: 32)),
      ContactsOption(ContactType.email, Icon(Icons.email, size: 32)),
      ContactsOption(ContactType.telegram, Icon(Icons.telegram, size: 32)),
    ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (contextSheet) {
            return SizedBox(
              width: double.infinity,
              height: 230,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Card(
                              color: Colors.black12,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              child: SizedBox(width: 30, height: 8),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: options.map((option) {
                              return GestureDetector(
                                onTap: () {
                                  if (_controllerContact.text.isNotEmpty) {
                                    cubit.addContacts(
                                      option.type,
                                      _controllerContact.text,
                                    );
                                    _controllerContact.clear();
                                    Navigator.pop(contextSheet);
                                  }
                                },
                                child: BottomSheetProfileIcon(
                                  iconContacts: option.iconContact,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(24.0),
                          child: TextField(
                            controller: _controllerContact,
                            decoration: InputDecoration(
                              hintText: "Contact...",
                              filled: true,
                              focusedBorder: UIStyle.focusedAndEnable,
                              enabledBorder: UIStyle.focusedAndEnable,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(child: Icon(Icons.add, size: 28)),
      ),
    );
  }
}
