import 'package:flutter/material.dart';

class FeedbackHelp extends StatefulWidget {
  @override
  _FeedbackHelpState createState() => _FeedbackHelpState();
}

class _FeedbackHelpState extends State<FeedbackHelp> {
  List<bool> isTypeSelected = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildNumberField() {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1.0,
                    color: Color(0xFFC5C5C5),
                  ),
                ),
              ),
            ),
          ],
        ),
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Color(0xFFC5C5C5),
        ),
        hintText: "Phone Number",
        border: OutlineInputBorder(),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Color(0xFFC5C5C5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE5E5E5),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xFFA6A6A6),
                  ),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFA5A5A5),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Upload screenshot (optional)",
                    style: TextStyle(
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCheckItem({required String title, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_circle : Icons.circle,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.grey),
          ),
        ],
      ),
    );
  }
}