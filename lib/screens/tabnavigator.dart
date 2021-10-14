import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/documents/add.dart';
import 'package:health_bloom_test_ui/screens/HomePage/home-screen.dart';
import 'package:health_bloom_test_ui/screens/Scheduler/screens/home/scheduler_home.dart';



class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  final List<Widget> _tabItems = [HomeScreen(), CreatBudgetPage(), SchedulerHome(
  )];

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30,color: Colors.white,),
         Icon(Icons.assignment_outlined, size: 30,color: Colors.white,),
          Icon(Icons.access_alarm_sharp, size: 30,color: Colors.white,),

        ],
        color: Colors.deepPurpleAccent,
        buttonBackgroundColor: Colors.deepPurpleAccent,
        backgroundColor: Colors.deepPurple.shade100,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _tabItems[_page], //Customise it as you want.
    );
  }
}