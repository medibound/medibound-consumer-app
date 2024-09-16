import 'package:flutter/cupertino.dart';
import 'package:medibound_flutter/helpers/AuthService.dart';
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/views/ContentView.dart';
import 'package:provider/provider.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<GoogleCloudService>(create: (_) => GoogleCloudService()),
      ],
      child: CupertinoApp(
        theme: CupertinoThemeData(
          brightness: MediaQuery.of(context).platformBrightness,
          primaryColor: MediaQuery.of(context).platformBrightness == Brightness.dark 
    ? Color(0xFF00D6A1)
    : Color.fromARGB(255, 1, 119, 90),
          primaryContrastingColor: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? CupertinoColors.white
              : CupertinoColors.black,
        
          barBackgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? CupertinoColors.black
              : CupertinoColors.extraLightBackgroundGray,
          scaffoldBackgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Color.fromARGB(255, 11, 12, 12)
              : CupertinoColors.white
        ),
        home: ContentView(),
      ),
    );
  }
}
