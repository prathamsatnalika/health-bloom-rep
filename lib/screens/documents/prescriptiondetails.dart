import 'package:flutter/material.dart';

class presciptionDetails extends StatefulWidget {

  const presciptionDetails({Key? key}) : super(key: key);

  @override
  _presciptionDetailsState createState() => _presciptionDetailsState();
}

class _presciptionDetailsState extends State<presciptionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: Text("Your prescription details"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            Container(
                child: const TextField(
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(

                    ),
                    hintText: 'DR Name',
                    contentPadding: EdgeInsets.only(
                        left: 14.0, bottom: 12.0, top: 0.0),
                  ),
                ),

              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(30.0))),
              width: 300,
              height: 70,
            ),

            Container(
              child: const TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  hintStyle: TextStyle(

                  ),
                  hintText: 'Details',
                  contentPadding: EdgeInsets.only(
                      left: 14.0, bottom: 12.0, top: 0.0),
                ),
              ),

              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(30.0))),
              width: 300,
              height: 70,
            ),
            Container(
              child: const TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  hintStyle: TextStyle(

                  ),
                  hintText: 'Description',
                  contentPadding: EdgeInsets.only(
                      left: 14.0, bottom: 12.0, top: 0.0),
                ),
              ),

              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(30.0))),
              width: 300,
              height: 70,
            ),

            Container(
              child: const TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  hintStyle: TextStyle(

                  ),
                  hintText: 'Type',
                  contentPadding: EdgeInsets.only(
                      left: 14.0, bottom: 12.0, top: 0.0),
                ),
              ),

              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(30.0))),
              width: 300,
              height: 70,
            ),
            
            Container(
              child: const TextField(
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  hintStyle: TextStyle(

                  ),
                  hintText: 'Patient Aliment',
                  contentPadding: EdgeInsets.only(
                      left: 14.0, bottom: 12.0, top: 0.0),
                ),
              ),

              decoration:  const BoxDecoration(
                  borderRadius:  BorderRadius.all( Radius.circular(30.0))),
              width: 300,
              height: 70,
            ),
            Container(
              height: 30,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.thumb_up),
              label: Text("Save"),
              onPressed: () => print("it's pressed"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),

                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
