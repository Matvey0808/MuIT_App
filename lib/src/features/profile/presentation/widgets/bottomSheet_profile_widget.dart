import 'package:flutter/material.dart';
import 'package:muit_app/src/features/profile/presentation/bloc/contact_cubit.dart';
import 'package:muit_app/src/features/profile/data/models/profile_model.dart';

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
  static final TextEditingController _controllerContact =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final focusedAndEnableBorderTF = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2, color: Colors.black12),
    );

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
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_controllerContact.text.isNotEmpty) {
                                    cubit.addContacts(
                                      ContactType.phone,
                                      _controllerContact.text,
                                    );
                                    _controllerContact.clear();
                                    Navigator.pop(contextSheet);
                                  }
                                },
                                child: BottomSheetProfileIcon(
                                  iconContacts: Icon(Icons.phone, size: 32),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_controllerContact.text.isNotEmpty) {
                                    cubit.addContacts(
                                      ContactType.email,
                                      _controllerContact.text,
                                    );
                                    _controllerContact.clear();
                                    Navigator.pop(contextSheet);
                                  }
                                },
                                child: BottomSheetProfileIcon(
                                  iconContacts: Icon(Icons.email, size: 32),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_controllerContact.text.isNotEmpty) {
                                    cubit.addContacts(
                                      ContactType.telegram,
                                      _controllerContact.text,
                                    );
                                    _controllerContact.clear();
                                    Navigator.pop(contextSheet);
                                  }
                                },
                                child: BottomSheetProfileIcon(
                                  iconContacts: Icon(Icons.telegram, size: 32),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(24.0),
                          child: TextField(
                            controller: _controllerContact,
                            decoration: InputDecoration(
                              hintText: "Contact...",
                              filled: true,
                              focusedBorder: focusedAndEnableBorderTF,
                              enabledBorder: focusedAndEnableBorderTF,
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
