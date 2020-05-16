import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/uiuxpage.dart';

import 'package:portfolio/services/crud.dart';
import 'package:portfolio/pages/projectdetailspage.dart';
import 'package:portfolio/forms/formpage.dart';

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

class MyAppPage1 extends StatefulWidget {
  MyAppPage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyAppPage1> {
  crudMethods crudObj = new crudMethods();

  QuerySnapshot projects;
  double temp31;
  int temp21;

    
  @override
  void initState() {
     
    crudObj.getdata().then((results) {
      setState(() {
        projects = results;
        temp21 = projects.documents.length;
        if (temp21 % 2 == 0) {
          temp21 = temp21 * 120;
          temp31 = temp21.toDouble();
        } else {
          // temp = projects.documents.length;
          temp21 = temp21 + 1;
          temp21 = temp21 * 120;
          temp31 = temp21.toDouble();
        }
        print('$temp31');
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
     double sh = MediaQuery.of(context).size.height;
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
            padding: EdgeInsets.symmetric(vertical: sh*0.05),
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
              SizedBox(height: sh*0.025),
              Image.asset('assets/images/menu.png'),
              SizedBox(height: sh*0.035),
              ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Recent projects',
                        style: TextStyle(
                          fontSize: sw*0.05,
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
                        style: TextStyle(fontSize: sw*0.05),
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
                        style: TextStyle(fontSize: sw*0.05),
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
                        style: TextStyle(fontSize: sw*0.05),
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
                            exitPage: MyAppPage1(), enterPage: MyuiuxPage()));
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'UI/UX Design',
                        style: TextStyle(fontSize: sw*0.05),
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
                        style: TextStyle(fontSize: sw*0.05),
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
            SizedBox(height: sh*0.02),
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
                  fontSize: sw*0.06,
                  color: Color(0xff101010),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(width:sw*0.05),
                Image.asset('assets/images/android.png',height: sh*0.4,width: sw*0.9,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Choose your type of product: ',
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: sw*0.038,
                  color: Color(0xff101010),
                ),
              ),
            ),
            SizedBox(
              height: sh*0.02,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      EnterExitRoute(
                          exitPage: MyAppPage1(),
                          enterPage: formpage('Commercial Application')));
                },
                // },
                child: new Container(
                  height: sh*0.06,
                  width: sw*0.85,
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
            ),
            SizedBox(
              height: sh*0.02,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      EnterExitRoute(
                          exitPage: MyAppPage1(),
                          enterPage: formpage('Non Commercial Application')));
                },
                child: new Container(
                  height: sh*0.06,
                  width: sw*0.85,
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
            ),
            SizedBox(height: sh*0.035),
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
                      fontSize: sw*0.038,
                      color: Color(0xff101010),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        crudObj.getdata().then((results) {
                          setState(() {
                            projects = results;
                            temp21 = projects.documents.length;
                            if (temp21 % 2 == 0) {
                              temp21 = temp21 * 120;
                              temp31 = temp21.toDouble();
                            } else {
                              // temp = projects.documents.length;
                              temp21 = temp21 + 1;
                              temp21 = temp21 * 120;
                              temp31 = temp21.toDouble();
                            }
                            print('$temp31');
                          });
                        });
                      }),
                ],
              ),
            ),
            SizedBox(height: sh*0.035),
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
            height: temp31,
            width: (MediaQuery.of(context).size.width)*0.90,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
                          projects.documents[index].data['image'],
                          height: (MediaQuery.of(context).size.height)*0.2,
                          width: (MediaQuery.of(context).size.height)*0.4,),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => MyDetailsPage(
                        //           projects.documents[index].data['title'],
                        //           projects.documents[index].data['desc'])),
                        // );
                        Navigator.push(
                            context,
                            EnterExitRoute(
                                exitPage: MyAppPage1(),
                                enterPage: MyDetailsPage(
                                    projects.documents[index].data['title'],
                                    projects.documents[index].data['desc'],
                                    projects.documents[index].data['image']
                                    )));
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
