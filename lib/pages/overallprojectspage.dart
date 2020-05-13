import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/services/crud.dart';
import 'package:portfolio/pages/projectdetailspage.dart';

class overallprojectspage extends StatefulWidget {
  @override
  _overallprojectspageState createState() => _overallprojectspageState();
}

class _overallprojectspageState extends State<overallprojectspage> {
  crudMethods crudObj = new crudMethods();

  int temp, temp2, temp4;
  double temp1, temp5, temp3;

  QuerySnapshot projects;
  QuerySnapshot designprojects;
  QuerySnapshot uiuxprojects;

  @override
  void initState() {
    crudObj.getdata().then((results) {
      setState(() {
        projects = results;
        temp = projects.documents.length;
        if (temp % 2 == 0) {
          temp = temp * 113;
          temp1 = temp.toDouble();
        } else {
          // temp = projects.documents.length;
          temp = temp + 1;
          temp = temp * 113;
          temp1 = temp.toDouble();
        }
        // temp = projects.documents.length;
        // temp = temp * 113;
        // temp1 = temp.toDouble();
      });
    });
    crudObj.getdatad().then((results) {
      setState(() {
        designprojects = results;
        temp2 = designprojects.documents.length;
        if (temp2 % 2 == 0) {
          temp2 = temp2 * 120;
          temp3 = temp2.toDouble();
        } else {
          // temp = projects.documents.length;
          temp2 = temp2 + 1;
          temp2 = temp2 * 120;
          temp3 = temp2.toDouble();
        }
        // temp2 = temp2 * 120;
        // temp3 = temp2.toDouble();
      });
    });
    crudObj.getdatau().then((results) {
      setState(() {
        uiuxprojects = results;
        temp4 = uiuxprojects.documents.length;
        if (temp4 % 2 == 0) {
          temp4 = temp4 * 120;
          temp5 = temp4.toDouble();
        } else {
          // temp = projects.documents.length;
          temp4 = temp4 + 1;
          temp4 = temp4 * 120;
          temp5 = temp4.toDouble();
        }
        // temp4 = temp4 * 120;
        // temp5 = temp4.toDouble();
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
          children: <Widget>[
            SizedBox(
              height: 75.0,
            ),
            SizedBox(
              child: GestureDetector(
                onTap: () {
                  crudObj.getdata().then((results) {
                    setState(() {
                      projects = results;
                    });
                  });
                  crudObj.getdatad().then((results) {
                    setState(() {
                      designprojects = results;
                    });
                  });
                  crudObj.getdatau().then((results) {
                    setState(() {
                      uiuxprojects = results;
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Icon(Icons.refresh),
                    alignment: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            new Text(
              'Mobile Applications',
              style: TextStyle(
                fontFamily: "Circular Air",
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xff101010),
              ),
            ),
            // SizedBox(
            //   height: 10.0,
            // ),
            SizedBox(
              height: temp1,
              child: oprojects(),
            ),
            SizedBox(
              height: 30.0,
            ),
            new Text(
              'Graphic Design / Illustarations',
              style: TextStyle(
                fontFamily: "Circular Air",
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xff101010),
              ),
            ),
            // SizedBox(
            //   height: 30.0,
            // ),
            SizedBox(
              height: temp3,
              child: odesignrojects(),
            ),
            SizedBox(
              height: 30.0,
            ),
            new Text(
              'UI/UX Designs',
              style: TextStyle(
                fontFamily: "Circular Air",
                 fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xff101010),
              ),
            ),
            SizedBox(
              height: temp5,
              child: ouiuxprojects(),
            ),
          ],
        ),
      ),
    );
  }

  Widget ouiuxprojects() {
    return uiuxprojects != null
        ? GridView.builder(
            primary: false,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                        uiuxprojects.documents[index].data['image']),
                    onPressed: () {
                      Navigator.pushNamed(context, 'nextpage');
                    },
                  ),
                ),
              );
            })
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget oprojects() {
    return projects != null
        ? GridView.builder(
            primary: false,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                    borderRadius: BorderRadius.circular(20.00),
                  ),
                  child: IconButton(
                    icon:
                        Image.network(projects.documents[index].data['image']),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyDetailsPage(
                                  projects.documents[index].data['title'],
                                  projects.documents[index].data['desc'])),
                        );
                    },
                  ),
                ),
              );
            })
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget odesignrojects() {
    return designprojects != null
        ? GridView.builder(
            primary: false,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: designprojects.documents.length,
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
                        designprojects.documents[index].data['image']),
                    onPressed: () {
                      Navigator.pushNamed(context, 'nextpage');
                    },
                  ),
                ),
              );
            })
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
