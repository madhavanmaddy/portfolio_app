// #import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class DetailsPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyDetailsPage(),
    );
  }
}

class MyDetailsPage extends StatefulWidget {
  MyDetailsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: new Text(
                "Topic displayed here",
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xff101010),
                ),
              ),
            ),
            Image.asset('assets/images/submit.png'),
            SizedBox(
              height: 25,
            ),
            Center(
              child: new Container(
                height: 700.00,
                width: 370.00,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.00, 3.00),
                      color: Color(0xff000000).withOpacity(0.09),
                      blurRadius: 30,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(33.00),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      
                
                      SizedBox(height: 25),
                      Text(
                        'Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(height: 30),
            SizedBox(height: 30),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
