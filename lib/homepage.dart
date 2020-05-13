import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/overallprojectspage.dart';
import 'package:portfolio/pages/projectdetailspage.dart';
import 'package:portfolio/pages/thankyoupage.dart';
import 'package:portfolio/pages/uiuxpage.dart';
import 'pages/designpage.dart';
import 'forms/formpage.dart';
import 'package:flutter/painting.dart';
import 'pages/apppage.dart';
import 'pages/nextpage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'apppage': (_) => MyApp2(),
        'designpage': (_) => MyApp1(),
        'nextpage': (_) => nextpage(),
        'overallprojectspage': (_) => overallprojectspage(),
        'thankyoupage': (_) => MyThankyou(),
        'uiuxpage': (_) => UiuxPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
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
      //  backgroundColor: Color(0xFF198BAA),
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.symmetric(vertical: 40),
            children: <Widget>[
              // DrawerHeader(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 18.0),
              //     child: Center(
              //         child: Text(
              //           'Corona Virus Tracker ',
              //           style: TextStyle(fontSize: 27, color: Colors.white,fontWeight: FontWeight.bold),
              //         )),
              //   ),
              //   decoration: BoxDecoration(
              //       color: Colors.blue[500],
              //       //
              //       ),
              // ),
              SizedBox(height: 40),
              Image.asset('assets/images/menu.png'),
              SizedBox(height: 30),
              ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Recent projects',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Circular Air",
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'overallprojectspage');
                  }),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'apppage');
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'App development',
                        style: TextStyle(fontSize: 22),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'designpage');
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Graphic Design',
                        style: TextStyle(fontSize: 22),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'designpage');
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'UI/UX Design',
                        style: TextStyle(fontSize: 22),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactPage()),
                  );
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Contact us',
                        style: TextStyle(fontSize: 22),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'designpage');
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Developer Contact',
                        style: TextStyle(fontSize: 22),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: new Text(
                greetings(),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  Navigator.pushNamed(context, 'apppage');
                },
                child: new Container(
                  height: 116.00,
                  width: (MediaQuery.of(context).size.width) - 50,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/images/flutter.png'),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Build Flutter applications",
                              style: TextStyle(
                                fontFamily: "Circular Air",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff101010),
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "We help us to build efficient applications\nusing flutter. Enjoy the power of fast, \nefficient, super cool apps with iOS and\n web versions too.",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontFamily: "Circular Air",
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Color(0xff101010),
                              ),
                            ),
                          ],
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
                  Navigator.pushNamed(context, 'designpage');
                },
                child: new Container(
                  height: 116.00,
                  width: (MediaQuery.of(context).size.width) - 50,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/images/ps1.png'),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Play with designs",
                              style: TextStyle(
                                fontFamily: "Circular Air",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff101010),
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "We help us to build efficient applications\nusing flutter. Enjoy the power of fast, \nefficient, super cool apps with iOS and\nweb versions too.",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontFamily: "Circular Air",
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Color(0xff101010),
                              ),
                            ),
                          ],
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
                  Navigator.pushNamed(context, 'uiuxpage');
                },
                child: new Container(
                  height: 116.00,
                  width: (MediaQuery.of(context).size.width) - 50,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/images/xd.png'),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "User experience builder",
                              style: TextStyle(
                                fontFamily: "Circular Air",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff101010),
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "We help us to build efficient applications\nusing flutter. Enjoy the power of fast, \nefficient, super cool apps with iOS and\nweb versions too.",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontFamily: "Circular Air",
                                fontWeight: FontWeight.w600,
                                // height: 1.2,
                                fontSize: 10,
                                color: Color(0xff101010),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String greetings() {
    var now;
    now = DateTime.now().hour;
    if (now < 12) {
      return 'Good Morning,';
    } else if (now < 17) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }
}
