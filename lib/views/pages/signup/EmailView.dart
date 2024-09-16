import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/res/MbColors.dart';

class EmailView extends StatelessWidget {
  const EmailView({
    Key? key,
    required this.isEmailFocused,
    required this.emailController,
    required this.emailFocusController,
    required this.isPasswordFocused,
    required this.passwordController,
    required this.passwordFocusController,
    required this.isPasswordConfirmFocused,
    required this.passwordConfirmController,
    required this.passwordConfirmFocusController,
  }) : super(key: key);

  final bool isEmailFocused;
  final TextEditingController emailController;
  final FocusNode emailFocusController;
  final bool isPasswordFocused;
  final TextEditingController passwordController;
  final FocusNode passwordFocusController;
  final bool isPasswordConfirmFocused;
  final TextEditingController passwordConfirmController;
  final FocusNode passwordConfirmFocusController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Text("Email",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isEmailFocused
                          ? MbColors.darkaccent(context)
                          : CupertinoTheme.of(context)
                              .primaryContrastingColor)),
              Container(
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isEmailFocused
                          ? CupertinoTheme.of(context).primaryColor
                          : Colors.transparent,
                      width: 2.0), // Border color and width
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                child: CupertinoTextField(
                  controller: emailController,
                  focusNode: emailFocusController,
                  placeholder: 'johnsmith@example.com',
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: isEmailFocused
                          ? Colors.transparent
                          : CupertinoTheme.of(context)
                                          .primaryContrastingColor
                                          .withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}