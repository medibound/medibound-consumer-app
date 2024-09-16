import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:intl/intl.dart';




const double _kItemExtent = 32.0;


class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({
    Key? key,
    required this.isFirstNameFocused,
    required this.firstNameController,
    required this.firstNameFocusController,
    required this.isMiddleNameFocused,
    required this.middleNameController,
    required this.middleNameFocusController,
    required this.isLastNameFocused,
    required this.lastNameController,
    required this.lastNameFocusController,
    required this.selectedGenderIndex,
    required this.genderOptions,
    required this.showDialog,
    required this.selectedGender,
    required this.onSelectedGenderChanged,
    required this.onDateChanged,
    required this.time,
  }) : super(key: key);

  final bool isFirstNameFocused;
  final TextEditingController firstNameController;
  final FocusNode firstNameFocusController;
  final bool isMiddleNameFocused;
  final TextEditingController middleNameController;
  final FocusNode middleNameFocusController;
  final bool isLastNameFocused;
  final TextEditingController lastNameController;
  final FocusNode lastNameFocusController;
  final int selectedGenderIndex;
  final List<String> genderOptions;
  final void Function(Widget child) showDialog;
  final int selectedGender;
  final ValueChanged<int> onSelectedGenderChanged;
  final ValueChanged<DateTime> onDateChanged;

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text("First Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isFirstNameFocused
                                ? MbColors.darkaccent(context)
                                : CupertinoTheme.of(context)
                                    .primaryContrastingColor)),
                    Container(
                      margin: EdgeInsets.only(top: 4, right: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: isFirstNameFocused
                                ? CupertinoTheme.of(context).primaryColor
                                : Colors.transparent,
                            width: 2.0), // Border color and width
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                      child: CupertinoTextField(
                        controller: firstNameController,
                        focusNode: firstNameFocusController,
                        placeholder: 'Martin',
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: isFirstNameFocused
                                ? Colors.transparent
                                : CupertinoTheme.of(context)
                                          .primaryContrastingColor
                                          .withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text("Middle Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isMiddleNameFocused
                                ? MbColors.darkaccent(context)
                                : CupertinoTheme.of(context)
                                    .primaryContrastingColor)),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: isMiddleNameFocused
                                ? CupertinoTheme.of(context).primaryColor
                                : Colors.transparent,
                            width: 2.0), // Border color and width
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                      child: CupertinoTextField(
                        controller: middleNameController,
                        focusNode: middleNameFocusController,
                        placeholder: 'Seamus',
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: isMiddleNameFocused
                                ? Colors.transparent
                                : CupertinoTheme.of(context)
                                          .primaryContrastingColor
                                          .withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Text("Last Name",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isLastNameFocused
                          ? MbColors.darkaccent(context)
                          : CupertinoTheme.of(context)
                              .primaryContrastingColor)),
              Container(
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isLastNameFocused
                          ? CupertinoTheme.of(context).primaryColor
                          : Colors.transparent,
                      width: 2.0), // Border color and width
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                child: CupertinoTextField(
                  controller: lastNameController,
                  focusNode: lastNameFocusController,
                  placeholder: 'McFly',
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: isLastNameFocused
                          ? Colors.transparent
                          : CupertinoTheme.of(context)
                                          .primaryContrastingColor
                                          .withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Text("Birth Date",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color:
                          CupertinoTheme.of(context).primaryContrastingColor)),
              Container(
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                child: SecondaryCupertinoButton(
                  onPressed: () => showDialog(
                    CupertinoDatePicker(
                      initialDateTime: time,
                      maximumDate: DateTime.now(),
                      maximumYear: DateTime.now().year - 13,
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      onDateTimeChanged: onDateChanged,
                    ),
                  ),
                  child: Text(
                    DateFormat('MMMM d, yyyy').format(time),
                    style: TextStyle(color: MbColors.darkaccent(context)),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Text("Gender",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color:
                          CupertinoTheme.of(context).primaryContrastingColor)),
              Container(
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: selectedGenderIndex != 0
                          ? CupertinoTheme.of(context).primaryColor
                          : Colors.transparent,
                      width: 2.0), // Border color and width
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                child: SecondaryCupertinoButton(
                  onPressed: () => showDialog(
                    CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: _kItemExtent,
                      scrollController: FixedExtentScrollController(
                        initialItem: selectedGender,
                      ),
                      onSelectedItemChanged: onSelectedGenderChanged,
                      children: List<Widget>.generate(genderOptions.length,
                          (int index) {
                        return Center(child: Text(genderOptions[index]));
                      }),
                    ),
                  ),
                  child: Text(
                    genderOptions[selectedGender],
                    style: TextStyle(color: MbColors.darkaccent(context)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
