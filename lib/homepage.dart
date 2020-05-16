import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/overallprojectspage.dart';
import 'package:portfolio/pages/teamspage.dart';
import 'package:portfolio/pages/thankyoupage.dart';
import 'package:portfolio/pages/uiuxpage.dart';
import 'package:portfolio/pages/welcomepagecrousel.dart';
import 'pages/apppage.dart';
import 'pages/designpage.dart';
import 'package:flutter/painting.dart';
import 'model/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'apppage': (_) => MyAppPage1(),
        'designpage': (_) => MyDesignPage1(),
        'overallprojectspage': (_) => overallprojectspage(),
        'thankyoupage': (_) => MyThankPage1(),
        'uiuxpage': (_) => MyuiuxPage(),
        'homepage': (_) => MyHomePage(),
        'teamspage': (_) => teamspage(),
      },
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MyHomePage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (context) => new WelcomePageCrousel()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: CircularProgressIndicator(),
      ),
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
  final FirebaseMessaging _messaging = FirebaseMessaging();
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _messaging.configure(onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
      final notification = message['notification'];
      setState(() {
        messages.add(
            Message(title: notification['title'], body: notification['body']));
      });
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch : $message");
    }, onResume: (Map<String, dynamic> message) async {
      print("onResume : $message");
    });
    _messaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color(0xFF198BAA),
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0), bottom: Radius.circular(20.0)),
        child: Drawer(
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
                    Navigator.pushNamed(context, 'teamspage');
                  },
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Teams',
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
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
                    Navigator.push(
                        context,
                        EnterExitRoute(
                            exitPage: MyHomePage(),
                            enterPage: MyDesignPage1()));
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
                    Navigator.push(
                        context,
                        EnterExitRoute(
                            exitPage: MyHomePage(), enterPage: MyuiuxPage()));
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
                      MaterialPageRoute(builder: (context) => Mycontact()),
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
              ],
            ),
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
                  Navigator.push(
                      context,
                      EnterExitRoute(
                          exitPage: MyHomePage(), enterPage: MyAppPage1()));
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
                                fontSize:
                                    (MediaQuery.of(context).size.width) * 0.04,
                                color: Color(0xff101010),
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "We help us to build efficient applications\nusing flutter. Enjoy the power of fast, \nefficient, super cool apps with iOS and \nweb versions too.",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontFamily: "Circular Air",
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    (MediaQuery.of(context).size.width) * 0.026,
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
                  Navigator.push(
                      context,
                      EnterExitRoute(
                          exitPage: MyHomePage(), enterPage: MyDesignPage1()));
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
                                fontSize:
                                    (MediaQuery.of(context).size.width) * 0.04,
                                color: Color(0xff101010),
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "Create super cool graphic designs \nbeyond your creativity and make your \nproducts reach a wider group of\naudience",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontFamily: "Circular Air",
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    (MediaQuery.of(context).size.width) * 0.026,
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
                  Navigator.push(
                      context,
                      EnterExitRoute(
                          exitPage: MyHomePage(), enterPage: MyuiuxPage()));
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
                                fontSize:
                                    (MediaQuery.of(context).size.width) * 0.04,
                                color: Color(0xff101010),
                              ),
                            ),
                            SizedBox(height: 7),
                            Expanded(
                              child: Text(
                                "Cool UI makes user to love your product \nmore. We hep us to make your products \nfunction smooth and user friendly and \nmake more out of your users.",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontFamily: "Circular Air",
                                  fontWeight: FontWeight.w600,
                                  // height: 1.2,
                                  fontSize:
                                      (MediaQuery.of(context).size.width) *
                                          0.025,
                                  color: Color(0xff101010),
                                ),
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
      return 'Good morning,';
    } else if (now < 17) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
    }
  }
}
