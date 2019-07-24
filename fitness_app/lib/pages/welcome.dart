import 'package:flutter/material.dart';
import 'package:fitness_app/pages/dashboard.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
     backgroundColor: Colors.white,
     body: SingleChildScrollView(
       child: Container(
         
           padding: EdgeInsets.fromLTRB(25, 100, 25, 25),
           child: Center(
             child: Column(children: <Widget>[
               Image.asset('assets/images/illustration.png',
               width: 300,
               ),
               Padding(
                 padding: EdgeInsets.only(top:50),
                 ),
                 Text("Your Personal",
                 style: TextStyle(
                   color: Theme.of(context).accentColor,
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                 ),
                 ),
                 Text('Fitness Trainer'.toLowerCase(),style: TextStyle(
                   fontSize: 48,
                   color: Theme.of(context).primaryColor,
                   fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text('Lorem Ipsum is simply dummy text of the printing an typesetting industry...',
                    style: TextStyle(
                      color: Colors.grey,                  
                    ),
                    textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      ),
                     MaterialButton(
                       onPressed: () {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));
                       },
                       minWidth: double.infinity,
                       height: 50.0,
                       child: Text('Get Started'.toUpperCase()),
                       color: Theme.of(context).primaryColor,
                       textColor: Colors.white,
                       ),

                       Padding(padding: EdgeInsets.only(top: 10.0),
                       ),
                       MaterialButton(
                       onPressed: () {},
                       minWidth: double.infinity,
                       height: 50.0,
                       child: Text('Sign In'.toUpperCase()),
                       color: Theme.of(context).primaryColor,
                       textColor: Colors.white,
                       ),

             ],),
           ),
           
           ),
           ),
      
    );
  }
}