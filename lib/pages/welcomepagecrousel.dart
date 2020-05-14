import 'package:flutter/material.dart';
import 'package:portfolio/homepage.dart';

class WelcomePageCrousel extends StatefulWidget {
  @override
  _WelcomePageCrouselState createState() => _WelcomePageCrouselState();
}

class _WelcomePageCrouselState extends State<WelcomePageCrousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hello'),
               RaisedButton(
                 child: Text('Lets Begin'),             
                 onPressed: (){
                   Navigator.push((context),MaterialPageRoute(builder: (context)=> MyHomePage()));
                 }),
            ],
          ),
        ],
      ),
    );
  }
}