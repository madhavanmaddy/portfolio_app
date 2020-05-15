import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/services/crud.dart';

class teamspage extends StatefulWidget {
  @override
  _teamspageState createState() => _teamspageState();
}

class _teamspageState extends State<teamspage> {
  crudMethods crudObj = new crudMethods();

  QuerySnapshot devs;
  @override
  void initState() {
    crudObj.getdatadevs().then((results) {
      setState(() {
        devs = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Center(
                  child: Text('Development Team',
                      style: TextStyle(
                        fontSize: 25.0,
                      ))),
              SizedBox(height: 20.0),
              Image.asset('assets/images/mockups.png'),
              SizedBox(height: 20.0),
              devs != null
                  ? SizedBox(
                      height: 500.0,
                      child: ListView.builder(
                        itemCount: devs.documents.length,
                        itemBuilder: (_, index) {
                          return Material(
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                  devs.documents[index].data['image'],
                                  height: 150.0,
                                  width: 150.0,
                                ),
                                SizedBox(width: 20.0),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      devs.documents[index].data['name'],
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      devs.documents[index].data['pos'],
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
