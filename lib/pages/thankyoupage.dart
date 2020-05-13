// #import 'package:flutter/material.dart';
import 'package:portfolio/homepage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class MyThankPage1 extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyThankPage1> {
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
                "Sucessfully submitted your request",
                style: TextStyle(
                  fontFamily: "Circular Air",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xff101010),
                ),
              ),
            ),
            Image.asset('assets/images/submit.png'),
            SizedBox(
              height: 25,
            ),
            Center(
              child: new Container(
                height: 200.00,
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      Image.asset('assets/images/tick.png',height: 50,width: 50,),
                
                      SizedBox(height: 25),
                      Text(
                        'Our team of developers and designers will be reaching you soon! \nGet ready for some thing amazing!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
             Center(
              child: GestureDetector(
                onTap: (){
                   Navigator.pushNamed(context, 'homepage');
                },
                              child: new Container(
                  height: 40,
                  width: 200.00,
                
                  decoration: BoxDecoration(
                    color: Color(0xff4a148c),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.09),
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(33.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Center(
                        child:  Text(
                          'Back to home',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(height: 30),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
