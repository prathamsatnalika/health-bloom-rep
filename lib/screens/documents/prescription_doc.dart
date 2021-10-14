import 'package:flutter/material.dart';

class PrescriptionDOC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var drnameController;
    var hospitalNameController, userAilmentsController ;
    var drAdviceController;
    var descriptionController;

    return AlertDialog(
      title: Text("Add Details"),
      content: Column(
        children: [
          TextField(
            textInputAction: TextInputAction.next,
            controller: drnameController,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.0),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                labelText: "Dr Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    BorderSide(width: 0.5, color: Colors.grey))),
          //  onSubmitted: (val)=>focus.nextFocus(),
          ),

          TextField(
            textInputAction: TextInputAction.next,
            controller: hospitalNameController,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.0),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                labelText: "Hospital Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    BorderSide(width: 0.5, color: Colors.grey))),
           // onSubmitted: (val)=>focus.nextFocus(),
          ),

          TextField(
            textInputAction: TextInputAction.next,
            controller: userAilmentsController,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.0),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                labelText: "User Ailments ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    BorderSide(width: 0.5, color: Colors.grey))),
         //   onSubmitted: (val)=>focus.nextFocus(),
          ),

          TextField(
            textInputAction: TextInputAction.next,
            controller: drAdviceController,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.0),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                labelText: "Dr Advice",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    BorderSide(width: 0.5, color: Colors.grey))),
      //      onSubmitted: (val)=>focus.nextFocus(),
          ),

          TextField(
            textInputAction: TextInputAction.next,
            controller: descriptionController,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.0),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                labelText: "Description",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    BorderSide(width: 0.5, color: Colors.grey))),
         //   onSubmitted: (val)=>focus.nextFocus(),
          ),


        ],
      ),
    );
  }
}
