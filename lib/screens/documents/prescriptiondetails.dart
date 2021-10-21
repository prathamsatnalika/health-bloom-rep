
import 'package:flutter/material.dart';

class PresciptionDetails extends StatefulWidget {

  final document;

  const PresciptionDetails({Key? key,this.document}) : super(key: key);

  @override
  _PresciptionDetailsState createState() => _PresciptionDetailsState();
}

class _PresciptionDetailsState extends State<PresciptionDetails> {
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
                child:  TextField(
                  controller: TextEditingController()..text = widget.document["dr_name"],
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
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
              child:  TextField(
                controller: TextEditingController()..text = widget.document["description"],
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
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
              child:  TextField(
                controller: TextEditingController()..text = widget.document["hospital_name"],
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  hintStyle: TextStyle(

                  ),
                  hintText: 'Hospital Name',
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
              child:  TextField(
                controller: TextEditingController()..text = widget.document["user_ailment"],

                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  hintStyle: TextStyle(

                  ),
                  hintText: 'User Ailments',
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
              child:  TextField(
                controller: TextEditingController()..text = widget.document["dr_advice"],

                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  hintStyle: TextStyle(

                  ),
                  hintText: 'Dr Advice',
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
