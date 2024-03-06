import 'package:flutter/material.dart';
import 'package:smog_moloch/campaign_list.dart';
import 'state_container.dart';
import 'main_screen.dart';


void main() => runApp(new StateContainer(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "SMOG: Rise of Moloch Campaign Tracker",
      home: new MainScreen(),
      initialRoute: '/',
      routes: {
        '/list': (context) => CampaignList(),
      },
      theme: ThemeData(
        // Define the default Font Family
        //fontFamily: 'munson',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 36.0, fontFamily: 'victorian_parlor', fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 30.0, fontFamily: 'victorian_parlor', fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
          body2: TextStyle(fontSize: 14.0, fontFamily: 'munson', color: Colors.black54, fontWeight: FontWeight.normal),
          overline: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
          button: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
          caption: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
          display1: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
          display2: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
          display3: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
          display4: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
          subhead: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
          subtitle: TextStyle(fontSize: 18.0, fontFamily: 'munson',),
        ),
      ),
    );
  }
}

