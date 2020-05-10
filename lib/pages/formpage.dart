import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/pages/nextpage.dart';

class formpage extends StatefulWidget {
  @override
  _formpageState createState() => _formpageState();
}

class _formpageState extends State<formpage> {
  String Name;
  String Something;
  String SampleData;
  String Dimensions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),          
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Can you give us some details to serve you better?',
                style: TextStyle(
                  fontFamily: 'Circular Air',
                  fontSize: 25.0,
                ),
                ),
                Image.asset('assets/images/1.png'),
                new Container(
                  height:40.0,
                  width:350.0,
                  decoration:BoxDecoration(
                    color:Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset:Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name'
                    ),
                      onSubmitted: (value){
                        setState(() {
                          Name = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                new Container(
                  height:40.0,
                  width:350.0,
                  decoration:BoxDecoration(
                    color:Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset:Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Something',
                    ),
                      onSubmitted: (value){
                        setState(() {
                          Something = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                new Container(
                  height:40.0,
                  width:350.0,
                  decoration:BoxDecoration(
                    color:Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset:Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Sample Data'
                    ),
                      onSubmitted: (value){
                        setState(() {
                          SampleData = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                new Container(
                  height:40.0,
                  width:350.0,
                  decoration:BoxDecoration(
                    color:Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset:Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Dimensions'
                      
                    ),
                  onSubmitted: (value){
                    setState(() {
                      Dimensions = value;
                    });
                  },
                  ),
                ),
                    
                  
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      color: Colors.white,
                      child: new Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset:Offset(0.00,3.00),
                              color: Color(00000000).withOpacity(0.0),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        child: Text('Back',style: TextStyle(fontFamily: 'Circular Air',color:Color(0xff4a148c) ),),
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      color: Color(0xff4a148c),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset:Offset(0.00,3.00),
                              color: Color(0xff000000).withOpacity(0.16),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        child: Text('Submit',style: TextStyle(fontFamily: 'Circular Air',color:Colors.white ),),
                      ),
                      onPressed: () {
                 Firestore.instance.collection('app').add({
                  'name': Name,
                  'something': Something,
                  'sampledata': SampleData,
                  'dimensions': Dimensions,                  
                });
                Navigator.push(context,
                MaterialPageRoute(builder:(context)=> nextpage()));
                      }
                      )
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}