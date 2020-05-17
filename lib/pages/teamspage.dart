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
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
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
                        fontSize: sw*0.05,
                      ))),
              SizedBox(height: 10.0),
              // Image.asset('assets/images/mockups.png'),
              SizedBox(height: 20.0),
              devsgrid(),
            ],
          ),
        ),
      ),
    );
  }
  Widget devsgrid(){
     return devs != null
        ? SizedBox(
            height: 750,
            
            child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
              ),
              itemCount: devs.documents.length,
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
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:10),
                       CircleAvatar(
                         radius: MediaQuery.of(context).size.width * 0.09,
                            backgroundImage: NetworkImage(
                                devs.documents[index].data['image']),
                          ),                                               
                        SizedBox(height:5),
                        Text(devs.documents[index].data['name'],style: TextStyle(fontSize:MediaQuery.of(context).size.width * 0.03),),
                        SizedBox(height:5),
                        Text(devs.documents[index].data['pos'],style: TextStyle(fontSize:MediaQuery.of(context).size.width * 0.03),),
                      ],
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

