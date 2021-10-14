import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/HomePage/constants.dart';
import 'package:lottie/lottie.dart';

class RecentDocs extends StatefulWidget {
  @override
  _RecentDocsState createState() => _RecentDocsState();
}

class _RecentDocsState extends State<RecentDocs> {

  final emailid = FirebaseAuth.instance.currentUser!.email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('$emailid saves')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
              children: snapshot.data!.docs.map((document) {
                return SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    // width: double.infinity,
                    height: 110,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 30,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 3, color: secondary),
                          ),
                          child: Lottie.network(
                            document['img'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                document['type'],
                                style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: secondary,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(document['dr_name'],
                                      style: TextStyle(
                                          fontSize: 13, letterSpacing: .3)),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList());
        },
      ),
    );
  }
}
