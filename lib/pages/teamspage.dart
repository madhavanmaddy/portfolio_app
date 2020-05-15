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
              SizedBox(height: 10.0),
              // Image.asset('assets/images/mockups.png'),
              SizedBox(height: 20.0),
              devs != null
                  ? SizedBox(
                      height: 1000.0,
                      child: ListView.builder(
                        itemCount: devs.documents.length,
                        itemBuilder: (_, index) {
                          return Material(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                            'assets/images/sms.png')),
                                    SizedBox(height: 15),
                                    Text(
                                      'Akil S',
                                      style: TextStyle(
                                        fontFamily: "Circular Air",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xff101010),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text('Graphic Designer')
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                            'assets/images/sms.png')),
                                    SizedBox(height: 15),
                                    Text(
                                      'Madhavan S',
                                      style: TextStyle(
                                        fontFamily: "Circular Air",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xff101010),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text('Graphic Designer'),
                                    SizedBox(height: 20),
                                  ],
                                ),
                                // Image.asset('assets/images/sms.png')
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
