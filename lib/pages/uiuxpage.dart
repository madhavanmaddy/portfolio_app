import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/forms/uiuxformpage.dart';
import 'package:portfolio/pages/apppage.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/projectdetailspage.dart';
import 'package:portfolio/services/crud.dart';

class MyuiuxPage extends StatefulWidget {
  @override
  _MyUiuxPageState createState() => _MyUiuxPageState();
}

class _MyUiuxPageState extends State<MyuiuxPage> {
  crudMethods crudObj = new crudMethods();

  QuerySnapshot uiuxprojects;
  int temp2;
  double temp3;
  @override
  void initState() {
    crudObj.getdatau().then((results) {
      setState(() {
        uiuxprojects = results;
        temp2 = uiuxprojects.documents.length;
        if (temp2 % 2 == 0) {
          temp2 = temp2 * 120;
          temp3 = temp2.toDouble();
        } else {
          // temp = projects.documents.length;
          temp2 = temp2 + 1;
          temp2 = temp2 * 120;
          temp3 = temp2.toDouble();
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.0), bottom: Radius.circular(40.0)),
        child:  Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.vertical,
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.symmetric(vertical: sh * 0.05),
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
                SizedBox(height: sh * 0.025),
                Image.asset('assets/images/menu.png'),
                SizedBox(height: sh * 0.035),
                ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Recent projects',
                          style: TextStyle(
                            fontSize: sw * 0.04,
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
                          style: TextStyle(fontSize: sw * 0.04),
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
                          style: TextStyle(fontSize: sw * 0.04),
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
                          style: TextStyle(fontSize: sw * 0.04),
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
                          style: TextStyle(fontSize: sw * 0.04),
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
                          style: TextStyle(fontSize: sw * 0.04),
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: new Text(
                "Design is everywhere. \nFrom the dress you’re wearing to the smartphone you’re holding, it’s design.",
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: sw*0.05,
                  color: Color(0xff101010),
                ),
              ),
            ),
            Image.asset('assets/images/uiux.png',height: sh*0.35,width: sw*0.9,),
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
                  fontSize: sw*0.04,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              uiuxformpage('UI / UX for Mobile Applications')));
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
                    style: TextStyle(
                      fontSize: sw*0.035,
                      fontWeight: FontWeight.bold),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              uiuxformpage('UI / UX for Websites')));
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
                    style: TextStyle(
                      fontSize: sw*0.035,
                      fontWeight: FontWeight.bold),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => uiuxformpage(
                              'UI / UX for Smart TV Applications')));
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
                    style: TextStyle(
                      fontSize: sw*0.035,
                      fontWeight: FontWeight.bold),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              uiuxformpage('Other UI / UX Projects')));
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
                    style: TextStyle(
                      fontSize: sw*0.035,
                      fontWeight: FontWeight.bold),
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
                      fontSize: sw*0.04,
                      color: Color(0xff101010),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        crudObj.getdatau().then((results) {
                          setState(() {
                            uiuxprojects = results;
                            temp2 = uiuxprojects.documents.length;
                            if (temp2 % 2 == 0) {
                              temp2 = temp2 * 120;
                              temp3 = temp2.toDouble();
                            } else {
                              // temp = projects.documents.length;
                              temp2 = temp2 + 1;
                              temp2 = temp2 * 120;
                              temp3 = temp2.toDouble();
                            }
                          });
                        });
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
    return uiuxprojects != null
        ? SizedBox(
            height: temp3,
            child: GridView.builder(
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
              ),
              itemCount: uiuxprojects.documents.length,
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
                      borderRadius: BorderRadius.circular(20.00),
                    ),
                    child: IconButton(
                      icon: Image.network(
                          uiuxprojects.documents[index].data['image'],
                          height: (MediaQuery.of(context).size.height)*0.2,
                          width: (MediaQuery.of(context).size.height)*0.4,
                          ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            EnterExitRoute(
                                exitPage: MyuiuxPage(),
                                enterPage: MyDetailsPage(
                                    uiuxprojects.documents[index].data['title'],
                                    uiuxprojects.documents[index].data['desc'],
                                    uiuxprojects.documents[index].data['image']
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
