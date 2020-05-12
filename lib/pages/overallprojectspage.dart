import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/services/crud.dart';

import 'nextpage.dart';

class overallprojectspage extends StatefulWidget {
  @override
  _overallprojectspageState createState() => _overallprojectspageState();
}

class _overallprojectspageState extends State<overallprojectspage> {
  crudMethods crudObj = new crudMethods();

  QuerySnapshot projects;
  QuerySnapshot designprojects;
  QuerySnapshot uiuxprojects;

  @override
  void initState() {
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
              'App Projects',
              style: TextStyle(
                fontFamily: "Circular Air",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff101010),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 500.0,
              child: oprojects(),
            ),
            SizedBox(
              height: 30.0,
            ),
            new Text(
              'Design Projects',
              style: TextStyle(
                fontFamily: "Circular Air",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff101010),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 500.0,
              child: odesignrojects(),
            ),
            SizedBox(
              height: 30.0,
            ),
            new Text(
              'UI/UX Projects',
              style: TextStyle(
                fontFamily: "Circular Air",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff101010),
              ),
            ),
            SizedBox(
              height: 500.0,
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
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: uiuxprojects.documents.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: projects.documents.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: IconButton(
                    icon:
                        Image.network(projects.documents[index].data['image']),
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

  Widget odesignrojects() {
    return designprojects != null
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: designprojects.documents.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
