import 'package:flutter/material.dart';

class nextpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          SizedBox(
              height: 100.0,
            ),
          Container(
            
            child: Text('This is an Example Thank you Page...',style: TextStyle(fontFamily: 'Circular Air',fontSize: 30.0),),
          ),
        ],
      )
    );
  }
}