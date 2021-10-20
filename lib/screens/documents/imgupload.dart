import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {

  File? _image ;
  final imagePicker = ImagePicker();

  Future imagePickerMethod() async {
    final pic = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pic != null) {
        _image = File(pic.path);
      }
    });
 }


  @override

  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
