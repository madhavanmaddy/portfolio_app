import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/services/crud.dart';
import 'package:portfolio/pages/projectdetailspage.dart';
import 'formpage.dart';
import 'nextpage.dart';
import 'thankyoupage.dart';

class UiuxPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
      
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Myuiux(),
    );
  }
}

class Myuiux extends StatefulWidget {
  Myuiux({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Myuiux> {
  crudMethods crudObj = new crudMethods();

  QuerySnapshot projects;

  @override
  void initState() {
    crudObj.getdata().then((results) {
      setState(() {
        projects = results;
      });
    });

    super.initState();
  }

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
                "Design is everywhere. \nFrom the dress you’re wearing to the smartphone you’re holding, it’s design.",
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xff101010),
                ),
              ),
            ),
            Image.asset('assets/images/uiux.png'),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'What are you planning to design: ',
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => formpage()));
                },
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
                    'Mobile Applications',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => formpage()));
                },
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
                    'Websites',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => formpage()));
                },
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
                    'Smart TV applications',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => formpage()));
                },
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
                    'Others',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recent Projects',
                    style: TextStyle(
                      fontFamily: "Circular Air",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff101010),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        crudObj.getdata().then((results) {});
                      }),
                ],
              ),
            ),
            SizedBox(height: 30),
            recentprojects(),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget recentprojects() {
    return projects != null
        ? SizedBox(
            height: 700.0,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
              ),
              itemCount: projects.documents.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
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
                    child: IconButton(
                      icon: Image.network(
                          projects.documents[index].data['image']),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage()),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
