
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_bloom_test_ui/screens/auth-services.dart';
import 'package:health_bloom_test_ui/screens/documents/prescription_doc.dart';
import 'package:health_bloom_test_ui/screens/documents/recent_docs.dart';
import 'package:health_bloom_test_ui/screens/HomePage/constants.dart';
import 'package:health_bloom_test_ui/screens/HomePage/drawer.dart';
import 'package:health_bloom_test_ui/screens/json/create_budget_json.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CreatBudgetPage extends StatefulWidget {
  @override
  _CreatBudgetPageState createState() => _CreatBudgetPageState();
}

class _CreatBudgetPageState extends State<CreatBudgetPage> {
  int activeCategory = 0;
  final TextEditingController _drnameController = TextEditingController();
  final TextEditingController _hospitalNameController = TextEditingController();
  final TextEditingController _userAilmentsController = TextEditingController();
  final TextEditingController _drAdviceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  File? _image ;
  final imagePicker = ImagePicker();
  String _imageLink = '';


  Future imagePickerMethod() async {
    final pic = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pic != null) {
        _image = File(pic.path);
      }
    });
  }

  void uploadImage() {
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageReference = FirebaseStorage.instance.ref()
        .child('Images').child(imageFileName);
    final UploadTask uploadTask = storageReference.putFile(_image!);

    uploadTask.then((TaskSnapshot taskSnapshot){
      taskSnapshot.ref.getDownloadURL().then((imageUrl){
        setState(() {
          _imageLink = imageUrl;
        });
        print(_imageLink);
        savePrescription();
      });
    }).catchError((error){

    });
  }

  void savePrescription() {
    final useremail = FirebaseAuth.instance.currentUser!.email;
    print("$useremail");
    Map<String,dynamic> data = {
      'dr_name': _drnameController.text,
      'hospital_name': _hospitalNameController.text,
      'user_ailment': _userAilmentsController.text,
      'dr_advice': _drnameController.text,
      'description': _descriptionController.text,
      'time_saved' : "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
      'type'   : "prescription",
      'img'  : 'https://assets9.lottiefiles.com/packages/lf20_vPnn3K.json',
      'prescription_img' : _imageLink,

    };
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('$useremail saves');
    collectionReference.add(data)
        .then((value) => {
      Fluttertoast.showToast(
        msg: "Saved Prescription",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      ),
    });
  }

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final userid = FirebaseAuth.instance.currentUser!.uid;

    String date = "";


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Documents ",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Colors.white,
            ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      drawer: NavigationDrawerWidget(),
      body: getBody(userid),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          return;
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }

  Widget getBody(userID) {
    print(userID);
    var size = MediaQuery.of(context).size;
    // final user = Provider.of<User>(context);

    return SingleChildScrollView(
      child: Container(
        color: Colors.deepPurple.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Text(
                "Choose category",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: black.withOpacity(0.5)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(categories.length, (index) {
                // Prescription
                if (index == 0) {
                  return GestureDetector(
                    onTap: () async {
                      return showDialog(
                          context: context,
                          builder: (newprescription) => AlertDialog(
                                title: Text("Add Prescription"),
                                content: Stack(
                                  overflow: Overflow.visible,
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Container(
                                        height: MediaQuery.of(context).size.height * 0.8,
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        child: SingleChildScrollView(
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 20, 10, 10),
                                              child: Column(children: [
                                                TextField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  controller: _drnameController,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.0),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                              horizontal: 15.0,
                                                              vertical: 20.0),
                                                      labelText: "Dr Name",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          borderSide:
                                                              const BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .grey))),
                                                  //  onSubmitted: (val)=>focus.nextFocus(),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  controller:
                                                      _hospitalNameController,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.0),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                              horizontal: 15.0,
                                                              vertical: 20.0),
                                                      labelText:
                                                          "Hospital Name",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          borderSide:
                                                              const BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .grey))),
                                                  // onSubmitted: (val)=>focus.nextFocus(),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  controller:
                                                      _userAilmentsController,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.0),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                              horizontal: 15.0,
                                                              vertical: 20.0),
                                                      labelText:
                                                          "User Ailments ",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          borderSide:
                                                              const BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .grey))),
                                                  //   onSubmitted: (val)=>focus.nextFocus(),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  controller:
                                                      _drAdviceController,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.0),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                              horizontal: 15.0,
                                                              vertical: 20.0),
                                                      labelText: "Dr Advice",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          borderSide:
                                                              const BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .grey))),
                                                  //      onSubmitted: (val)=>focus.nextFocus(),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  controller:
                                                      _descriptionController,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.0),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                              horizontal: 15.0,
                                                              vertical: 20.0),
                                                      labelText: "Description",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          borderSide:
                                                              const BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .grey))),
                                                  //   onSubmitted: (val)=>focus.nextFocus(),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children:[
                                                    RaisedButton(
                                                      onPressed: () {
                                                        _selectDate(context);
                                                      },
                                                      child: Text("Select Time"),
                                                    ),
                                                    Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),

                                                  ]

                                                ),
                                                Row(
                                                  children: [

                                                    RaisedButton(
                                                      onPressed: () {
                                                        imagePickerMethod();
                                                      },
                                                      child: Text("Select Img"),
                                                    ),
                                                    SizedBox(width: 15,),
                                                    RaisedButton(
                                                        onPressed: ()  {
                                                          uploadImage();
                                                        },
                                                        child: Text("Submit"))
                                                  ],
                                                )
                                              ])),
                                        ))
                                  ],
                                ),
                              ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                        ),
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                                width: 2,
                                color: activeCategory == index
                                    ? primary
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.01),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.15)),
                                  child: Center(
                                    child: Lottie.network(
                                      categories[index]['icon'],
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                              Text(
                                categories[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                // Bills
                else if (index == 1) {
                  return GestureDetector(
                    onTap: () async {
                      return showDialog(
                          context: context,
                          builder: (newbill) => AlertDialog(
                                title: Text("Add Bills"),
                                content: Column(
                                  children: [
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _drnameController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "Dr Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      //  onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _hospitalNameController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "Hospital Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      // onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _userAilmentsController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "User Ailments ",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      //   onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _drAdviceController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "Dr Advice",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      //      onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _descriptionController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "Description",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      //   onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    RaisedButton(
                                        onPressed: () async {
                                          CollectionReference users =
                                              FirebaseFirestore.instance
                                                  .collection('users');
                                          return users
                                              .doc("BILLS")
                                              .collection("user_documents")
                                              .add({
                                            'dr_name': _drnameController.text,
                                            'hospital_name':
                                                _hospitalNameController.text,
                                            'user_ailment;':
                                                _userAilmentsController.text,
                                            'dr_advice': _drnameController.text,
                                            'description':
                                                _descriptionController.text
                                          }).then((value) => Fluttertoast.showToast(
                                                  msg:
                                                      "User Added Successfully!!",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity:
                                                      ToastGravity.BOTTOM));
                                        },
                                        child: Text("press"))
                                  ],
                                ),
                              ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                        ),
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                                width: 2,
                                color: activeCategory == index
                                    ? primary
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.01),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.15)),
                                  child: Center(
                                    child: Lottie.network(
                                      categories[index]['icon'],
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                              Text(
                                categories[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                // Reports
                else if (index == 2) {
                  return GestureDetector(
                    onTap: () async {
                      return showDialog(
                          context: context,
                          builder: (newreport) => AlertDialog(
                                title: Text("Add Reports"),
                                content: Column(
                                  children: [
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _drnameController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "Dr Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      //  onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _hospitalNameController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "Hospital Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      // onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _userAilmentsController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "User Ailments ",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      //   onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _drAdviceController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "Dr Advice",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      //      onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _descriptionController,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20.0),
                                          labelText: "Description",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.grey))),
                                      //   onSubmitted: (val)=>focus.nextFocus(),
                                    ),
                                    RaisedButton(
                                        onPressed: () async {
                                          CollectionReference users =
                                              FirebaseFirestore.instance
                                                  .collection('users');
                                          return users
                                              .doc("REPORTS")
                                              .collection("user_documents")
                                              .add({
                                            'dr_name': _drnameController.text,
                                            'hospital_name':
                                                _hospitalNameController.text,
                                            'user_ailment':
                                                _userAilmentsController.text,
                                            'dr_advice': _drnameController.text,
                                            'description':
                                                _descriptionController.text
                                          }).then((value) => Fluttertoast.showToast(
                                                  msg:
                                                      "User Added Successfully!!",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity:
                                                      ToastGravity.BOTTOM));
                                        },
                                        child: Text("press"))
                                  ],
                                ),
                              ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                        ),
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                                width: 2,
                                color: activeCategory == index
                                    ? primary
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.01),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.15)),
                                  child: Center(
                                    child: Lottie.network(
                                      categories[index]['icon'],
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                              Text(
                                categories[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                //default
                else
                  return GestureDetector(
                    onTap: () async {
                      return showDialog(
                          context: context,
                          builder: (newdefault) => AlertDialog(
                                content: Column(
                                  children: [
                                    Text("Feature Under Development"),
                                    RaisedButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"))
                                  ],
                                ),
                              ));
                    },
                  );
              })),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (size.width - 140),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Documents",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: black.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.49,
                      child: RecentDocs()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
