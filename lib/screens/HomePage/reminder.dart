import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/HomePage/drawer.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminder ",style: TextStyle(
            color: Colors.deepPurpleAccent
        ),),
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: Colors.deepPurpleAccent,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: NavigationDrawerWidget(),
      // body: getBody(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   child: const Icon(Icons.add),
      //   backgroundColor: Colors.deepPurpleAccent,
      // ),
    );
  }
}
