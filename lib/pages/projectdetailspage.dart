
import 'package:flutter/material.dart';


class MyDetailsPage extends StatelessWidget {
  String title,desc;
  MyDetailsPage(this.title,this.desc);
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
                title,
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
                height: 700.00,
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
                      
                
                      SizedBox(height: 25),
                      Text(
                        desc,
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
              height: 15,
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
