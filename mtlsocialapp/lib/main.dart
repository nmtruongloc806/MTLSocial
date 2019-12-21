import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mtlsocialapp/widgets/signin/signin_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(HomeScreen());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTL Social',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SignIn(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTL Social',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SignIn(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        // save the token  OR subscribe to a topic here
      });

      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );
    _saveDeviceToken();
  }
  _saveDeviceToken() async {
    // Get the current user
    String uid = 'jeffd23';
    // FirebaseUser user = await _auth.currentUser();

    // Get the token for this device
    String fcmToken = await _fcm.getToken();

    print("token: " +fcmToken);
    // Save it to Firestore
    // if (fcmToken != null) {
    //   var tokens = _db
    //       .collection('users')
    //       .document(uid)
    //       .collection('tokens')
    //       .document(fcmToken);

    //   await tokens.setData({
    //     'token': fcmToken,
    //     'createdAt': FieldValue.serverTimestamp(), // optional
    //     'platform': Platform.operatingSystem // optional
    //   });
    // }
  }
}
