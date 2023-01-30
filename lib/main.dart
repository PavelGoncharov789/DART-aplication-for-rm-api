import 'package:flutter/material.dart';
import 'package:flutter_application_1/CClist.dart';

void main() => runApp(CCTracker());

class CCTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Awesome CC Tracker',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: CClist());
  }
}
