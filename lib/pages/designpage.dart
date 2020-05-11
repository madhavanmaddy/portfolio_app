import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class MyApp1 extends StatelessWidget {
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
      home: MyDesignPage1(),
    );
  }
}

class MyDesignPage1 extends StatefulWidget {
  MyDesignPage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyDesignPage1> {
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
              "Hey there,",
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
              "Every great design begins with an even better story",
              style: TextStyle(
                fontFamily: "Circular Air",
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Color(0xff101010),
              ),
            ),
          ),
          Image.asset('assets/images/Design.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('What do you want us to design ?',
            style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff101010),
                ),),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: 10),
                new Container(
                  height: 116.00,
                  width: 100.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.05),
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(33.00),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/xd.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Posters'),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                new Container(
                  height: 116.00,
                  width: 100.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.05),
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(33.00),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/xd.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Illustrations'),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                new Container(
                  height: 116.00,
                  width: 100.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.05),
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(33.00),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/xd.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Banners'),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                new Container(
                  height: 116.00,
                  width: 100.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.05),
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(33.00),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/xd.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Templates'),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                new Container(
                  height: 116.00,
                  width: 100.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.05),
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(33.00),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/xd.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Mockups'),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                new Container(
                  height: 116.00,
                  width: 100.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.05),
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(33.00),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/xd.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Ads'),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                new Container(
                  height: 116.00,
                  width: 100.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.05),
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(33.00),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/xd.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Others'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
