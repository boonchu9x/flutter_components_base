import 'package:flutter/material.dart';
import 'package:flutterbasecomponents/screens/dropdownbutton.dart';
import 'package:flutterbasecomponents/screens/homepage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Base Components',
    //not show banner debug
    debugShowCheckedModeBanner: false,
    home: DropDownButton(),
  ));
}
