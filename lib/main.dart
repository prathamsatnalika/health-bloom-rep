import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/auth-services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:health_bloom_test_ui/screens/documents/prescriptiondetails.dart';
import 'package:health_bloom_test_ui/screens/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<AuthService>(
          create: (_)=>AuthService(),
        ),
      ],
      child:MaterialApp(
        home: presciptionDetails(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
