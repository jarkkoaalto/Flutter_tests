import 'package:flutter/material.dart';
import 'package:reset_checkboxes_app/resetcheckbox.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResetCheckBox(),
    );
  }
}
