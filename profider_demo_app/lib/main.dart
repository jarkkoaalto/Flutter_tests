import 'package:flutter/material.dart';
import 'package:profider_demo_app/counter.dart';
import 'package:profider_demo_app/homepage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
        builder: (_) => Counter(0),
        child: HomePage(),
      )
    );
  }
}

