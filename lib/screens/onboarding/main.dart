import 'package:flutter/material.dart';

import 'onboarding.dart';

class OnBoardingMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Onbording(),
    );
  }
}


