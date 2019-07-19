import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


import 'package:global_variable_app/scoped_models/main.dart';
import 'package:global_variable_app/pages/page2.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel();

    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        title: 'Global variable Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,

        ),
        home: MyHomePage(title: "Flutter Global Variable Demo",),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
MyHomePage({Key key, this.title}) : super(key:key);

final String title;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Yuo have pushed the button thsi many times:",),
                Text('${model.count}',
                style: Theme.of(context).textTheme.display1,
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Page2>(
                          builder: (BuildContext context) => Page2()),
                    );
                  })
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(onPressed: (){
            model.incrementCount();
          },
          tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods
        );
      },
    );
  }
}

