import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grouped Buttons Example',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> _checked = ["A","B"];
  String _picked = "Two";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grouped Buttons Example"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: <Widget>[

        // -------------------------
        // Simple useage example
        //--------------------------

        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: Text("Basics CheckboxGroup",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
            ),
          ),
        ),

        CheckboxGroup(
          labels: <String>[
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thuersday",
            "Friday",
            "Saturday",
          ],
          disabled: [
            "Wednesday",
             "Friday"
            ],
          onChange: (bool isChecked, String label, int index) => print("isCcked: $isChecked label: $label index: $index"),
          onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
        ),

        // Basic radiobuttongroup
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: Text("Basic RadioButtonGroup",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
          ),
        ),

        RadioButtonGroup(
          labels: [
            "Option 1",
            "Option 2",
          ],
          disabled: [
            "Oprion 1"
          ],
          onChange: (String label, int index) => print("label: $label index: $index"),
          onSelected: (String label) => print(label),
        ),

        /**
         * ----------------------------------
         *  Custom usage example
         *  ---------------------------------
         *
         *  CUSTOM CHECKBOX GROUP
         */
        Container(
          padding:  const EdgeInsets.only(left: 14.0, top:14.0, bottom: 14.0),
          child: Text("Custom CheckedbodGroup",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
          ),
        ),

        CheckboxGroup(
          orientation: GroupedButtonsOrientation.HORIZONTAL,
          margin: const EdgeInsets.only(left: 12.0),
          onSelected: (List selected) => setState((){
            _checked = selected;
          }),
          labels: <String>[
            "A",
            "B",
          ],

          checked: _checked,
          itemBuilder: (Checkbox cb, Text txt, int i){
            return Column(
              children: <Widget>[
                Icon(Icons.polymer),
                cb,
                txt,
              ],
            );
          },
        ),


        /**
         * Custom radiobutton group
         */

        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
          child: Text("Custom RadioButtonGroup",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
          ),
        ),

        RadioButtonGroup(
          orientation: GroupedButtonsOrientation.HORIZONTAL,
          margin: const EdgeInsets.only(left: 12.0),
          onSelected: (String selected) => setState((){
            _picked = selected;
          }),
          labels: <String>[
            "One",
            "Two",
          ],
          picked: _picked,
          itemBuilder: (Radio rb, Text txt, int i){
            return Column(
              children: <Widget>[
                Icon(Icons.public),
                rb,
                txt,
              ],
            );
        },
        ),
      ],
    );
  }
}
