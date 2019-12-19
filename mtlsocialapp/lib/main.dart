import 'package:flutter/material.dart';
import 'package:mtlsocialapp/widgets/signin/signin_screen.dart';

void main() => runApp(MyApp());

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
