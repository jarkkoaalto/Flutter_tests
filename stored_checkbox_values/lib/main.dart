import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _selectedCategorys = List();
  int index;

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"wb_id": "1", "category_name": "Maastaveto", "sets":"0","reps":"0","weight":"0"},
      {"wb_id": "2", "category_name": "Farmers Walk", "sets":"0","reps":"0","weight":"0"},
      {"wb_id": "3", "category_name": "Etukyykky", "sets":"0","reps":"0","weight":"0"},
      {"wb_id": "4", "category_name": "Takakyykky", "sets":"0","reps":"0","weight":"0"}
    ],
    "responseTotalResult": 4
  };

  void _onCategorySelected(bool selected, wb_id) {
    if (selected == true) {
      setState(() {
        _selectedCategorys.add(wb_id);
        print(wb_id);
      });
    } else {
      setState(() {
        _selectedCategorys.remove(wb_id);
        print(wb_id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: _categories['responseTotalResult'],
          itemBuilder: (BuildContext context, int index) {
            return (CheckboxListTile(
              value: _selectedCategorys
                  .contains(_categories['responseBody'][index]['wb_id']),
              onChanged: (bool selected) {
                _onCategorySelected(
                    selected, _categories['responseBody'][index]['wb_id']);
              },
              title: Text(_categories['responseBody'][index]['category_name']),
            ));
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {

          });
      },
        label: Text('Lisää'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
