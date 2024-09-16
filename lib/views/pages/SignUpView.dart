import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/helpers/AuthService.dart';
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/User.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/views/pages/signup/EmailView.dart';
import 'package:medibound_flutter/views/pages/signup/PasswordView.dart';
import 'package:medibound_flutter/views/pages/signup/PersonalInfoView.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'dart:io';


class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _middleNameController = TextEditingController();

  final _emailFocusController = FocusNode();
  final _passwordFocusController = FocusNode();
  final _passwordConfirmFocusController = FocusNode();
  final _firstNameFocusController = FocusNode();
  final _lastNameFocusController = FocusNode();
  final _middleNameFocusController = FocusNode();

  DateTime _birthdate = DateTime.parse(
      NumberFormat("0000").format(DateTime.now().year - 13).toString() +
          "-" +
          NumberFormat("00").format(DateTime.now().month) +
          "-" +
          NumberFormat("00").format(DateTime.now().day));
  File? _image;
  Uint8List _imageData = Uint8List(0);
  bool _isLoading = false;

  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;
  bool _isPasswordConfirmFocused = false;
  bool _isFirstNameFocused = false;
  bool _isLastNameFocused = false;
  bool _isMiddleNameFocused = false;

  int _selectedGender = 0;

  List<String> _genderOptions = [
    "Select",
    "Male",
    "Female",
    "Non-binary",
    "Passing",
    "Third gender",
    "Transgender",
    "Transgender man",
    "Transgender woman",
    "Two-spirit",
    "Agender",
    "Bigender",
    "Cisgender",
    "Gender Expression",
    "Gender Fluid",
    "Gender Queer",
    "Gender Variant",
    "Other"
  ];

  List<String> _realGenderOptions = [
    "Select",
    "male",
    "female",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
    "other",
  ];

  List<String> _subtitleOptions = [
    "Enter Your Email Below",
    "Help Us Get To Know You",
    "Secure Your New Account",
    "Customize Your Profile",
    "lol"
  ];

  int _selectedGenderIndex = 0;

  final ValueNotifier<int> _selectedPage = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();

    // Add listeners to the focus nodes to monitor focus changes
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

    _passwordConfirmFocusController.addListener(() {
      setState(() {
        _isPasswordConfirmFocused = _passwordConfirmFocusController.hasFocus;
      });
    });

    _firstNameFocusController.addListener(() {
      setState(() {
        _isFirstNameFocused = _firstNameFocusController.hasFocus;
      });
    });

    _middleNameFocusController.addListener(() {
      setState(() {
        _isMiddleNameFocused = _middleNameFocusController.hasFocus;
      });
    });

    _lastNameFocusController.addListener(() {
      setState(() {
        _isLastNameFocused = _lastNameFocusController.hasFocus;
      });
    });

    // Add listeners to text controllers to validate input
    _emailController.addListener(_validateEmail);
    _firstNameController.addListener(_validatePersonalInfo);
    _lastNameController.addListener(_validatePersonalInfo);
    _middleNameController.addListener(_validatePersonalInfo);
    _passwordController.addListener(_validatePassword);
    _passwordConfirmController.addListener(_validatePassword);
  }

  void _validateEmail() {
    setState(() {});
  }

  void _validatePersonalInfo() {
    setState(() {});
  }

  void _validatePassword() {
    setState(() {});
  }

  bool get _isEmailValid {
    final email = _emailController.text;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool get _isPersonalInfoValid {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _middleNameController.text.isNotEmpty &&
        _selectedGender != 0 &&
        _birthdate != null;
  }

  bool get _isPasswordValid {
    final password = _passwordController.text;
    final confirmPassword = _passwordConfirmController.text;
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password) && password == confirmPassword;
  }

  bool _isNextButtonEnabled(int page) {
    if (page == 0) {
      return _isEmailValid;
    } else if (page == 1) {
      return _isPersonalInfoValid;
    } else if (page == 2) {
      return _isPasswordValid;
    } else if (page == 3) {
      return true;
    }
    return false;
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
            color: CupertinoTheme.of(context).barBackgroundColor.withOpacity(1),
            borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20)),
        ),
        child: Container(
          height: 250,
          padding: const EdgeInsets.only(top: 6.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CupertinoTheme.of(context).primaryColor.withOpacity(0.05),
                  CupertinoTheme.of(context).primaryColor.withOpacity(0.1),
                  CupertinoTheme.of(context).primaryColor.withOpacity(0.05)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20))),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
  
  Future<void> _pickAndCropImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        maxWidth: 300,
        maxHeight: 300,
        compressFormat: ImageCompressFormat.jpg,
      );
      if (croppedFile != null) {
        final bytes = await croppedFile.readAsBytes();
        setState(() {
          _image = File(croppedFile.path);
          _imageData = bytes;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final googleCloudService = Provider.of<GoogleCloudService>(context);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CupertinoTheme.of(context).primaryColor.withOpacity(0.05),
              CupertinoTheme.of(context).primaryColor.withOpacity(0),
              CupertinoTheme.of(context).primaryColor.withOpacity(0.05),
              CupertinoTheme.of(context).primaryColor.withOpacity(0.1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: Colors.transparent,
            border: Border.all(color: Colors.transparent, width: 0),
          ),
          backgroundColor: Colors.transparent,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's Get Started",
                      style: TextStyle(
                        color:
                            CupertinoTheme.of(context).primaryContrastingColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                    ValueListenableBuilder<int>(
                        valueListenable: _selectedPage,
                        builder: (context, page, child) {
                          return AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                            child: Text(
                              key: ValueKey(_selectedPage),
                              _subtitleOptions[_selectedPage.value],
                              style: TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey,
                                height: 1.5,
                              ),
                            ),
                          );
                        }),
                    SizedBox(height: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedSize(
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 500),
                          child: ValueListenableBuilder<int>(
                            valueListenable: _selectedPage,
                            builder: (context, page, child) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return FadeTransition(
                                      opacity: animation, child: child);
                                },
                                child: Builder(
                                  key: ValueKey<int>(page),
                                  builder: (context) {
                                    if (page == 0) {
                                      return EmailView(
                                        key: ValueKey<int>(page),
                                        isEmailFocused: _isEmailFocused,
                                        emailController: _emailController,
                                        emailFocusController:
                                            _emailFocusController,
                                        isPasswordFocused: _isPasswordFocused,
                                        passwordController: _passwordController,
                                        passwordFocusController:
                                            _passwordFocusController,
                                        isPasswordConfirmFocused:
                                            _isPasswordConfirmFocused,
                                        passwordConfirmController:
                                            _passwordConfirmController,
                                        passwordConfirmFocusController:
                                            _passwordConfirmFocusController,
                                      );
                                    } else if (page == 1) {
                                      return PersonalInfoView(
                                        key: ValueKey<int>(page),
                                        isFirstNameFocused: _isFirstNameFocused,
                                        firstNameController:
                                            _firstNameController,
                                        firstNameFocusController:
                                            _firstNameFocusController,
                                        isMiddleNameFocused:
                                            _isMiddleNameFocused,
                                        middleNameController:
                                            _middleNameController,
                                        middleNameFocusController:
                                            _middleNameFocusController,
                                        isLastNameFocused: _isLastNameFocused,
                                        lastNameController: _lastNameController,
                                        lastNameFocusController:
                                            _lastNameFocusController,
                                        selectedGenderIndex:
                                            _selectedGenderIndex,
                                        genderOptions: _genderOptions,
                                        showDialog: _showDialog,
                                        selectedGender: _selectedGender,
                                        time: _birthdate,
                                        onSelectedGenderChanged: (int index) {
                                          setState(() {
                                            _selectedGender = index;
                                          });
                                        },
                                        onDateChanged: (DateTime newDate) {
                                          setState(() {
                                            _birthdate = newDate;
                                          });
                                        },
                                      );
                                    } else if (page == 2) {
                                      return PasswordView(
                                          isPasswordFocused: _isPasswordFocused,
                                          passwordController:
                                              _passwordController,
                                          passwordFocusController:
                                              _passwordFocusController,
                                          isPasswordConfirmFocused:
                                              _isPasswordConfirmFocused,
                                          passwordConfirmController:
                                              _passwordConfirmController,
                                          passwordConfirmFocusController:
                                              _passwordConfirmFocusController);
                                    } else {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CupertinoButton(
                                            key: ValueKey(_selectedPage),
                                            onPressed: () async {
                                              await _pickAndCropImage();
                                            },
                                            child: Column(
                                              children: [
                                                if (_image != null)
                                                  ClipOval(
                                                      child: Image.file(_image!,
                                                          width: 200,
                                                          height: 200,
                                                          fit: BoxFit.cover))
                                                else
                                                  Icon(
                                                      CupertinoIcons
                                                          .plus_circle,
                                                      size: 200,
                                                      color: MbColors.darkgreen(context)
                                                          .withOpacity(0.3)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedSize(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedSize(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                    child: ValueListenableBuilder<int>(
                                        valueListenable: _selectedPage,
                                        builder: (context, page, child) {
                                          if (_selectedPage.value == 0) {
                                            return Container();
                                          } else {
                                            return Row(
                                              children: [
                                                CupertinoButton(
                                                  key: ValueKey(_selectedPage),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 40.0),
                                                  onPressed: () async {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    if (_selectedPage.value ==
                                                        0) {
                                                    } else if (_selectedPage
                                                            .value <=
                                                        3) {
                                                      _selectedPage.value--;
                                                    } else {}
                                                  },
                                                  child: Text(
                                                    'Back',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                SizedBox(width: 20)
                                              ],
                                            );
                                          }
                                        }),
                                  ),
                                  ValueListenableBuilder<int>(
                                      valueListenable: _selectedPage,
                                      builder: (context, page, child) {
                                        return Opacity(
                                          opacity: _isNextButtonEnabled(
                                                  _selectedPage.value)
                                              ? 1.0
                                              : 0.7,
                                          child: GradientCupertinoButton(
                                            onPressed: _isNextButtonEnabled(
                                                    _selectedPage.value)
                                                ? () async {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    if (_selectedPage.value <
                                                        3) {
                                                      _selectedPage.value++;
                                                    } else {
                                                      if (_passwordController
                                                              .text ==
                                                          _passwordConfirmController
                                                              .text) {
                                                        setState(() =>
                                                            _isLoading = true);
          
                                                        final user = await User(email: _emailController.text,
                                                        givenNames: [_firstNameController.text, _middleNameController.text],
                                                        familyName: _lastNameController.text,
                                                        gender: _realGenderOptions[
                                                                  _selectedGender],
                                                        birthDate: _birthdate.toIso8601String().split('T').first,
                                                        userType: "personal").create(password: _passwordController.text, imageData: _imageData);
                                                        
                                                        
                                                        setState(() =>
                                                            _isLoading = false);
                                                        Navigator.pop(
                                                                context);
                                                      }
                                                    }
                                                  }
                                                : null,
                                            child: _isLoading
                                                ? CupertinoActivityIndicator(
                                                    color:
                                                        CupertinoColors.white)
                                                : AnimatedOpacity(
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.easeInOut,
                                                    opacity: 1,
                                                    child: Text(
                                                        key: ValueKey(
                                                            _selectedPage),
                                                        page == 3
                                                            ? 'Sign Up'
                                                            : "Next",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                CupertinoColors
                                                                    .white)),
                                                  ),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





