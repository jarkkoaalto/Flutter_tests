import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 10.0,
        backgroundColor: Colors.white,
      
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network('https://i.pravatar.cc/100',
                ),
                ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Julia Vins',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Feb 25, 2018', 
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 12,
                    ),
                    ),
                ],
                ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: 50,
                  child: Icon(Icons.notifications,
                  color: Theme.of(context).accentColor,
                  size: 35,
                  ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    width: 20,
                    height: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.red,
                         ),
                         width: 20,
                         height: 20,
                         child: Center(
                           child: Text( 
                             '03',
                             style: TextStyle( 
                               color: Colors.white,
                               fontSize: 9.0,

                             )
                           ),
                         ),
                    ),
                    )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding( 
          padding: EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 25.0),
          child: Container( 
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(100),
                  color: Theme.of(context).primaryColor.withAlpha(50),

                  ),

                  child: Image.asset( 
                    'assets/images/shoe.png',
                    width: 60,
                  ),
                ),
                Padding( 
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Text('6522',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                  ),
                  ),
                  Padding( 
                  padding: EdgeInsets.only(top: 15.0),
                  ),
                  Container( 
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('0 Steps'.toUpperCase(), 
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            ),
                            Text('9000 Steps'.toUpperCase(),
                            style: TextStyle(color: Colors.grey,
                            ),
                            ),
                          ],
                        ),
                        LinearPercentIndicator( 
                          lineHeight: 8.0,
                          percent: 0.7,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          backgroundColor: Theme.of(context).accentColor.withAlpha(30),
                          progressColor: Theme.of(context).primaryColor,
                        ),
                        Padding( 
                          padding: EdgeInsets.only(top:30),
                        ),
                        Text( 
                          'Steps Taken'.toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                             ),
                        ),
                        Text(
                          'You walked 165 min today',
                        style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16,
                        ),)
                      ],),
                  ),
                  Divider( 
                    height: 25,
                    color: Colors.grey[300],
                  ),
                  Container( 
                    child: Row(
                      children: <Widget>[
                        Expanded( 
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('DISTANCE', 
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              RichText( 
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: '8500',
                                    style: TextStyle(
                                      fontSize: 20, 
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                       ),
                                  ),
                                  TextSpan(
                                    text: ' m',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ) ),
                                ]),
                              )
                            ],
                          ),
                        ),
                         Expanded( 
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('CALORIES', 
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              RichText( 
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: '433',
                                    style: TextStyle(
                                      fontSize: 20, 
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                       ),
                                  ),
                                  TextSpan(
                                    text: ' cal',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                     ),
                                ],
                                ),
                              )
                            ],
                          ),
                        ),
                         Expanded( 
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('HEART RATE', 
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              RichText( 
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: '98',
                                    style: TextStyle(
                                      fontSize: 20, 
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                       ),
                                  ),
                                  TextSpan(
                                    text: ' bpm',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ) ),
                                ]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 25,
                  color: Colors.grey[300],
                  ),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('DIET PROGRESS',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Row(children: <Widget>[
                          Image.asset('assets/image/down_orange.png',
                          width: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                          ),
                          Text('500 Calories',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ],
                        ),
                        Container( 
                          height: 240,
                          padding: EdgeInsets.all(15.0),
                          child: ListView(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              StatCard(
                                title: 'Craps',
                                achieved:  200,
                                total: 350,
                                color: Colors.orange,
                                image: Image.asset('assets/images/bold.png',
                                width: 20,
                                ),
                              ),
                               StatCard(
                                title: 'Protein',
                                achieved:  350,
                                total: 300,
                                color: Colors.orange,
                                image: Image.asset('assets/images/fish.png',
                                width: 20,
                                ),
                              ),
                               StatCard(
                                title: 'Fats',
                                achieved:  100,
                                total: 200,
                                color: Colors.orange,
                                image: Image.asset('assets/images/sausage.png',
                                width: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                    ],)
              ],
              ),
          ),
        ),
      )

    );
  }
}

class StatCard extends StatelessWidget {

  final String title;
  final double total;
  final double achieved;
  final Image image;
  final Color color;

  const StatCard({
    Key key,
    @required this.title,
    @required this.total,
    @required this.achieved,
    @required this.image,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[200],
          width: 1, 
          ),
          borderRadius: BorderRadius.circular(5),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(title.toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).accentColor.withAlpha(100),
                fontSize: 14.0,
                ),
                ),
                achieved < total ? Image.asset('assets/images/down_orange.png',
                width: 20,
                )
                : Image.asset('assets/images/up_red.png',
                width: 20,
                )
            ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            CircularPercentIndicator( 
              radius: 80.0,
              lineWidth: 8.0,
              percent: achieved / (total < achieved ? achieved : total),
              circularStrokeCap: CircularStrokeCap.round,
              center: image,
              progressColor: color,
            ),
            Padding(padding: EdgeInsets.only(top: 25),
            ),
            RichText( 
              text: TextSpan(
                children: [
                  TextSpan(
                    text: achieved.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).accentColor,
                    ),
                  ),

                TextSpan(
                  text: ' / $total',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,

                    ),
                    ),

                ] ),
            )

         ],
         ),
    );
  }
}