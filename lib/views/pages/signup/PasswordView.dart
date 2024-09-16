import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/res/MbColors.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({
    super.key,
    required this.isPasswordFocused,
    required this.passwordController,
    required this.passwordFocusController,
    required this.isPasswordConfirmFocused,
    required this.passwordConfirmController,
    required this.passwordConfirmFocusController,
  });

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
            children: [
              SizedBox(height: 6),
              Text("Password",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isPasswordFocused
                          ? MbColors.darkaccent(context)
                          : CupertinoTheme.of(context)
                              .primaryContrastingColor)),
              Container(
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isPasswordFocused
                          ? CupertinoTheme.of(context).primaryColor
                          : Colors.transparent,
                      width: 2.0), // Border color and width
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                child: CupertinoTextField(
                  controller: passwordController,
                  focusNode: passwordFocusController,
                  placeholder: 'Password',
                  padding: EdgeInsets.all(20),
                  obscureText: true,
                  decoration: BoxDecoration(
                      color: isPasswordFocused
                          ? Colors.transparent
                          : MbColors.darkaccent(context).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Text("Confirm Password",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isPasswordConfirmFocused
                          ? MbColors.darkaccent(context)
                          : CupertinoTheme.of(context)
                              .primaryContrastingColor)),
              Container(
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isPasswordConfirmFocused
                          ? CupertinoTheme.of(context).primaryColor
                          : Colors.transparent,
                      width: 2.0), // Border color and width
                  borderRadius: BorderRadius.circular(10.0), // Border radius
                ),
                child: CupertinoTextField(
                  controller: passwordConfirmController,
                  focusNode: passwordConfirmFocusController,
                  placeholder: 'Confirm Password',
                  obscureText: true,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: isPasswordConfirmFocused
                          ? Colors.transparent
                          : MbColors.darkaccent(context).withOpacity(0.1),
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