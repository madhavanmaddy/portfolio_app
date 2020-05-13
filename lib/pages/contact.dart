import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/services/crud.dart';
import 'package:url_launcher/url_launcher.dart';


class Mycontact extends StatefulWidget {

  @override
  _MycontactState createState() => _MycontactState();
}

class _MycontactState extends State<Mycontact> {
  crudMethods crudObj = new crudMethods();

  QuerySnapshot uiuxprojects;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Contact',
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
                  Navigator.pushNamed(context, 'designpage');
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: <Widget>[
                  new Text(
                    "We'd love to hear from you",
                    style: TextStyle(
                      fontFamily: "Circular Air",
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xff101010),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: new Text(
                "Whether you have a question about features, trials, pricing, workflow processes, or anything else, our team is ready to answer all your questions",
                style: TextStyle(
                  fontFamily: "Circular Air",
                  // fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Color(0xff101010),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Image.asset('assets/images/contact.png'),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: Text(
                  '~ Connect us on ~ ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Circular Air",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff101010),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // SizedBox(width: 15,),
                    GestureDetector(
                      onTap: () => _callMe(),
                      child: Image.asset(
                        'assets/images/call.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _sendMail(),
                      child: Image.asset(
                        'assets/images/mail.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _launchWhatsApp(),
                      child: Image.asset(
                        'assets/images/whatsapp.png',
                        height: 80,
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _textMe(),
                      child: Image.asset(
                        'assets/images/sms.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),

            SizedBox(height: 30),
            // recentprojects(),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _launchWhatsApp() async {
    String phoneNumber = '917904748133';
    String message = 'Hello! Can you help me out ?';
    var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  _sendMail() async {
    const uri =
        'mailto:akillika49@gmail.com?subject=Support%20Needed&body=Place your query here\n';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  _textMe() async {
    const uri = 'sms:+91 7904748133';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  _callMe() async {
    const uri = 'tel:+91 7904748133';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
