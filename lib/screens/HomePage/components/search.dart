import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({
    Key ? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),

      child: TextField(
        decoration: InputDecoration(
            labelText: 'Search',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.deepPurpleAccent),
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}