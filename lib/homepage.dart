import 'package:flutter/material.dart';
import 'pages/formpage.dart';
import 'pages/designpage.dart';

class MyApp extends StatelessWidget {
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 120),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: new Text(
              "Good morning,",
              style: TextStyle(
                fontFamily: "Circular Air",
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Color(0xff101010),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: new Text(
              "What do you want us to do ?",
              style: TextStyle(
                fontFamily: "Circular Air",
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Color(0xff101010),
              ),
            ),
          ),
          Image.asset('assets/images/home.png'),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp1()),
                );
              },
              child: new Container(
                height: 116.00,
                width: 350.00,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/images/flutter.png'),
                      SizedBox(
                        width: 15,
                      ),
                      new Text(
                        "Build Flutter applications",
                        style: TextStyle(
                          fontFamily: "Circular Air",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff101010),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp1()),
                );
              },
                          child: new Container(
                height: 116.00,
                width: 350.00,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/images/ps1.png'),
                      SizedBox(
                        width: 15,
                      ),
                      new Text(
                        "Play with designs",
                        style: TextStyle(
                          fontFamily: "Circular Air",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff101010),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: new Container(
              height: 116.00,
              width: 350.00,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/images/xd.png'),
                    SizedBox(
                      width: 15,
                    ),
                    new Text(
                      "User experience builder",
                      style: TextStyle(
                        fontFamily: "Circular Air",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff101010),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
