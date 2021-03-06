import 'package:flutter/material.dart';
import '../shared/screenTitle.dart';
import '../shared/tripList.dart';

class NinjaTrips extends StatefulWidget {
  @override
  _NinjaTripsState createState() => _NinjaTripsState();
}

class _NinjaTripsState extends State<NinjaTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                SizedBox(
                  height: 160,
                  child: ScreenTitle(text: 'Paradise Trips'),
                ),
                Flexible(
                  child: TripList(),
                )
                //Sandbox(),
              ],
            )));
  }
}
