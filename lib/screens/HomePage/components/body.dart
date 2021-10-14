import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/HomePage/components/discount_card.dart';
import 'package:health_bloom_test_ui/screens/HomePage/components/item_list.dart';
import 'package:health_bloom_test_ui/screens/HomePage/components/list_view.dart';
import 'package:health_bloom_test_ui/screens/HomePage/components/search.dart';
import 'package:health_bloom_test_ui/screens/HomePage/components/stats.dart';
import 'package:health_bloom_test_ui/screens/HomePage/drawer.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Bloom ",style: TextStyle(
          color: Colors.white
        ),),
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.deepPurple.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SearchBox(
                onChanged: (value) {},
              ),
              MealsListView(),
              //DiscountCard(),
              MediterranesnDietView(),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Stats(),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
