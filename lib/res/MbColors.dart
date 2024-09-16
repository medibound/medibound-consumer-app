import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final class MbColors {

  //static const Color accent = Color(0xFF00D6A1);
  static Color darkaccent(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark 
    ? Color(0xFF00D6A1)
    : Color(0xFF01775A);
  } 
  static Color darkgreen(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark 
    ? Color.fromARGB(255, 0, 87, 65)
    : Color(0xFF00D6A1);
  } 
  static const Color greygreen = Color(0xFF83ADA3);

}

String convertDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  
  // Format the date
  String formattedDate = DateFormat('MMM d, y').format(dateTime);
  
  // Add the suffix for the day
  String day = DateFormat('d').format(dateTime);
  String suffix = getDayOfMonthSuffix(int.parse(day));
  
  // Combine the formatted date and the suffix
  formattedDate = formattedDate.replaceFirst(day, day + suffix);

  return formattedDate;
}

String getDayOfMonthSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

class GradientCupertinoButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  GradientCupertinoButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [MbColors.darkaccent(context), Color.fromARGB(255, 0, 158, 119)], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: MbColors.darkaccent(context).withOpacity(0.4), // Shadow color
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 10, // How blurry the shadow is
            offset: Offset(0, 0), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.circular(10.0), // Border radius
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
        color: Colors.transparent, // Make the button itself transparent
        child: child,
      ),
    );
  }
}

class SecondaryCupertinoButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  SecondaryCupertinoButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MbColors.darkgreen(context).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0), // Border radius
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
        color: Colors.transparent, // Make the button itself transparent
        child: child,
      ),
    );
  }
}

class FullSecondaryCupertinoButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double? opacity;

  FullSecondaryCupertinoButton({required this.child, required this.onPressed, required this.backgroundColor, this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: MbColors.darkaccent(context).withOpacity(opacity == null ? 0 : opacity!), // Shadow color
            spreadRadius: 10, // How much the shadow spreads
            blurRadius: 20, // How blurry the shadow is
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(10.0),
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        color: backgroundColor, // Make the button itself transparent
        child: child,
      ),
    );
  }
}