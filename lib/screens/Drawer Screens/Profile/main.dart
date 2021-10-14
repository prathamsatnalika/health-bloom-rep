import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/Drawer%20Screens/Profile/Components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
    );
  }
}