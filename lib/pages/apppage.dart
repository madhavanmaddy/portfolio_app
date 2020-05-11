import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class MyApp2 extends StatelessWidget {
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
      home: MyAppPage1(),
    );
  }
}

class MyAppPage1 extends StatefulWidget {
  MyAppPage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyAppPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 120),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: new Text(
            //     "Welcome,",
            //     style: TextStyle(
            //       fontFamily: "Circular Air",
            //       fontWeight: FontWeight.w600,
            //       fontSize: 22,
            //       color: Color(0xff101010),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: new Text(
                "We make it work, make it right, make it fast.",
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xff101010),
                ),
              ),
            ),
            Image.asset('assets/images/android.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Choose your type of product: ',
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff101010),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: new Container(
                height: 50.00,
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
                child: Center(
                    child: Text(
                  'Commercial Application',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: new Container(
                height: 50.00,
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
                child: Center(
                    child: Text(
                  'Non Commercial Application',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Recent Projects',
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff101010),
                ),
              ),
            ),
            SizedBox(height:30),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
