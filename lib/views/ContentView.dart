import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/res/Patient.dart';
import 'package:medibound_flutter/res/MedicalUnit.dart';
import 'package:medibound_flutter/ui/DataUI.dart';
import 'package:medibound_flutter/views/pages/DeviceView.dart';
import 'package:medibound_flutter/views/pages/HomeView.dart';
import 'package:medibound_flutter/views/pages/LoginView.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Assuming you're using Firebase Auth for authentication

class ContentView extends StatefulWidget {
  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  int _selectedIndex = 0;
  CupertinoTabController _tabController = CupertinoTabController();

  GoogleCloudService googleCloudService = new GoogleCloudService();

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        User? user = snapshot.data;
        if (user == null) {
          return LoginView();
        } else {
          var mbUser = Patient(user: user);
          return Container(
            decoration: BoxDecoration(
                color: CupertinoTheme.of(context).barBackgroundColor),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MbColors.darkaccent(context).withOpacity(0.05),
                    MbColors.darkaccent(context).withOpacity(0),
                    MbColors.darkaccent(context).withOpacity(0.05),
                    MbColors.darkaccent(context).withOpacity(0.1),
                  ],
                  begin: Alignment(1.0 - (_selectedIndex / 2.0), -1),
                  end: Alignment((_selectedIndex / 4.0), 1),
                ),
              ),
              child: CupertinoTabScaffold(
                controller: _tabController,
                backgroundColor: Colors.transparent,
                tabBar: CupertinoTabBar(
                  backgroundColor: Colors.transparent,
                  border: Border.all(width: 0, color: Colors.transparent),
                  currentIndex: _selectedIndex,
                  inactiveColor: MbColors.greygreen.withOpacity(0.7),
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'lib/assets/medibound.svg',
                        width: 25,
                        height: 25,
                        color: _selectedIndex == 0
                            ? MbColors.darkaccent(context)
                            : MbColors.greygreen.withOpacity(0.7),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        _selectedIndex == 1
                            ? 'lib/assets/device-fill.svg'
                            : 'lib/assets/device.svg',
                        width: 28,
                        height: 28,
                        color: _selectedIndex == 1
                            ? MbColors.darkaccent(context)
                            : MbColors.greygreen.withOpacity(0.7),
                      ),
                      label: 'Devices',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        _selectedIndex == 2
                            ? 'lib/assets/bounds-fill.svg'
                            : 'lib/assets/bounds.svg',
                        width: 25,
                        height: 25,
                        color: _selectedIndex == 2
                            ? MbColors.darkaccent(context)
                            : MbColors.greygreen.withOpacity(0.7),
                      ),
                      label: 'Bounds',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        _selectedIndex == 3
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        size: 28,
                        color: _selectedIndex == 3
                            ? MbColors.darkaccent(context)
                            : MbColors.greygreen.withOpacity(0.7),
                      ),
                      label: 'Health',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        size: 27,
                        _selectedIndex == 4
                            ? CupertinoIcons.person_circle_fill
                            : CupertinoIcons.person_circle,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
                tabBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Builder(builder: (context) {
                        switch (index) {
                          case 0:
                            return HomeView(
                                mbUser: mbUser, tabController: _tabController);
                          case 1:
                            return DeviceView(
                              mbUser: mbUser,
                              tabController: _tabController,
                            );
                          case 2:
                            return BoundView();
                          case 3:
                            return PlusView();
                          case 4:
                            return ProfileView();
                          default:
                            return HomeView(
                                mbUser: mbUser, tabController: _tabController);
                        }
                      }));
                },
              ),
            ),
          ); // Implement the LoginView;
        }
      },
    );
  }
}

class UserProfile {
  Widget profileImageSmall =
      Icon(Icons.account_circle); // Replace with actual profile image logic
}

// Implement your custom views as StatefulWidget or StatelessWidget

class BoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Bound View'),
      ),
    );
  }
}

class PlusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Plus View'),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  GoogleCloudService googleCloudService = new GoogleCloudService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
                child: Text("Create Organization"),
                onPressed: () => googleCloudService.init().then(
                      (fhir) => {fhir.organization.test()},
                    )),
            CupertinoButton(
                child: Text("Create Observation Definition"),
                onPressed: () => googleCloudService.init().then(
                      (fhir) => {fhir.observationDefinition.test()},
                    )),
            CupertinoButton(
                child: Text("Create Observation"),
                onPressed: () => googleCloudService.init().then(
                      (fhir) => {fhir.observation.test()},
                    )),
            CupertinoButton(
                child: Text("Create Device Definition"),
                onPressed: () => googleCloudService.init().then(
                      (fhir) => {fhir.deviceDefinition.test()},
                    )),
            CupertinoButton(
                child: Text("Create Device"),
                onPressed: () => googleCloudService.init().then(
                      (fhir) => {fhir.device.test()},
                    )),
            Image.network("https://storage.googleapis.com/medibound-420121.appspot.com/profile_pictures/PlE9NvkkVdSlWNEbkZlL8kWUCW82/profile.jpg?GoogleAccessId=firebase-adminsdk-qvn78%40medibound-420121.iam.gserviceaccount.com&Expires=16447017600&Signature=enY6CKyWHBq2R72w9VuNzF%2F5RkYXPYn3mkDlxX5PSgoTT2gCJyMV0ZpDmDPPU52GhQlR8ujdmlW9pjxsBwa2mObk4DRfRkTdlhrRp1nMuN0%2BpdsgDjfm%2BS9khA1K5PfDALWXR1QNSD58QfC%2BzUhCtz2%2Fr%2F%2B5Z8FOnADROVA74ziO3TP7o4eztqzZjc5iWLeMjMyXmjOzOb18B5nfGHMvahQaMbiWlJJTnDDdQw7T%2FKoNCAJqIcOJKsD5M2UCzAyoJ8l1rIU6bfI3z50EBcjm9cQdUFspQBlzwaNfWejKE1%2BamfwG%2B6VuD7WitsndTsKfklnhImDvlIrlezrDdYQY9A%3D%3D"),
            Container(
              width: 80,
              child: DataBasicView(
                  title: 'Heart Rate',
                  color: Colors.green,
                  value: 75,
                  maxValue: 200,
                  unit: MedicalUnit.BeatsPerMinute),
            ),
            Container(
              width: 80,
              child: DataFullRingView(
                  title: 'Blood Pressure',
                  color: Colors.red,
                  value: 80,
                  maxValue: 200,
                  unit: MedicalUnit.MillimeterOfMercury),
            ),
            Container(
              width: 80,
              child: DataHalfRingView(
                  title: 'Blood Pressure',
                  color: Colors.red,
                  value: 120,
                  maxValue: 200,
                  unit: MedicalUnit.MillimeterOfMercury),
            ),
            Container(
              width: 160,
              child: DataLineGraphView(
                  title: 'Weight',
                  color: Colors.purple,
                  data: [68, 69, 70, 71, 72, 71, 70, 69, 70, 70],
                  unit: MedicalUnit.Kilogram),
            ),
            Container(
              width: 160,
              child: DataBarGraphView(
                  title: 'Oxygen Saturation (SpO2)',
                  color: Colors.blue,
                  aggregated: true,
                  data: [97, 98, 99, 98, 97, 98, 99, 98, 97, 98],
                  unit: MedicalUnit.Percent),
            ),
            Container(
                width: 80,
                child: DataBasicView(
                    title: 'Heart Rate',
                    color: Colors.green,
                    value: 75,
                    maxValue: 200,
                    unit: MedicalUnit.BeatsPerMinute),
              ),
              Container(
                width: 80,
                child: DataFullRingView(
                    title: 'Blood Pressure',
                    color: Colors.red,
                    value: 120,
                    maxValue: 200,
                    unit: MedicalUnit.MillimeterOfMercury),
              ),
              Container(
                width: 80,
                child: DataHalfRingView(
                    title: 'Respiration Rate',
                    color: Colors.blue,
                    value: 16,
                    maxValue: 30,
                    unit: MedicalUnit.BreathsPerMinute),
              ),
              Container(
                width: 80,
                child: DataFullRingView(
                    title: 'Body Temp',
                    color: Colors.orange,
                    value: 37.5,
                    maxValue: 42,
                    unit: MedicalUnit.DegreeCelsius),
              ),
              Container(
                width: 160,
                child: DataLineGraphView(
                    title: 'Weight',
                    color: Colors.purple,
                    data: [68, 69, 70, 71, 72, 71, 70, 69, 70, 70],
                    unit: MedicalUnit.Kilogram),
              ),
              Container(
                width: 160,
                child: DataBarGraphView(
                    title: 'O2 Saturation',
                    color: Colors.blue,
                    aggregated: true,
                    data: [97, 98, 99, 98, 97, 98, 99, 98, 97, 98],
                    unit: MedicalUnit.Percent),
              ),
              Container(
                width: 160,
                child: DataLineGraphView(
                    title: 'Blood Glucose',
                    color: Colors.teal,
                    data: [90, 85, 92, 88, 93, 87, 95, 89, 91, 90],
                    unit: MedicalUnit.MilligramPerDeciliter),
              ),
              Container(
                width: 160,
                child: DataBarGraphView(
                    title: 'Stress Level',
                    color: Colors.redAccent,
                    aggregated: true,
                    data: [3, 4, 2, 5, 3, 4, 3, 5, 4, 3],
                    unit: MedicalUnit.Index),
              ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
