import 'package:flutter/material.dart';

class ResetCheckBox extends StatefulWidget {
  @override
  _ResetCheckBoxState createState() => _ResetCheckBoxState();
}

class _ResetCheckBoxState extends State<ResetCheckBox> {

  bool _isChecked = true;

  _onReset(){
    setState(() {
      _isChecked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Checkbox Example"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: CheckboxListTile(
                  title: Text("Checkbox Text"),
                  value: _isChecked,
                  onChanged: (val){
                    setState(() {
                      _isChecked = val;
                    });
                  },
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: RaisedButton(
                  onPressed: _onReset,
              child: Text("Reset"),
              color: Colors.red,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
