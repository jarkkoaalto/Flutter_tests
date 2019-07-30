import 'package:flutter/material.dart';
import 'package:profider_demo_app/counter.dart';
import 'package:provider/provider.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer(
        builder: (context, Counter counter, _) => Scaffold(
          appBar: AppBar(
            title: Text("Provider Demo"),
          ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text('${counter.getCounter()}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: counter.increment,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                onPressed: counter.decrement,

                tooltip: 'Increment',
                child: Icon(Icons.remove),
              )
            ],
          ),
        ),
    );


  }
}
