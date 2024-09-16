import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/helpers/AuthService.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/views/pages/SignUpView.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusController = FocusNode();
  final _passwordFocusController = FocusNode();

  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Add a listener to the focus node to monitor focus changes
    _emailFocusController.addListener(() {
      setState(() {
        _isEmailFocused = _emailFocusController.hasFocus;
      });
    });

    _passwordFocusController.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusController.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      child: Container(
        padding: EdgeInsets.only(top: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CupertinoTheme.of(context).primaryColor.withOpacity(0.05),
              CupertinoTheme.of(context).primaryColor.withOpacity(0),
              CupertinoTheme.of(context).primaryColor.withOpacity(0.05),
              CupertinoTheme.of(context).primaryColor.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
                    ),
                    Text(
                      "We're Glad You're Back. Continue Below",
                      style: TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                          height: 1.5),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: _isEmailFocused
                                ? CupertinoTheme.of(context).primaryColor
                                : Colors.transparent,
                            width: 2.0), // Border color and width
                        borderRadius: BorderRadius.circular(10.0), // Border radius
                      ),
                      child: CupertinoTextField(
                        controller: _emailController,
                        focusNode: _emailFocusController,
                        placeholder: 'Email',
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: _isEmailFocused ? Colors.transparent : CupertinoTheme.of(context)
                                          .primaryContrastingColor
                                          .withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        
                        border: Border.all(
                          
                            color: _isPasswordFocused
                                ? CupertinoTheme.of(context).primaryColor
                                : Colors.transparent,
                            width: 2.0), // Border color and width
                        borderRadius: BorderRadius.circular(10.0), // Border radius
                      ),
                      child: CupertinoTextField(
                        controller: _passwordController,
                        focusNode: _passwordFocusController,
                        placeholder: 'Password',
                        padding: EdgeInsets.all(20),
                        obscureText: true,
                        decoration: BoxDecoration(
                            color: _isPasswordFocused ? Colors.transparent : CupertinoTheme.of(context)
                                          .primaryContrastingColor
                                          .withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0),
                CupertinoButton(
                  onPressed: () {},
                   
                  child: Text(
                    "FORGET YOUR PASSWORD?",
                    style: TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 12,
                    ),
                    ),
                ),
                SizedBox(height: 10),
                GradientCupertinoButton(
                  onPressed: () async {
                    setState(() => _isLoading = true);
                    await authService.loginUser(
                      _emailController.text,
                      _passwordController.text,
                    );
                    setState(() => _isLoading = false);
                  },
                  child: _isLoading
                      ? CupertinoActivityIndicator(color: CupertinoColors.white)
                      : Text(
                          'Sign In',
                          style: TextStyle(fontWeight: FontWeight.w700, color: CupertinoColors.white),
                        ),
                ),
                SizedBox(height: 15),
                CupertinoButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => SignUpView()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create An Account'),
                      SizedBox(width: 2,),
                      Icon(
                        size: 15,
                        CupertinoIcons.arrow_right,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
