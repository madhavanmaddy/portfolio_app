import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Portfolio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 120),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: new Text(
              "Good morning,",
              style: TextStyle(
                fontFamily: "Segoe UI",
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
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Color(0xff101010),
              ),
            ),
          ),
          Image.network('data:image/png;base64,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'),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
