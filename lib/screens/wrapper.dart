import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/Drawer%20Screens/Profile/main.dart';
import 'package:health_bloom_test_ui/screens/auth-services.dart';
import 'package:health_bloom_test_ui/screens/documents/view.dart';
import 'package:health_bloom_test_ui/screens/onboarding/main.dart';
import 'package:health_bloom_test_ui/screens/onboarding/onboarding.dart';
import 'package:health_bloom_test_ui/screens/tabnavigator.dart';
import 'package:health_bloom_test_ui/screens/user_model.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService=Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_,AsyncSnapshot<User?>snapshot){
        if(snapshot.connectionState==ConnectionState.active){
          final User?user=snapshot.data;
          return user==null?Onbording():ProfileScreen();
        }else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}


