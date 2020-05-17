import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class formpage extends StatefulWidget {
  String title;
  formpage(this.title);
  @override
  _formpageState createState() => _formpageState(title);
}

class _formpageState extends State<formpage> {
  _formpageState(this.title);
  String title;
  String projectName;
  String desc;
  String contactName;
  String contactNumber;
  String category;
  String special;
  int radioval;
  @override
  
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    final txtstle = TextStyle(
    fontFamily: 'Circular Air',
    fontSize: sw * 0.03,
  );
   final ctxtstle = TextStyle(
    fontFamily: 'Circular Air',
    fontSize: sw * 0.04,
  );
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 75.0,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Lets register your $title here',
                    // title,
                    style: TextStyle(
                      color: Color(0xff4a148c),
                      fontSize: sw*0.06,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // Text(
                //   'Can you give us some details to serve you better?',
                //   style: txtstle,
                // ),
                Image.asset('assets/images/1.png'),
                SizedBox(
                  height: 30,
                ),
                Text('Project Details',
                    style: TextStyle(
                      color: Color(0xff4a148c),
                      fontFamily: 'Circular Air',
                      fontSize: sw*0.05,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 40.0,
                  width: sw*0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Project Name',hintStyle: txtstle),
                      onChanged: (value) {
                        setState(() {
                          projectName = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 150.0,
                  width: sw*0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Project Description',hintStyle: txtstle),
                      onChanged: (value) {
                        setState(() {
                          desc = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 150.0,
                  width: sw*0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Special Features (if any)',hintStyle: txtstle),
                      onChanged: (value) {
                        setState(() {
                          special = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Category of application',
                  style: TextStyle(
                    color: Color(0xff4a148c),
                    fontFamily: 'Circular Air',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RadioListTile(
                  value: 1,
                  activeColor: Color(0xff4a148c),
                  groupValue: radioval,
                  onChanged: (val) {
                    setState(() {
                      radioval = val;
                      category = 'Entertainment';
                    });
                  },
                  title: new Text('Entertainment',style: ctxtstle),
                ),
                RadioListTile(
                  value: 2,
                  activeColor: Color(0xff4a148c),
                  groupValue: radioval,
                  onChanged: (val) {
                    setState(() {
                      radioval = val;
                      category = 'Tools';
                    });
                  },
                  title: new Text('Tools',style: ctxtstle),
                ),
                RadioListTile(
                  value: 3,
                  activeColor: Color(0xff4a148c),
                  groupValue: radioval,
                  onChanged: (val) {
                    setState(() {
                      radioval = val;
                      category = 'Social';
                    });
                  },
                  title: new Text('Social',style: ctxtstle),
                ),
                RadioListTile(
                  value: 4,
                  activeColor: Color(0xff4a148c),
                  groupValue: radioval,
                  onChanged: (val) {
                    setState(() {
                      radioval = val;
                      category = 'Others';
                    });
                  },
                  title: new Text('Others',style: ctxtstle),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Contact Details',
                  style: TextStyle(
                    color: Color(0xff4a148c),
                    fontFamily: 'Circular Air',
                    fontSize: sw*0.05,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 40.0,
                  width: sw*0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Name',hintStyle: txtstle),
                      onChanged: (value) {
                        setState(() {
                          contactName = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 40.0,
                  width: sw*0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Mobile Number',hintStyle: txtstle),
                      onChanged: (value) {
                        setState(() {
                          contactNumber = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 40.0,
                  width: sw*0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Email',hintStyle: txtstle),
                      onChanged: (value) {
                        setState(() {
                          contactNumber = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        color: Colors.white,
                        child: new Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.00, 3.00),
                                color: Color(00000000).withOpacity(0.0),
                                blurRadius: 6,
                              )
                            ],
                          ),
                          child: Text(
                            'Back',
                            style: TextStyle(
                                fontSize: sw*0.03,
                                fontFamily: 'Circular Air',
                                color: Color(0xff4a148c)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      new RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          color: Color(0xff4a148c),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.00, 3.00),
                                  color: Color(0xff000000).withOpacity(0.16),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: sw*0.03,
                                  fontFamily: 'Circular Air',
                                  color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            Firestore.instance.collection('app').add({
                              'projectName': projectName,
                              'desc': desc,
                              'special': special,
                              'contactName': contactName,
                              'contactNumber': contactNumber,
                              'category': category,
                            });
                            Navigator.pushNamed(context, 'thankyoupage');
                            setState(() {
                              projectName = '';
                              desc = '';
                              special = '';
                              contactName = '';
                              contactNumber = '';
                              category = '';
                            });
                          })
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            SizedBox(
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
